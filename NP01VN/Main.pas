unit Main;
{$WARN UNIT_PLATFORM OFF}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, Buttons, DBTables, IniFiles, StrUtils, AppEvnts,
  UserAccess;

type
  TForm1 = class(TForm)
    ButtonSelectDir: TButton;
    ButtonOpenDoc: TButton;
    BitBtnExit: TBitBtn;
    OpenDialog1: TOpenDialog;
    btn2: TSpeedButton;
    mmo1: TMemo;
    btnRun: TSpeedButton;
    btnPdxRepair: TSpeedButton;
    aplctnvnts1: TApplicationEvents;
    btnZip: TSpeedButton;
    btnUnZip: TSpeedButton;
    dlgOpenZip: TOpenDialog;
    dlgSaveZip: TSaveDialog;
    procedure ButtonSelectDirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnExitClick(Sender: TObject);
    procedure ButtonOpenDocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn2Click(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure btnPdxRepairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnZipClick(Sender: TObject);
    procedure btnUnZipClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    function GetQuarter: Integer;
    procedure GetTableNames;
    { Private declarations }
  public
    { Public declarations }
    function GetQuartal(const t: TDate = 0): Integer;
    function GetQuartalByMonth(const i: Byte): Integer;
    function GetMonthOfQuartal(const i: Byte): Integer;
    function GetNextQuartal(const i: Byte): Integer;
    function QuartalPack: Boolean;
    function TableFieldTest(aTable: TTable; const aFieldName: string): Boolean;
  end;

const
  TaskName: string = 'NP01VN';
  MainFrmCaption: string = 'NP01VN';

var
  Form1: TForm1;
  StartDir, WorkName, Workname_2, OutputFile, JournalDir, ArhivTMSDir,
    ArhivChertDir: string;
  sDocName, ExtApplication: string;
  FontSize, ChertFontSize, PaperOrientation, PaperSize: Integer;
  Quarter: Integer;
  Quart: Integer;
  Ini: TMemIniFile;
  DebugMod: Boolean;
  PageBreakTMC: Boolean; //разделять ли страницы с ТМЦ и изделиями в Excel
  ShowExcel: Boolean; // показывать Excel во время генерации отчета
  Basespdo: string;
  PLTables, PlTablesIZ: array of string[200];
  NSTables: array[0..1] of string[200];
  LogDir, sDocHead_1, sDocHead_2, sDocHead_3, sDocHead_4: string;
  PrivDir, sExchPrimech, sExchTitle, sCodList, sDivList: string;
  ShowTips, bPrintShifr, bExchPrimech, bExchTitle, bAutoSave: Boolean;
  sNP01VN01exe, sNP01VN02exe, sNP01VN01dir, sNP01VN02dir: string;
  EiList: TStringList;
  TemplateList: TStringList;
  CurrentQuarter, iAutoSaveSec: Integer;
  LocalStorage: string;
  sBD06UL, sNS03, sNS02NCH, sSM50: string;
  isTest, isChangeOpt: Boolean;
  UsrAcs: TNP01VNAccess;
  ExcelColumnWidth: array[1..12] of real;
  ExcelColumnHAlign: array[1..12] of integer;

procedure FormBorderRange(Forma: TForm; const WidthBorder, HeightBorder:
  Integer);

implementation

uses Index, ASU_DBF, KoaUtils, DateUtils, Constants, Param, ShellAPI, SAVLib,
  Ost, sevenzip, jvspin;

{$R *.dfm}

procedure FormBorderRange(Forma: TForm; const WidthBorder, HeightBorder:
  Integer);
begin
  if Forma.Width < WidthBorder then
    Forma.Width := WidthBorder;
  if Forma.Height < HeightBorder then
    Forma.Height := HeightBorder;
end;

procedure TForm1.ButtonSelectDirClick(Sender: TObject);
var
  OutputFileName: string;
  s, s1: string;
  i: Integer;
  TaskName1: string;
  hFile: Cardinal;
begin
  if OutputFile <> '' then
  begin
    s := ExtractFileDir(OutputFile);
    OpenDialog1.InitialDir := s;
    DateTimetostring(s1, 'mm.yy', Date);
    s := 'NP01VN_' + s1 + '_1.xls';
    i := 1;
    while FileExists(OpenDialog1.InitialDir + '\' + s) = True do
    begin
      inc(i);
      s := 'NP01VN_' + s1 + '_' + inttostr(i) + '.xls';
    end;
    OpenDialog1.FileName := s;
  end;
  if (OpenDialog1.Execute) then
  begin
    OutputFileName := OpenDialog1.FileName;
    WorkName := ExtractFileName(OutputFileName);
    if (WorkName <> '') then
    begin
      WorkName := LeftStr(WorkName, Length(WorkName) - 4);
      TaskName1 := AnsiUpperCase(Copy(WorkName, 1, 6));
      if (Length(WorkName) < 6) or (TaskName1 <> TaskName) then
      begin
        WorkName := TaskName + '_' + WorkName;
      end
      else
        WorkName := TaskName + Copy(WorkName, 7, 200);
      { DONE : Закончить создание файла Excel }
      ButtonOpenDoc.Enabled := True;
      CreateDir(StartDir + WorkName);
      OutputFile := ExtractFilePath(OutputFileName) + WorkName + '.xls';
      hFile := CreateFile(PChar(OutputFile), GENERIC_WRITE, 0, nil, CREATE_NEW,
        FILE_ATTRIBUTE_NORMAL, 0);

      if (hFile <> INVALID_HANDLE_VALUE) then
        CloseHandle(hFile);
      isChangeOpt := True;
    end
    else
      ButtonOpenDoc.Enabled := False;
  end;
  ButtonSelectDir.Caption := 'Имя файла' + #$D + #$0A + WorkName;
end;

//проверка наличия поля в таблице

function TForm1.TableFieldTest(aTable: TTable; const aFieldName: string):
  Boolean;
var
  temp_table: TTable;
begin
  temp_table := TTable.Create(Self);
  temp_table.TableType := aTable.TableType;
  temp_table.TableName := aTable.TableName;
  temp_table.DatabaseName := aTable.DatabaseName;
  temp_table.ReadOnly := True;
  temp_table.Open;
  Result := temp_table.FieldList.Find(aFieldName) <> nil;
  temp_table.Close;
  FreeAndNil(temp_table);
end;

{Запуск внешнего приложения
@param(S Путь к запускаемому приложению)}

procedure Start(const s: string; waitf: Boolean = True);
var
  si: TStartupInfo;
  p: TProcessInformation;
begin
  FillChar(Si, SizeOf(Si), 0);
  with Si do
  begin
    cb := SizeOf(Si);
    dwFlags := startf_UseShowWindow;
    wShowWindow := SW_HIDE;
  end;
  if Createprocess(nil, PAnsiChar(s), nil, nil, false,
    Create_default_error_mode, nil, nil, si, p) then
  begin
    if waitf = True then
      Waitforsingleobject(p.hProcess, infinite)
  end
  else if waitf
    = True then
    CloseHandle(p.hProcess);
end;

// архивация старого журнала

function TForm1.QuartalPack: Boolean;
var
  s, s1: string;
begin
  s := StartDir + csArhivPath;
  if not DirectoryExists(s) then
    if not ForceDirectories(s) then
    begin
      //     Result := False;
      ShowMessage('Нет доступа к директории архива');
      Abort;
    end;
  s1 := csArhivRun + s + FormatDateTime('dd_mm_yyy-hh_nn', Now) + csArcExt + ' '
    + StartDir + csDataPath;
  Start(s1);
  Result := True;
end;

function TForm1.GetQuarter(): Integer;
var
  si: ASU_SI;
begin
  si := GetSI(GetPath(BasesPdo, 'pl01.dbf') + 'pl01.dbf');
  Result := StrToInt(si.si_text[1]);
end;

function TForm1.GetMonthOfQuartal(const i: Byte): Integer;
begin
  Result := ((i - 1) mod 3) + 1
end;

function TForm1.GetQuartalByMonth(const i: Byte): Integer;
begin
  Result := ((i - 1) div 3) + 1
end;

function TForm1.GetNextQuartal(const i: Byte): Integer;
begin
  if i < 4 then
    Result := succ(i)
  else
    Result := 1;
end;

function TForm1.GetQuartal(const t: TDate = 0): Integer;
var
  t01: TDate;
begin
  if t = 0 then
    t01 := Date
  else
    t01 := t;
  Result := GetQuartalByMonth(MonthOf(t01))
end;

procedure TForm1.GetTableNames;
var
  I, iYear: Integer;
  sArc, spth: string;
begin
  iYear := YearOf(Date);
  SetLength(PLTables, 4);
  SetLength(PlTablesIZ, 4);
  sArc := GetArc(Basespdo, 'pl01.dbf');
  sArc := StringReplace(sArc, '*', IntToStr(iYear), []);
  for I := 1 to Quarter - 1 do
  begin
    PLTables[I - 1] := sArc + 'pl01k' + IntToStr(I) + '.dbf';
    PlTablesIZ[I - 1] := sArc + 'pl01k' + IntToStr(I) + 'i.dbf';
  end;
  sArc := GetPath(BasesPdo, 'pl01.dbf');
  PLTables[Quarter - 1] := sArc + 'pl01.dbf';
  PLTablesIZ[Quarter - 1] := sArc + 'pl01iz.dbf';
  for I := Quarter + 1 to 4 do
  begin
    sArc := GetArc(Basespdo, 'pl01k' + IntToStr(I) + '.dbf');
    sArc := StringReplace(sArc, '*', IntToStr(iYear - 1), []);
    PLTables[I - 1] := sArc + 'pl01k' + IntToStr(I) + '.dbf';
    PlTablesIZ[I - 1] := sArc + 'pl01k' + IntToStr(I) + 'i.dbf';
  end;
  NSTables[0] := GetPath(BasesPdo, 'ns01ks.dbf') + 'ns01ks.dbf';
  spth := GetArc(BasesPdo, 'ns01ks.dbf') + 'ns01ksk' + inttostr(CurrentQuarter)
    + '.dbf';
  i := Pos('*', spth);
  NSTables[1] := Copy(spth, 1, i - 1) + IntToStr(CurYear) + Copy(spth, i + 1,
    Length(spth) - i);
  spth := GetPath(BasesPdo, 'pl01.db');
  sBD06UL := GetPath(BasesPdo, 'bd06ul.dbf') + 'bd06ul.dbf';
  sNS03 := GetPath(BasesPdo, 'ns03.dbf') + 'ns03.dbf';
  sNS02NCH := GetPath(BasesPdo, 'ns02nch.dbf') + 'ns02nch.dbf';
  sSM50 := GetPath(BasesPdo, 'sm50.dbf') + 'sm50.dbf';
  Ost.GetZehList(Ost.ZehList1);
end;

function FileTimeToDateTime(FileTime: TFileTime): TDateTime;
var
  SystemTime: TSystemTime;
begin
  FileTimeToLocalFileTime(FileTime, FileTime);
  FileTimeToSystemTime(FileTime, SystemTime);
  Result := SystemTimeToDateTime(SystemTime);
end;

// Возвращает дату изменения файла

function GetFileModifInfo(const FileName: string): TDateTime;
var
  FileAttributeData: TWin32FileAttributeData;
begin
  ZeroMemory(@FileAttributeData, SizeOf(TWin32FileAttributeData));
  GetFileAttributesEx(PAnsiChar(FileName), GetFileExInfoStandard,
    @FileAttributeData);
  Result := FileTimeToDateTime(FileAttributeData.ftLastWriteTime);
end;

// Заполняет текст массив единиц измерения

procedure FillEizmList(const dbfilename: string);
var
  t1: TTable;
begin
  t1 := TTable.Create(nil);
  t1.TableName := dbfilename;
  t1.Open;
  EiList.Clear;
  while not (t1.Eof) do
  begin
    EiList.Add(t1.FieldByName('EI').AsString + '=' +
      t1.FieldByName('NAIM').AsString);
    t1.Next;
  end;
  t1.Close;
  FreeAndNil(t1);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  IniFilePath, SM07PathLoc, SM07PathNet, mypath: string;
  SeiName, NetFileDir, s: string;
  aDirExst: Boolean;
  i: integer;
begin
  CurYear := YearOf(Date);
  mypath := ExtractFilePath(Application.ExeName);
  aDirExst := True;
  isChangeOpt := False;
  CurrentQuarter := GetQuartal;
  try
    LocalStorage := SAVLib.GetSpecialFolderLocation(CSIDL_APPDATA,
      FOLDERID_RoamingAppData) + 'NEVZ\OASUP\NP01VN';
    if ParamCount > 0 then
      LocalStorage := IncludeTrailingPathDelimiter(LocalStorage) + ParamStr(1);
    if not (DirectoryExists(LocalStorage)) then
    begin
      if not (ForceDirectories(LocalStorage)) then
      begin
        ShowMessage('Нет доступа к каталогу пользовательских настроек');
        Application.Terminate;
        aDirExst := False;
      end;
    end;
    if aDirExst then
    begin
      LocalStorage := IncludeTrailingPathDelimiter(LocalStorage);
      CopyFromCurDirIfExist(LocalStorage, csIniFileName);
      CopyFromCurDirIfExist(LocalStorage, 'NP01VN-01.txt');
      CopyFromCurDirIfExist(LocalStorage, 'sm07st.db');
      CopyFromCurDirIfExist(LocalStorage, 'np01vn_chklst1.ini');
      IniFilePath := LocalStorage + csIniFileName;
      Ini := TMemIniFile.Create(IniFilePath);
      StartDir := Ini.ReadString(csIniLocation, 'startdir', LocalStorage);
      NetFileDir := Ini.ReadString(csIniLocation, 'netfiledir',
        '\\nevz\nevz\ASUP_Data1\BD-ASU\NET\');
      { внешние модули }
      sNP01VN01exe := Ini.ReadString(csIniLocation, 'np01vn01_exe',
        '\\nevz\nevz\ASUP_Data1\LWS\prg_dlph\NP01VN01.exe');
      sNP01VN02exe := Ini.ReadString(csIniLocation, 'np01vn02_exe',
        '\\nevz\nevz\ASUP_Data1\LWS\prg_dlph\NP01VN02.exe');
      sNP01VN01dir := Ini.ReadString(csIniLocation, 'np01vn01_dir', 'C:\lws');
      sNP01VN02dir := Ini.ReadString(csIniLocation, 'np01vn02_dir', 'C:\lws');
      {  //  }
      PageBreakTMC := Ini.ReadBool(csIniSheet, 'pagebreak', True);
      ShowExcel := Ini.ReadBool(csIniSheet, 'show', True);
      WorkName := Ini.ReadString(csIniLocation, 'workname', '');
      Basespdo := Ini.ReadString(csIniLocation, 'basespdo',
        'K:\SYSTEM\Bases.dbf');
      s := Ini.ReadString(csIniLocation, 'divisions',
        ExtractFilePath(Application.ExeName) + 'np01vn_division.ini');
      UsrAcs := TNP01VNAccess.Create(s);
      UsrAcs.Division := Ini.ReadInteger(csIniOption, 'division', 0);
      Caption := MainFrmCaption + '  Подразделение: ' + UsrAcs.DivisionStr;
      OutputFile := Ini.ReadString(csIniLocation, 'outputfile', '');
      FontSize := Ini.ReadInteger(csIniSheet, 'fontsize', 10);
      ChertFontSize := Ini.ReadInteger(csIniSheet, 'chertfontsize', 14);
      PaperSize := Ini.ReadInteger(csIniSheet, 'papersize', 9);
      PaperOrientation := Ini.ReadInteger(csIniSheet, 'paperorientation', 2);
      bExchPrimech := Ini.ReadBool(csIniSheet, 'exchange_primech', True);
      bExchTitle := Ini.ReadBool(csIniSheet, 'exchange_title', True);
      sExchPrimech := Ini.ReadString(csIniSheet, 'exchange_primech_text', '"-');
      sExchTitle := Ini.ReadString(csIniSheet, 'exchange_title_text', '"-');
      bPrintShifr := Ini.ReadBool(csIniSheet, 'print_title', False);
      bAutoSave := Ini.ReadBool(csIniService, 'autosave', False);
      iAutoSaveSec := Ini.ReadInteger(csIniService, 'autosave_time', 180);
      Quart := Ini.ReadInteger(csIniService, 'quartal', CurrentQuarter + 1);
      DebugMod := Ini.ReadBool(csIniService, 'debug', False);
      isTest := Ini.ReadBool(csIniService, 'test_mode', False);
      ShowTips := Ini.ReadBool(csIniService, 'show_tips', True);
      ExtApplication := Ini.ReadString(csIniLocation, 'ext_app', '');
      NetDir := Ini.ReadString(csIniLocation, 'netdir', 'K:\PDO\' + TaskName +
        '\');
      sDocHead_1 := Ini.ReadString(csIniTemplates, 'dest_pos', csDocHead_1);
      sDocHead_2 := Ini.ReadString(csIniTemplates, 'dest_name', csDocHead_2);
      sDocHead_3 := Ini.ReadString(csIniTemplates, 'sign_pos', '');
      sDocHead_4 := Ini.ReadString(csIniTemplates, 'sign_name', '');
      ArhivTMSDir := Ini.ReadString(csIniLocation, csIniTMSArhiv,
        csIniTMSArhivDef);
      ArhivChertDir := Ini.ReadString(csIniLocation, csIniChertArhiv,
        csIniChertArhivDef);
      NetDir42 := Ini.ReadString(csIniLocation, 'netdir42', 'K:\PDO\' + TaskName
        + '\42\');
      JournalDir := Ini.ReadString(csIniLocation, 'journaldir', StartDir +
        csDataPath);
      LogDir := Ini.ReadString(csIniLocation, csIniLogDir, csIniLogDirDef);
      for i := 1 to 12 do
      begin
        ExcelColumnWidth[i] := ini.ReadFloat(csIniSheet, 'colwidth' +
          inttostr(i), 0.0);
        ExcelColumnHAlign[i] := ini.ReadInteger(csIniSheet, 'colhalign' +
          inttostr(i), 0);
      end;
      if FileExists(mypath + 'np01vn.txt') = true then
      begin
        mmo1.Visible := True;
        try
          mmo1.Lines.LoadFromFile(mypath + 'np01vn.txt');
        except
        end;
      end;
      if not FileExists(Basespdo) then
        fAddNetDisk(K);
      ButtonSelectDir.Caption := 'Имя файла' + #$D + #$0A + WorkName;
      ////////////////////////////////////////////////////////////////////////////
      Quarter := GetQuarter();
      ButtonOpenDoc.Enabled := (WorkName <> '');
      LogDir := IncludeTrailingBackslash(LogDir);
      SetBDEConfig(NetFileDir, PrivDir);
      GetTableNames();
      EiList := TStringList.Create;
      TemplateList := TStringList.Create;
      if FileExists(LocalStorage + 'NP01VN-01.txt') = True then
        TemplateList.LoadFromFile(LocalStorage + 'NP01VN-01.txt')
      else
      begin
        TemplateList.Text :=
          #13#13#13#13#13#13#13#13'--'#13'Первые 8 строк значимы в соотв с кодом'#13'MM - месяц'#13'QQ - квартал'#13'YY - год';
        try
          TemplateList.SaveToFile(LocalStorage + 'NP01VN-01.txt');
        except
        end;
      end;
      SM07PathLoc := LocalStorage + 'sm07st.db';
      SM07PathNet := GetPath(Basespdo, 'sm07st.db') + 'sm07st.db';
      if FileExists(SM07PathLoc) = True then
      begin
        if CompareDate(GetFileModifInfo(SM07PathLoc),
          GetFileModifInfo(SM07PathNet)) <> 0 then
        begin
          try
            fDeleteFile(SM07PathLoc);
          except
          end;
          fCopyFile(SM07PathNet, SM07PathLoc);
          FillEizmList(SM07PathLoc);
        end
        else
        begin
          SeiName := LocalStorage + 'NP01VN.sei';
          if FileExists(SeiName) = True then
          begin
            try
              EiList.LoadFromFile(SeiName);
              if EiList.Text = '' then
                FillEizmList(SM07PathLoc);
            except
              FillEizmList(SM07PathLoc);
            end
          end
          else
          begin
            FillEizmList(SM07PathLoc);
            try
              EiList.SaveToFile(SeiName);
            except
            end
          end
        end
      end
      else
      begin
        fCopyFile(SM07PathNet, SM07PathLoc);
        FillEizmList(SM07PathLoc);
      end;
      if ExtApplication <> '' then
        form1.btnRun.Visible := True;
      if FileExists(mypath + '7z.dll') then
      begin
        btnZip.Visible := True;
        btnUnZip.Visible := True;
      end;
    end;
  except
    on E: Exception do
    begin
      MessageBox(0, PChar(E.Message), nil, MB_ICONERROR);
      Application.MessageBox('При инициализации приложения произошла ошибка!',
        nil);
      Application.Terminate;
    end;
  end;

end;

procedure TForm1.BitBtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ButtonOpenDocClick(Sender: TObject);
begin
  if not (DirectoryExists(StartDir + WorkName)) then
  begin
    if Application.MessageBox('Возможно настройки программы не корректны!'
      + #13#10 + 'Создать новый каталог документа?',
      'Каталог документа не существует', MB_YESNOCANCEL +
      MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
      CreateDir(StartDir + WorkName)
    else
      Exit;
  end;
  if DirectoryExists(Main.StartDir + csTempPath) then
    KoaUtils.fRemoveDir(Main.StartDir + csTempPath);
  FormIndex.btn1.Visible := not (UsrAcs.Shortened);
  FormIndex.N6.Visible := UsrAcs.CodInAccess('1') or UsrAcs.CodInAccess('6') or
    UsrAcs.CodInAccess('7') or UsrAcs.CodInAccess('8');
  FormIndex.N7.Visible := UsrAcs.CodInAccess('1');
  FormIndex.N3.Visible := UsrAcs.CodInAccess('3') or UsrAcs.CodInAccess('4');
  if FormIndex.N3.Visible then
  begin
    FormIndex.NYear1.Visible := UsrAcs.CodInAccess('3');
    FormIndex.N11.Visible := UsrAcs.CodInAccess('4');
    FormIndex.NQuart.Visible := UsrAcs.CodInAccess('4');
  end;
  FormIndex.N4.Visible := (UsrAcs.CodInAccess('5')) and (not (UsrAcs.Snyatie));
  FormIndex.btn1.Visible := FormIndex.N4.Visible or FormIndex.N3.Visible;
  FormIndex.N8.Visible := UsrAcs.CodInAccess('6');
  FormIndex.N9.Visible := UsrAcs.CodInAccess('7');
  FormIndex.N10.Visible := UsrAcs.CodInAccess('8');
  FormIndex.btnOPiUTMC.Visible := UsrAcs.Snyatie;
  FormIndex.ShowModal;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  if isChangeOpt then
  begin
    Ini.WriteString(csIniLocation, csIniWorkname, WorkName);
    Ini.WriteString(csIniLocation, 'outputfile', OutputFile);
    Ini.WriteString(csIniLocation, 'basespdo', Basespdo);
    Ini.WriteString(csIniLocation, 'startdir', StartDir);
    Ini.WriteBool(csIniService, 'debug', DebugMod);
    Ini.WriteBool(csIniService, 'autosave', bAutoSave);
    Ini.WriteInteger(csIniService, 'autosave_time', iAutoSaveSec);
    Ini.WriteBool(csIniService, 'show_tips', ShowTips);
    Ini.WriteBool(csIniService, 'test_mode', isTest);
    Ini.WriteString(csIniLocation, 'netdir', NetDir);
    Ini.WriteString(csIniLocation, 'netdir42', NetDir42);
    Ini.WriteString(csIniLocation, 'journaldir', JournalDir);
    Ini.WriteString(csIniLocation, csIniLogDir, LogDir);
    Ini.DeleteKey(csIniLocation, 'tms_arhiv');
    Ini.WriteInteger(csIniService, 'quartal', Quart);
    Ini.WriteInteger(csIniSheet, 'fontsize', FontSize);
    Ini.WriteInteger(csIniSheet, 'chertfontsize', ChertFontSize);
    Ini.WriteInteger(csIniSheet, 'papersize', PaperSize);
    Ini.WriteInteger(csIniSheet, 'paperorientation', PaperOrientation);
    Ini.WriteBool(csIniSheet, 'print_title', bPrintShifr);
    Ini.WriteBool(csIniSheet, 'pagebreak', PageBreakTMC);
    Ini.WriteBool(csIniSheet, 'show', ShowExcel);
    Ini.WriteBool(csIniSheet, 'exchange_primech', bExchPrimech);
    Ini.WriteBool(csIniSheet, 'exchange_title', bExchTitle);
    Ini.WriteString(csIniSheet, 'exchange_primech_text', sExchPrimech);
    Ini.WriteString(csIniSheet, 'exchange_title_text', sExchTitle);
    Ini.WriteString(csIniOption, 'division', UsrAcs.DivisionStr);
    Ini.WriteString(csIniLocation, 'ext_app', ExtApplication);
    Ini.WriteString(csIniLocation, csIniTMSArhiv, ArhivTMSDir);
    Ini.WriteString(csIniTemplates, 'dest_pos', sDocHead_1);
    Ini.WriteString(csIniTemplates, 'dest_name', sDocHead_2);
    Ini.WriteString(csIniTemplates, 'sign_pos', sDocHead_3);
    Ini.WriteString(csIniTemplates, 'sign_name', sDocHead_4);
    for i := 1 to 12 do
    begin
      ini.WriteFloat(csIniSheet, 'colwidth' + inttostr(i), ExcelColumnWidth[i]);
      ini.WriteInteger(csIniSheet, 'colhalign' + inttostr(i),
        ExcelColumnHAlign[i]);
    end;
    if mmo1.Lines.Count > 0 then
      Ini.WriteString('update', 'firstline', mmo1.Lines[0]);
    Ini.UpdateFile;
  end;
  FreeAndNil(Ini);
  EiList.SaveToFile(LocalStorage + 'NP01VN.sei');
  FreeAndNil(EiList);
  FreeAndNil(TemplateList);
  RemoveDir(PrivDir);
  if Assigned(UsrAcs) then
    FreeAndNil(UsrAcs);
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  i: Integer;
begin
  FmParam := TFmParam.Create(Application);
  if PaperOrientation = 1 then
    FmParam.cbb1.ItemIndex := 0
  else
    FmParam.cbb1.ItemIndex := 1;
  if PaperSize = 9 then
    FmParam.cbb2.ItemIndex := 0
  else
    FmParam.cbb2.ItemIndex := 1;
  if TemplateList.Count > 7 then
    for i := 0 to 7 do
      FmParam.strngrd1.Cells[1, i] := TemplateList[i];
  FmParam.strngrd1.Cells[0, 0] := 'План квартал';
  FmParam.strngrd1.Cells[0, 1] := 'Строка';
  FmParam.strngrd1.Cells[0, 2] := 'Лимит ТМЦ месяц';
  FmParam.strngrd1.Cells[0, 3] := 'Лимит ТМЦ квартал';
  FmParam.strngrd1.Cells[0, 4] := 'Ост. лимита ТМЦ мес.';
  FmParam.strngrd1.Cells[0, 5] := 'План и лимит кварт';
  FmParam.strngrd1.Cells[0, 6] := 'Лимит кварт';
  FmParam.strngrd1.Cells[0, 7] := 'Ост. лимита месяц';
  FmParam.strngrd1.ColWidths[0] := 120;
  FmParam.strngrd1.ColWidths[1] := 500;
  FmParam.chk1.Checked := PageBreakTMC;
  FmParam.chk2.Checked := ShowExcel;
  FmParam.chk3.Checked := ShowTips;
  FmParam.chkAutoSave.Checked := bAutoSave;
  FmParam.seAutoSave.Enabled := bAutoSave;
  FmParam.seAutoSave.Value := iAutoSaveSec;
  FmParam.chkPrintShifr.Checked := bPrintShifr;
  FmParam.se1.Value := FontSize;
  FmParam.se2.Value := ChertFontSize;
  FmParam.se3.Value := UsrAcs.Division;
  FmParam.edt3.Text := ExtApplication;
  FmParam.chkExchenPrimech.Checked := bExchPrimech;
  FmParam.chkExchenTitle.Checked := bExchTitle;
  FmParam.edtPrimech.Text := sExchPrimech;
  FmParam.edtTitle.Text := sExchTitle;
  FmParam.edtPrimech.Enabled := bExchPrimech;
  FmParam.edtTitle.Enabled := bExchTitle;
  FmParam.edtDolgnostAdres.Text := sDocHead_1;
  FmParam.edtFIOAdres.Text := sDocHead_2;
  FmParam.edtDolgnostPodpis.Text := sDocHead_3;
  FmParam.chkTest.Checked := isTest;
  FmParam.edtFIOPodpis.Text := sDocHead_4;
  for i := 1 to 12 do
  begin
    (FmParam.FindComponent('jvspined' + inttostr(i)) as TJvSpinEdit).Value :=
      ExcelColumnWidth[i];
    (FmParam.FindComponent('cbbHAlign' + inttostr(i)) as TComboBox).ItemIndex :=
      ExcelColumnHAlign[i];
  end;
  FmParam.ShowModal();
  FreeAndNil(FmParam);
end;

procedure TForm1.btnRunClick(Sender: TObject);
begin
  ShellExecute(Handle, 'Open', PAnsiChar(ExtApplication), nil, nil,
    SW_SHOWNORMAL);
end;

procedure TForm1.btnPdxRepairClick(Sender: TObject);
var
  s01, s02: string;
  procedure LockButtn(const Perekluch: Boolean);
  begin
    ButtonSelectDir.Enabled := Perekluch;
    ButtonOpenDoc.Enabled := Perekluch;
    btnPdxRepair.Enabled := Perekluch;
    btn2.Enabled := Perekluch;
    btnRun.Enabled := Perekluch;
    BitBtnExit.Enabled := Perekluch;
    Application.ProcessMessages;
  end;
begin
  if (DirectoryExists(StartDir + WorkName)) then
  begin
    if
      Application.MessageBox(PAnsiChar('Необходимость исправления таблиц может появится в случае повреждения структуры и/или содержимого таблиц в результате некорректного завершения работы программы.'
      + #13#10 +
      'Перед запуском восстановления таблиц рекомендуется перезапустить NP01VN !!!' + #13#10
      + #13#10 + 'Запустить исправление таблиц для документа "' + WorkName +
      '" ?'),
      'Исправление таблиц', MB_YESNOCANCEL + MB_ICONWARNING + MB_DEFBUTTON2) =
      IDYES then
    begin
      LockButtn(False);
      s01 := ExtractFilePath(Application.ExeName) + 'Pdxrbld.exe';
      s02 := '"/F' + StartDir + WorkName + '" -R1 -P+ -Q+';
      ShellExecute(Handle, 'Open', PAnsiChar(s01), PAnsiChar(s02),
        PAnsiChar(LocalStorage),
        SW_HIDE);
      ShowMessage('Исправление таблиц выполнено!');
      LockButtn(True);
    end
  end
  else
    ShowMessage('В документе ' + WorkName + ' нет таблиц');
end;

procedure TForm1.FormShow(Sender: TObject);
var
  s: string;
  i: Integer;
begin
  s := Ini.ReadString('update', 'firstline', '');
  if (mmo1.Lines.Count > 0) and (s <> mmo1.Lines[0]) then
  begin
    i := 0;
    s := '';
    while (i < mmo1.Lines.Count) and (Trim(mmo1.Lines[i]) <> '') do
    begin
      s := s + mmo1.Lines[i] + #10#13;
      Inc(i);
    end;
    Application.MessageBox(PAnsiChar(s), 'Программа обновлена', MB_OK +
      MB_ICONINFORMATION + MB_DEFBUTTON2);
    isChangeOpt := True;
  end
end;

procedure TForm1.btnZipClick(Sender: TObject);
var
  Arch: I7zOutArchive;
begin
  dlgSaveZip.FileName := WorkName + '.np01doc';
  if dlgSaveZip.Execute then
  begin
    if FileExists(dlgSaveZip.FileName) then
      DeleteFile(dlgSaveZip.FileName);
    btnZip.Enabled := False;
    try
      Arch := CreateOutArchive(CLSID_CFormat7z);
      Arch.AddFiles(StartDir + WorkName, '',
        '*.db;*.px;*.xg0;*.yg0;*.txt;*.val', true);
      SetCompressionLevel(Arch, 7);
      Arch.SetPassword(TaskName);
      Arch.SaveToFile(dlgSaveZip.FileName);
    finally
      btnZip.Enabled := True;
    end;
  end;
end;

procedure TForm1.btnUnZipClick(Sender: TObject);
var
  s, s1: string;
  b: Boolean;
  hFile: Cardinal;
  OutputFileName: string;

  function GetWithoutExt(const aSource: string): string;
  var
    i, n: Integer;
  begin
    n := Length(aSource);
    i := pred(n);
    while (i > 0) and (aSource[i] <> '.') do
      Dec(i);
    if i = 0 then
      Result := aSource
    else
      Result := Copy(aSource, 1, pred(i));
  end;

begin
  if dlgOpenZip.Execute then
  begin
    s1 := ExtractFileName(dlgOpenZip.FileName);
    s1 := GetWithoutExt(s1);
    s := s1;
    b := True;
    while s = s1 do
    begin
      b := InputQuery('Импорт документа',
        'Укажите желаемое наименование документа', s1);
      s1 := Trim(s1);
      if b then
        if s1 = '' then
          s1 := s
        else if DirectoryExists(StartDir + s1) then
        begin
          ShowMessage('Документ ' + s1 +
            ' уже существует, или существовал ранее и был не корректно удален. Введите другое наименование.');
          s1 := s;
        end

    end;
    if b then
      with CreateInArchive(CLSID_CFormat7z) do
      begin
        ButtonOpenDoc.Enabled := False;
        btnUnZip.Enabled := False;
        SetPassword(TaskName);
        OpenFile(dlgOpenZip.FileName);
        ExtractTo(StartDir + s1);
        WorkName := s1;
        ButtonOpenDoc.Enabled := True;
        btnUnZip.Enabled := True;
        OutputFile := ExtractFilePath(OutputFileName) + WorkName + '.xls';
        hFile := CreateFile(PChar(OutputFile), GENERIC_WRITE, 0, nil,
          CREATE_NEW,
          FILE_ATTRIBUTE_NORMAL, 0);
        if (hFile <> INVALID_HANDLE_VALUE) then
          CloseHandle(hFile);
        ButtonSelectDir.Caption := 'Имя файла' + #$D + #$0A + WorkName;
      end;
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  FormBorderRange(Self, 220, 335);
end;

end.

