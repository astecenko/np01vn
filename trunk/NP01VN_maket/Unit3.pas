unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, DBGrids, DB, FileCtrl,
  DBTables, dbgrideh;

const
  csArcDataDir = 'Data';
  csArcJrnlDir = 'Jrnl';

type
  TForm3 = class(TForm)
    BitBtn1: TBitBtn;
    ListBox1: TListBox;
    Query_add_field_NP01F0: TQuery;
    BitBtn2: TBitBtn;
    btn1: TBitBtn;
    btn2: TBitBtn;
    lst1: TListBox;
    lbl1: TLabel;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TBitBtn;
    btn7: TSpeedButton;
    chkArhiv: TCheckBox;
    mmo1: TMemo;
    procedure FormActivate(Sender: TObject);

    // procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
     //  var CanSelect: Boolean);
   //  procedure StringGrid1DblClick(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn6Click(Sender: TObject);

  private
    { Private declarations }
  public
    function SelDirParam(s: string): string;
    procedure GetDeptName;
    procedure ShowJournal(arhiv: Boolean = False);
  end;

var
  Form3: TForm3;
  f: TSearchRec;
  i: integer;
  pyt: string;
  n_line, quart, linecount: integer;
  name_file: string;
  name_dir: string;
  NetDir42, NetDirP1, BaseNetDir42, BaseNetDirP1, ArhivDir: string;
  StartDir, WorkName, Workname_2, OutputFile: string;
  NetDir, JournalDir, NetDirArc, JournalDirArc, backup_dir: string;
  Basespdo: string;
  UseJournal, SheetMultiSelect: Boolean;
  PrivDir: string;
  LocalStorage: string;
  // если True открывали из журнала, иначе открывали по старому

procedure Start(const s: string);
implementation

uses Unit1, Unit2, Journal, IniFiles, Constants, DateUtils, KoaUtils, Param,
  Unit9, SAVLib, ArcDir;

{$R *.dfm}

function MyRemoveDir(sDir: string): Boolean;
var
  iIndex: Integer;
  SearchRec: TSearchRec;
  sFileName: string;
begin
  //  Result := False;
  sDir := sDir + '\*.*';
  iIndex := FindFirst(sDir, faAnyFile, SearchRec);
  while iIndex = 0 do
  begin
    sFileName := ExtractFileDir(sDir) + '\' + SearchRec.Name;
    if SearchRec.Attr = faDirectory then
    begin
      if (SearchRec.Name <> '') and (SearchRec.Name <> '.') and (SearchRec.Name
        <> '..') then
        MyRemoveDir(sFileName);
    end
    else
    begin
      if SearchRec.Attr <> faArchive then
        FileSetAttr(sFileName, faArchive);
      if not DeleteFile(sFileName) then
        ShowMessage('Could NOT delete ' + sFileName);
    end;
    iIndex := FindNext(SearchRec);
  end;
  FindClose(SearchRec);
  RemoveDir(ExtractFileDir(sDir));
  Result := True;
end;

function TForm3.SelDirParam(s: string): string;
var
  dir: string;
begin
  Result := s;
  dir := copy(s, 1, Length(s) - 1);
  if SelectDirectory(dir, [sdAllowCreate, sdPerformCreate], 0) = True then
  begin
    if dir[Length(dir)] <> '\' then
      Result := dir + '\'
    else
      Result := dir;
  end;
end;

function GetQuartalByMonth(const i: Byte): Integer;
begin
  Result := ((i - 1) div 3) + 1
end;

function GetNextQuartal(const i: Byte): Integer;
begin
  if i < 4 then
    Result := i + 1
  else
    Result := 1;
end;

function GetQuartal(const t: TDate = 0): Integer;
var
  //  i: Integer;
  t01: TDate;
begin
  if t = 0 then
    t01 := Date
  else
    t01 := t;
  Result := GetQuartalByMonth(MonthOf(t01))
end;

procedure TForm3.GetDeptName;
var
  IniDept: TIniFile;
begin
  IniDept := TIniFile.Create(LocalStorage + 'np01vn_dept.ini');
  IniDept.ReadSections(lst1.Items);
  FreeAndNil(IniDept);
end;

procedure TForm3.FormActivate(Sender: TObject);
var
  Ini: TMemIniFile;
  i: integer;
  s, fp1: string;

begin
  GetDeptName;
  Ini := TMemIniFile.Create(LocalStorage + 'np01vn.ini');
  fp1 := ExtractFilePath(Application.ExeName);
  StartDir := Ini.ReadString('location', 'startdir', fp1);
  WorkName := Ini.ReadString('location', 'workname', '');
  //    Quart := Ini.ReadInteger('service', 'quartal', CurrentQuarter + 1);
  //  DebugMod := Ini.ReadBool('service', 'debug', False);
  //    JournalClean(Quart);
  ArhivDir := Ini.ReadString('location', 'netdir', NetDir + csArhivPath);
  BaseNetDir42 := Ini.ReadString('location', 'netdir42', 'K:\PDO\NP01VN\42\');
  BaseNetDirP1 := Ini.ReadString('location', 'netdirp1', 'K:\PDO\NP01VN\P1\');
  Basespdo := Ini.ReadString('location', 'basespdo', 'K:\SYSTEM\Bases.dbf');
  Width := Ini.ReadInteger('window', 'width', 440);
  Height := Ini.ReadInteger('window', 'height', 300);
  Left := Ini.ReadInteger('window', 'left', 100);
  Top := Ini.ReadInteger('window', 'top', 100);
  s := Ini.ReadString('update', 'firstline', '');
  try
    mmo1.Lines.LoadFromFile(fp1 + 'np01vn_maket.txt');
  except
  end;
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
  end;
  linecount := Ini.ReadInteger('sheet', 'linecount', 4);
  SheetMultiSelect := Ini.ReadBool('sheet', 'multiselect', True);
  if (linecount < 1) or (linecount > 15) then
    linecount := 4;
  Quart := Ini.ReadInteger('service', 'quartal', GetQuartal + 1);
  FreeAndNil(ini);
end;

{procedure TForm3.StringGrid1Click(Sender: TObject);
begin
pyt:='K:\PDO\NP01VN\'+Trim(StringGrid1.Rows[n_line].Text);
form1.Table_NP01F0.DatabaseName:=pyt;
Form1.Table_NP01F0.TableName:='NP01F0.db';
Form1.Table_NP01F0.Active:=True;
form2.Table_NP01FN.DatabaseName:=pyt;
Form1.ShowModal;
end;   }

{procedure TForm3.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 n_line:=ARow;

end; }

{procedure TForm3.StringGrid1DblClick(Sender: TObject);
begin
pyt:='K:\PDO\NP01VN\'+Trim(StringGrid1.Rows[n_line].Text);
form1.Table_NP01F0.DatabaseName:=pyt;
Form1.Table_NP01F0.TableName:='NP01F0.db';
Form1.Table_NP01F0.Active:=rue;
form2.Table_NP01FN.DatabaseName:=pyt;
Form1.ShowModal;
end;  }

procedure TForm3.ListBox1DblClick(Sender: TObject);
begin
  UseJournal := False;
  name_file := '';
  pyt := 'K:\PDO\NP01VN\' + Trim(ListBox1.Items.Strings[ListBox1.itemindex]);
  name_dir := 'K:\PDO\NP01VN\' + ListBox1.Items.Strings[ListBox1.itemindex] + '\'
    + ListBox1.Items.Strings[ListBox1.itemindex];
  if FindFirst(pyt + '\NP01F0.db', faAnyFile, f) = 0 then
    name_file := f.Name;
  FindClose(f);
  if name_file <> '' then
  begin
    Session.NetFileDir := pyt;
    Session.PrivateDir := ExtractFilePath(Application.EXEName);
    form1.Table_NP01F0.DatabaseName := pyt;
    Form1.Table_NP01F0.TableName := 'NP01F0.db';
    Form1.Table_NP01F0.Active := True;
    form2.Table_NP01FN.DatabaseName := pyt;
    //Form1:=TForm1.Create(Self);
    if Form1.Table_NP01F0.RecordCount <> 0 then
    begin
      if Form1.Table_NP01F0.FieldCount < 8 then
      begin
        Form1.Table_NP01F0.Active := False;
        Query_add_field_NP01F0.DatabaseName := pyt;
        Query_add_field_NP01F0.Close;
        Query_add_field_NP01F0.Prepare;
        Query_add_field_NP01F0.ExecSQL;
        Query_add_field_NP01F0.Close;
      end;
      Form1.Table_NP01F0.Active := True;
      Form1.ShowModal
    end
    else
    begin
      Form1.Table_NP01F0.Active := False;
      Form1.Table_NP01F0.TableName := '';
      form1.Table_NP01F0.DatabaseName := '';
      form2.Table_NP01FN.DatabaseName := '';
      MessageDlg('Файл со списком корректировок пустой', mtError, [mbOK], 0);
    end;
  end
  else
    MessageDlg('Список корректировок отсутствует', mtCustom, [mbOK], 0);
end;

procedure TForm3.ListBox1Click(Sender: TObject);
{var
  f: textfile;
  str: string;}
begin
  //ShowMessage('gfgdf');
(*  AssignFile(f, 'K:\PDO\NP01VN\' +
    Trim(ListBox1.Items.Strings[ListBox1.itemindex]) + '\NameDoc.txt');
{$I-}
  Reset(f); // открыть файл для чтения
{$I-}
  if IOResult = 0 then
  begin
    read(f, str);
    Label2.Caption := str;
    CloseFile(f);
  end
  else
    Label2.Caption := '<Сл. записки нет>'
    *)
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
  //ShowMessage('K:\PDO\NP01VN\'+Trim(ListBox1.Items.Strings[ListBox1.itemindex]));
 (* if Application.MessageBox('Вы дейстаительно хотите удалить папку?',
    'Внимание',
    MB_ICONQUESTION + MB_YESNO) = mryes then
  begin
    MyRemoveDir('K:\PDO\NP01VN\' +
      Trim(ListBox1.Items.Strings[ListBox1.itemindex]));
    ListBox1.DeleteSelected;
  end;
  *)
end;

procedure Start(const s: string);
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
    Waitforsingleobject(p.hProcess, infinite)
  else
    //    f1PR02vp_nc.jvlgfl1.Add(DateTimeToStr(Now), compusname + 'StrtErr', s);
    CloseHandle(p.hProcess);
end;

// архивация старого журнала внешним архиватором

function QuartalPack: Boolean;
var
  s, s1: string;
begin
  s := ArhivDir;
  if not DirectoryExists(s) then
    if not ForceDirectories(s) then
    begin
      Result := False;
      Abort;
    end;
  s1 := ExtractFilePath(Application.ExeName) + csArhivRun + s +
    FormatDateTime('dd_mm_yyy-hh_nn', Now) + csArcExt + ' '
    + StartDir + csDataPath;
  Start(s1);
  Result := True;
end;

//очистка журнала

procedure JournalClean(var quartal: Integer);
var
  m, q: Integer;
  z1, z2, z3, z4: TQuery;
  i: Integer;
begin
  m := MonthOf(Date) - 1;
  if (m mod 3) = 0 then
  begin
    q := (m div 3) + 1;
    if q = quartal then
    begin
      QuartalPack;
      DeleteFile(NetDir + csDataPath + csJournalLog);
      z1 := TQuery.Create(nil);
      z2 := TQuery.Create(nil);
      z3 := TQuery.Create(nil);
      z4 := TQuery.Create(nil);
      z1.DatabaseName := JournalDir;
      z2.DatabaseName := JournalDir;
      z3.DatabaseName := JournalDir;
      z4.DatabaseName := JournalDir;
      z1.SQL.Text := 'Select * from "NP01VN1.DB" WHERE Sdate <= "' +
        DateToStr(IncDay(Date, -180)) + '"';
      z2.SQL.Text := 'Select * from "NP01VN.DB" WHERE FnId=:p1';
      z2.Filter := 'WDate <> ''01.01.2000''';
      z3.SQL.Text := 'Delete from "NP01VN.DB" where FnId=:p1';
      z4.SQL.Text := 'Delete from "NP01VN1.DB" where Id=:p1';
      z1.Open;
      if z1.RecordCount > 0 then
        while not (z1.Eof) do
        begin
          z2.Filtered := False;
          z2.Filter := '';
          z2.Params.ParamByName('p1').AsInteger :=
            z1.FieldByName('Id').AsInteger;
          z2.Open;
          i := z2.RecordCount;
          z2.Filtered := True;
          if z2.RecordCount = i then
          begin
            //удаляем полностью
            z3.Params.ParamByName('p1').AsInteger :=
              z1.FieldByName('Id').AsInteger;
            z4.Params.ParamByName('p1').AsInteger :=
              z1.FieldByName('Id').AsInteger;
            try
              z3.ExecSQL;
              z4.ExecSQL;
            except
              ShowMessage('Ошибка при очистки журнала');
            end;
          end
          else
          begin
            //удалять нельзя
          end;
          z1.Next;
        end;
      {  z.SQL.Text :=
           'DELETE FROM "NP01VN.DB" WHERE (Wdate != "01.01.2000") AND (Wdate <= "' +
           DateToStr(IncDay(Date, -180)) + '")';
         try
           z.Prepare;
           z.ExecSQL;
         except
         end;}
      FreeAndNil(z1);
      FreeAndNil(z2);
      FreeAndNil(z3);
      FreeAndNil(z4);
      case quartal of
        1, 2, 3:
          begin
            Inc(quartal);
          end;
        4:
          begin
            quartal := 1;
          end;
      end;
    end;
  end;
end;

procedure TForm3.ShowJournal(arhiv: Boolean = False);
var
  IniDept: TMemIniFile;
  Frm1: TFormArcDir;
begin
  if lst1.ItemIndex < 0 then
    ShowMessage('Выберите подразделение!')
  else
  begin
    //ButtonNet.Tag := 0;
        //обслуживание базы, архивация, очистка и т.д.
        // пока что закомент на отпуск
    //JournalClean(quart);
    // /--- обслуживание базы
    UseJournal := True;
    IniDept := TMemIniFile.Create(LocalStorage + 'np01vn_dept.ini');
    JournalDir := IniDept.ReadString(lst1.Items[lst1.itemindex], 'journaldir',
      NetDir + 'Data\');
    NetDir := IniDept.ReadString(lst1.Items[lst1.itemindex], 'netdir',
      'K:\PDO\NP01VN\');
    NetDirArc := IniDept.ReadString(lst1.Items[lst1.itemindex], 'netdir_arc',
      '');
    JournalDirArc := IniDept.ReadString(lst1.Items[lst1.itemindex],
      'journaldir_arc', NetDir + '');
    backup_dir := IniDept.ReadString(lst1.Items[lst1.itemindex],
      'backup_dir', NetDir + '');
    NetDirP1 := IniDept.ReadString(lst1.Items[lst1.itemindex], 'makP1_dir',
      BaseNetDirP1);
    NetDir42 := IniDept.ReadString(lst1.Items[lst1.itemindex], 'mak42_dir',
      BaseNetDir42);
    FreeAndNil(IniDept);
    try
      FmJournal := TFmJournal.Create(Application);
      if SheetMultiSelect = False then
        FmJournal.dbgrdh1.Options := FmJournal.dbgrdh1.Options -
          [DBGridEh.dgMultiSelect, DBGridEh.dgRowSelect];
      FmJournal.dbgrdh1.RowLines := linecount;
      FmJournal.GetTableNames;
      if arhiv = True then
      begin
        Frm1 := TFormArcDir.Create(Self);
        frm1.PodrazdDir:=NetDirArc;
        if (Frm1.ShowModal = mrOk) and (Frm1.lst1.itemIndex>-1) then
        begin
          FmJournal.btnArc.Visible := False;
          FmJournal.btnState1.Visible := False;
          FmJournal.btnState2.Visible := False;
          FmJournal.btnState3.Visible := False;
          NetDir := NetDirArc + Frm1.lst1.Items[Frm1.lst1.itemIndex] + '\' +
            csArcDataDir+'\';
          JournalDir := NetDirArc + Frm1.lst1.Items[Frm1.lst1.itemIndex] + '\' +
            csArcJrnlDir+'\';
          FmJournal.Caption := 'АРХИВ ' + lst1.Items[lst1.itemindex] + ' за ' +
            Frm1.lst1.Items[Frm1.lst1.itemIndex];
          FmJournal.ShowModal();
        end
      end
      else
      begin
        FmJournal.btnArc.Visible := chkArhiv.Checked;
        FmJournal.Caption := 'Журнал NP01VN ' + lst1.Items[lst1.itemindex];
        FmJournal.ShowModal();
      end;
    finally
      FreeAndNil(FmJournal);
    end;
  end;

end;

procedure TForm3.btn1Click(Sender: TObject);
{var
  IniDept: TIniFile;}
begin
  {  if lst1.ItemIndex < 0 then
      ShowMessage('Выберите подразделение!')
    else
    begin
      //ButtonNet.Tag := 0;
          //обслуживание базы, архивация, очистка и т.д.
          // пока что закомент на отпуск
      //JournalClean(quart);
      // /--- обслуживание базы
      UseJournal := True;
      IniDept := TIniFile.Create(ExtractFilePath(Application.ExeName) +
        'np01vn_dept.ini');
      JournalDir := IniDept.ReadString(lst1.Items[lst1.itemindex], 'journaldir',
        NetDir + 'Data\');
      NetDir := IniDept.ReadString(lst1.Items[lst1.itemindex], 'netdir',
        'K:\PDO\NP01VN\');
      NetDirArc := IniDept.ReadString(lst1.Items[lst1.itemindex], 'netdir_arc',
        'K:\PDO\NP01VN\');
      JournalDirArc := IniDept.ReadString(lst1.Items[lst1.itemindex],
        'journaldir_arc', NetDir + 'Data\');
      FmJournal := TFmJournal.Create(Application);
      FmJournal.dbgrdh1.RowLines := linecount;
      FmJournal.Caption := 'Журнал NP01VN ' + lst1.Items[lst1.itemindex];
      FmJournal.GetTableNames;
      FmJournal.ShowModal();
      FmJournal.Free;
    end;}
  ShowJournal();
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(LocalStorage + 'np01vn.ini');
  Ini.WriteInteger('service', 'quartal', Quart);
  Ini.WriteInteger('window', 'width', Width);
  Ini.WriteInteger('window', 'height', Height);
  Ini.WriteInteger('window', 'left', Left);
  Ini.WriteInteger('window', 'top', Top);
  if mmo1.Lines.Count > 0 then
    Ini.WriteString('update', 'firstline', mmo1.Lines[0]);
  ini.UpdateFile;
  FreeAndNil(ini);
  RemoveDir(PrivDir);
end;

procedure TForm3.FormCreate(Sender: TObject);
  procedure CopyConfigNew(const aFileName: string);
  begin
    if (FileExists(GetCurrentDir + '\' + aFileName)) and (not
      (FileExists(LocalStorage + aFileName))) then
      fCopyFile(GetCurrentDir + '\' + aFileName, LocalStorage + aFileName);
  end;
var
  aDirExst: Boolean;
begin
  aDirExst := True;
  SetBDEConfig('\\nevz\nevz\ASUP_Data1\BD-ASU\NET', PrivDir);
  LocalStorage := SAVLib.GetSpecialFolderLocation(CSIDL_APPDATA,
    FOLDERID_RoamingAppData) + 'NEVZ\OASUP\NP01VN_Maket';
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
    LocalStorage := LocalStorage + '\';
    CopyConfigNew('NP01VN.ini');
    CopyConfigNew('np01vn_dept.ini');
    CopyConfigNew('NaznachList.txt');
  end;
  //  ShowMessage(LocalStorage);
end;

procedure TForm3.btn2Click(Sender: TObject);
var
  FmParam: TFmParam;
begin
  FmParam := TFmParam.Create(Application);
  FmParam.ShowModal();
  FmParam.Free;
end;

procedure TForm3.btn3Click(Sender: TObject);
var
  FmDept: TFmDept;
begin
  FmDept := TFmDept.Create(Application);
  FmDept.Caption := 'Добавление подразделения...';
  FmDept.ShowModal();
  FmDept.Free;
  GetDeptName;
end;

procedure TForm3.btn4Click(Sender: TObject);
var
  FmDept: TFmDept;
  IniDpt: TMemIniFile;
begin
  if (lst1.ItemIndex > -1) then
  begin
    FmDept := TFmDept.Create(Application);
    IniDpt := TMemIniFile.Create(LocalStorage + 'np01vn_dept.ini');
    FmDept.edt1.Text := lst1.Items[lst1.ItemIndex];
    FmDept.edt2.Text := IniDpt.ReadString(FmDept.edt1.Text, 'netdir',
      'K:\PDO\NP01VN\');
    FmDept.edt3.Text := IniDpt.ReadString(FmDept.edt1.Text, 'journaldir',
      'K:\PDO\NP01VN\Journal\');
    FmDept.edt4.Text := IniDpt.ReadString(FmDept.edt1.Text, 'netdir_arc', '');
    FmDept.edt5.Text := IniDpt.ReadString(FmDept.edt1.Text, 'journaldir_arc',
      '');
    FmDept.edt6.Text := IniDpt.ReadString(FmDept.edt1.Text, 'backup_dir', '');
    FreeAndNil(IniDpt);
    FmDept.Caption := 'Редактирование подразделения...';
    FmDept.Tag := 1;
    FmDept.ShowModal();
    FmDept.Free;
    GetDeptName;
  end;
end;

procedure TForm3.btn5Click(Sender: TObject);
var
  IniDpt: TIniFile;
begin
  if (lst1.itemindex > -1) and (MessageBox(0,
    PAnsiChar('Вы действительно хотите удалить подразделение:'#13 +
    lst1.Items[lst1.itemindex]), 'Подтверждение удаления подразделения',
    MB_ICONWARNING or MB_YESNOCANCEL or MB_DEFBUTTON2) = IDYES) then
  begin
    IniDpt := TIniFile.Create(LocalStorage + 'np01vn_dept.ini');
    IniDpt.EraseSection(lst1.Items[lst1.ItemIndex]);
    FreeAndNil(IniDpt);
    GetDeptName;
  end;
end;

procedure TForm3.btn7Click(Sender: TObject);
begin
  if btn7.Down = True then
    lst1.Width := lst1.Width - 32
  else
    lst1.Width := lst1.Width + 32;
  btn3.Visible := btn7.Down;
  btn4.Visible := btn7.Down;
  btn5.Visible := btn7.Down;
  chkArhiv.Visible := btn7.Down;
end;

procedure TForm3.FormResize(Sender: TObject);
begin
  if Width < 439 then
    Width := 439;
  if Height < 340 then
    Height := 340;
end;

procedure TForm3.btn6Click(Sender: TObject);
begin
  ShowJournal(True);
end;

end.

