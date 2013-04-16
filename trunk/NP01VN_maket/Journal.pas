unit Journal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, Grids, DBGrids, DBTables,
  DBGridEhGrouping, GridsEh, DBGridEh, Buttons, ExtCtrls, ComCtrls,
  Constants, Start, Unit1, Printers, DBGridEhImpExp, Spin, Ost;

type
  TFmJournal = class(TForm)
    ds1: TDataSource;
    tbl1: TTable;
    tbl1Mark: TBooleanField;
    strngfldtbl1Mmyyyy: TStringField;
    strngfldtbl1Tname: TStringField;
    smlntfldtbl1Kod: TSmallintField;
    strngfldtbl1Makname: TStringField;
    intgrfldtbl1Kl: TIntegerField;
    dtfldtbl1Date: TDateField;
    tbl1Maket: TMemoField;
    tbl1Metk: TBooleanField;
    dbgrdh1: TDBGridEh;
    tbl2: TTable;
    tbl2Id: TAutoIncField;
    strngfldtbl2Fname: TStringField;
    atncfldtbl1Num: TAutoIncField;
    intgrfldtbl1FnId: TIntegerField;
    ds2: TDataSource;
    strngfldtbl1Fname2: TStringField;
    ds3: TDataSource;
    tbl3: TTable;
    intgrfldtbl3Num: TIntegerField;
    strngfldtbl3Priznak: TStringField;
    strngfldtbl1Priznak: TStringField;
    qry1: TQuery;
    btn2: TBitBtn;
    btn1: TBitBtn;
    btnFiltr1: TSpeedButton;
    btn6: TBitBtn;
    mfldtbl1Spravka: TMemoField;
    pnl_1: TPanel;
    btn8: TSpeedButton;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    dbmmoSpravka: TDBMemo;
    dbmmoMaket: TDBMemo;
    dlgSave1: TSaveDialog;
    pnl2: TPanel;
    pnl3: TPanel;
    spl1: TSplitter;
    pnl4: TPanel;
    btn3: TBitBtn;
    dtfldtbl1WDate: TDateField;
    dtfldtbl1PDate: TDateField;
    strngfldtbl1Data: TStringField;
    intgrfldtbl1Digit: TIntegerField;
    smlntfldtbl1OldKod: TSmallintField;
    intgrfldtbl1OldDigit: TIntegerField;
    bvl1: TBevel;
    btnFiltr2: TSpeedButton;
    btnFiltr3: TSpeedButton;
    btnFiltr4: TSpeedButton;
    btnFiltr5: TSpeedButton;
    btnFiltr0: TSpeedButton;
    bvl2: TBevel;
    strngfldtbl1Rekv_P0: TStringField;
    stat1: TStatusBar;
    btnFiltr6: TSpeedButton;
    btnState3: TSpeedButton;
    btnState2: TSpeedButton;
    btnState1: TSpeedButton;
    btn4: TBitBtn;
    btn7: TBitBtn;
    dtfldtbl2SDate: TDateField;
    btn9: TBitBtn;
    btn11: TBitBtn;
    strngfldtbl2Doc: TStringField;
    strngfldtbl1Doc: TStringField;
    mmo1: TMemo;
    btnMaketAdd: TBitBtn;
    btnMaketSave: TBitBtn;
    btnMaketClr: TBitBtn;
    rg1: TRadioGroup;
    btnMaketCopy: TBitBtn;
    lbl1: TLabel;
    btnSaveGrid: TBitBtn;
    pnl_arc: TPanel;
    grp1: TGroupBox;
    lbl2: TLabel;
    se1: TSpinEdit;
    lbl3: TLabel;
    btn10: TButton;
    btn12: TButton;
    btnArc: TSpeedButton;
    lstArchive: TListBox;
    btn13: TButton;
    lbl4: TLabel;
    btn14: TButton;
    txt1: TStaticText;
    btn15: TButton;
    mmoMaket: TMemo;
    mmoSpravka: TMemo;
    edtFilterText: TEdit;
    btnFiltr7: TSpeedButton;
    btnAddSelectMaket: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbgrdh1Columns8GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgrdh1Columns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgrdh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    // procedure tbl1BeforeDelete(DataSet: TDataSet);
    procedure btn6Click(Sender: TObject);
    procedure tbl1MarkChange(Sender: TField);
    procedure btn8Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure dbgrdh1Columns1GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgrdh1DblClick(Sender: TObject);
    procedure btnFiltr0Click(Sender: TObject);
    procedure dbgrdh1Columns9GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure btnFiltr1Click(Sender: TObject);
    procedure btnState1Click(Sender: TObject);
    procedure btnState2Click(Sender: TObject);
    procedure btnState3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure dbgrdh1Columns4GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure btn9Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure dbgrdh1Columns3GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure FormResize(Sender: TObject);
    procedure btnMaketCopyClick(Sender: TObject);
    procedure btnMaketClrClick(Sender: TObject);
    procedure mmo1Change(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure btnMaketAddClick(Sender: TObject);
    procedure btnMaketSaveClick(Sender: TObject);
    procedure btnSaveGridClick(Sender: TObject);
    procedure btnArcClick(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure lstArchiveDblClick(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure btnFiltr7Click(Sender: TObject);
    procedure tbl1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure btnAddSelectMaketClick(Sender: TObject);
  private

  public
    procedure Write2Blob(FileName: string; Table1: TTable; FieldName: string);
    procedure Blob2File(FileName: string; Table1: TDBDataSet; FieldName:
      string);
    procedure GetFromKod2(const Kod_02: integer; var k2Quartal: Integer;
      var k2Month: Integer; var k2Type: Integer);
    procedure GetFromKod2Str(const Kod_02: string; var k2Quartal: Integer; var
      k2Month: Integer; var k2Type: Integer);
    procedure GetTableNames();
    procedure SetJournalFilter();
    function GetQuarter(): Integer;
    procedure ExportGrid(AllGrid: Boolean);
    procedure SelectMakets2One(OutList: TStrings);
    function GetMaketOnly(InList1: TStrings): string;
  end;

function ExtractShortPathName(const FileName: string): string;

var
  FmJournal: TFmJournal;
  CurYear: Word = 2011;
  CurRec: TRecord; //надо инициализир при клике
  Kod, Kod2: Integer;
  PLTables: array of string[200];
  NSTables: array[0..1] of string[200];
  sPL01IZ, sPL01PS, sBD06UL: string;
implementation
uses DateUtils, ShellApi, Unit3, KoaUtils, Unit4, Unit5, Unit2, ASU_DBF,
  LogFile, ClipBrd, StrUtils, ArcDir {, PrintDoc};
{$R *.dfm}
{$R Resource\database.RES}

var
  FilterQ: array[1..6] of string[60] = (
    '(FnId = %d)',
    '(Makname = ''P1'')',
    '(Makname = ''42'')',
    '(WDate = ''01.01.2000'')',
    '(WDate = ''01.01.2000'') and (PDate<>''01.01.2000'')',
    '(WDate <> ''01.01.2000'')');

function FillZero(i: integer): string;
begin
  if i < 10 then
    Result := csSymb_Zero
  else
    Result := csSymb_Null;
end;

{
Для кодов 6,7,8 выбираем из Код2 либо квартал (по умолч), либо месяц
}

function ExtractShortPathName(const FileName: string): string;
var
  Buffer: array[0..MAX_PATH - 1] of Char;
begin
  SetString(Result, Buffer,
    GetShortPathName(PChar(FileName), Buffer, SizeOf(Buffer)));
end;

procedure TFmJournal.GetFromKod2Str(const Kod_02: string; var k2Quartal:
  Integer; var k2Month: Integer; var k2Type: Integer);
var
  s001: string;

  function SimpCharToInt(c: char): Integer;
  begin
    case c of
      '1': Result := 1;
      '2': Result := 2;
      '3': Result := 3;
      '4': Result := 4;
    else
      Result := 0;
    end;
  end;

begin
  //  s001 := IntToStr(Kod_02);
  s001 := Kod_02;
  if Length(s001) <> 3 then
    s001 := '000';
  k2Quartal := SimpCharToInt(s001[1]);
  k2Month := SimpCharToInt(s001[2]);
  k2Type := SimpCharToInt(s001[3]);
end;

{
Для кодов 6,7,8 выбираем из Код2 либо квартал (по умолч), либо месяц
}

procedure TFmJournal.GetFromKod2(const Kod_02: integer; var k2Quartal: Integer;
  var k2Month: Integer; var k2Type: Integer);

begin
  GetFromKod2Str(IntToStr(Kod_02), k2Quartal, k2Month, k2Type);
end;

procedure TFmJournal.Write2Blob(FileName: string; Table1: TTable; FieldName:
  string);
var
  blob: TStream;
  fs: TFileStream;
begin
  blob := Table1.CreateBlobStream(Table1.FieldByName(FieldName), bmWrite);
  try
    blob.Seek(0, soFromBeginning);

    fs := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
    try
      blob.CopyFrom(fs, fs.Size)
    finally
      FreeAndNil(fs);
    end;
  finally
    FreeAndNil(blob);
  end;
end;

function ClrMak42: string;
var
  curdat, s: string;
begin
  DateTimeToString(CurDat, 'dd.mm.yy', Date());
  s := Format('XX %-21s%-7s%-9s%s', ['ПДО', 'NПК:', 'NДИСК:', CurDat]);
  CharToOem(PChar(s), PChar(s));
  Result := s;
end;

function TFmJournal.GetQuarter(): Integer;
var
  si: ASU_SI;
begin
  si := GetSI(GetPath(BasesPdo, 'pl01.dbf') + 'pl01.dbf');
  Result := StrToInt(si.si_text[1]);
end;

procedure TFmJournal.GetTableNames();
var
  I, iYear: Integer;
  sArc, spth: string;
begin

  iYear := YearOf(Date);
  Quarter := GetQuarter();
  SetLength(PLTables, 4);
  sArc := GetArc(Basespdo, 'pl01.dbf');
  sArc := StringReplace(sArc, '*', IntToStr(iYear), []);
  for I := 1 to Quarter - 1 do
  begin
    //    sArc := GetArc(Basespdo, 'pl01k' + IntToStr(I) + '.dbf');
    //    sArc := StringReplace(sArc, '*', IntToStr(iYear), []);
    PLTables[I - 1] := sArc + 'pl01k' + IntToStr(I) + '.dbf';
  end;
  PLTables[Quarter - 1] := GetPath(BasesPdo, 'pl01.dbf') + 'pl01.dbf';
  for I := Quarter + 1 to 4 do
  begin
    sArc := GetArc(Basespdo, 'pl01k' + IntToStr(I) + '.dbf');
    sArc := StringReplace(sArc, '*', IntToStr(iYear - 1), []);
    PLTables[I - 1] := sArc + 'pl01k' + IntToStr(I) + '.dbf';
  end;
  NSTables[0] := GetPath(BasesPdo, 'ns01ks.dbf') + 'ns01ks.dbf';
  NSTables[1] := GetPath(BasesPdo, 'ns01ks.dbf') + 'ns01ksk.dbf';
  spth := GetPath(BasesPdo, 'pl01.db');
  { TODO 1 -oСтеценко А.В. : Тут надо переделать чтобы брать конкретно таблицы }
  sPL01PS := spth + 'pl01ps.db';
  if FileExists(sPL01PS) = False then
    raise Exception.Create('Путь к базе pl01ps.db не найден!');
  sPL01IZ := spth + 'pl01iz.db';
  if FileExists(sPL01IZ) = False then
    raise Exception.Create('Путь к базе pl01iz.db не найден!');
  sBD06UL := GetPath(BasesPdo, 'bd06ul.dbf') + 'bd06ul.dbf';
end;

procedure TFmJournal.Blob2File(FileName: string; Table1: TDBDataSet; FieldName:
  string);
var
  blob: TStream;
  // fs: TFileStream;
begin
  blob := Table1.CreateBlobStream(Table1.FieldByName(FieldName), bmRead);
  try
    blob.Seek(0, soFromBeginning);
    with TFileStream.Create(FileName, fmCreate) do
      try
        CopyFrom(blob, blob.Size)
      finally
        Free
      end;
  finally
    blob.Free
  end;
end;

// Получаем месяц из кода2 (Data) Для заполнения поля Mmyyyy

function GettMMFromKod2(_Kod2: string; _Month: integer): string;
begin
  if Length(_Kod2) = 3 then
  begin

    Result := IntToStr((StrToInt(_Kod2[1]) - 1) * 3 + _Month);
    if Length(Result) = 1 then
      Result := '0' + Result;
  end
  else
    Result := '';
end;

{Экспорт таблицы всей или выбраной части в файл
@param(AllGrid @true - вя таблица, @false - выбранные строки)}

procedure TFmJournal.ExportGrid(AllGrid: Boolean);
var
  ExpClass: TDBGridEhExportClass;
  Ext: string;
begin
  if dlgSave1.Execute = True then
  begin
    case dlgSave1.FilterIndex of
      4:
        begin
          ExpClass := TDBGridEhExportAsText;
          Ext := 'txt';
        end;
      5:
        begin
          ExpClass := TDBGridEhExportAsCSV;
          Ext := 'csv';
        end;
      3:
        begin
          ExpClass := TDBGridEhExportAsHTML;
          Ext := 'htm';
        end;
      2:
        begin
          ExpClass := TDBGridEhExportAsRTF;
          Ext := 'rtf';
        end;
      1:
        begin
          ExpClass := TDBGridEhExportAsXLS;
          Ext := 'xls';
        end;
    else
      ExpClass := TDBGridEhExportAsXLS;
      Ext := 'xls';
    end;
    if ExpClass <> nil then
    begin
      if UpperCase(Copy(dlgSave1.FileName, Length(dlgSave1.FileName) - 2, 3)) <>
        UpperCase(Ext) then
        dlgSave1.FileName := dlgSave1.FileName + '.' + Ext;
      SaveDBGridEhToExportFile(ExpClass, dbgrdh1, dlgSave1.FileName, AllGrid);
    end;
  end;
end;

function InstallJournal(const JDir, DDir: string): Boolean;
var
  ResStream: TResourceStream;
begin
  Result := True;
  if Application.MessageBox('Таблицы журнала не найдены! ' + #13#10 +
    'Создать новые таблицы журнала?', 'Журнал не найден!', MB_YESNOCANCEL +
    MB_ICONSTOP + MB_DEFBUTTON2) = IDYES then
  begin
    if ((DirectoryExists(JDir) = False) and (ForceDirectories(JDir)
      = False)) or ((DirectoryExists(DDir) = False) and (ForceDirectories(DDir)
      = False)) then
    begin
      {Application.MessageBox(PAnsiChar('Не удалось создать каталог хранения таблиц журнала'
        + JournalDir), 'Ошибка создания каталога', MB_OK + MB_ICONSTOP +
        MB_DEFBUTTON2);

      Exit;}
      Result := False;
    end
    else
    begin
      if FileExists(JDir + 'np01vn.db') then
      begin
        if DeleteFile(JDir + 'np01vn.db') = False then
        begin
          ShowMessage('Не удается перезаписать файл np01vn.db');
          Result := False;
        end;
      end;
      if FileExists(JDir + 'np01vn1.db') then
      begin
        if DeleteFile(JDir + 'np01vn1.db') = False then
        begin
          ShowMessage('Не удается перезаписать файл np01vn1.db');
          Result := False;
        end;
      end;
      if FileExists(JDir + 'np01vn2.db') then
      begin
        if DeleteFile(JDir + 'np01vn2.db') = False then
        begin
          ShowMessage('Не удается перезаписать файл np01vn2.db');
          Result := False;
        end;
      end;
      if Result = True then
      begin
        //если таблиц нету то достаем пустые таблицы из ресурсов
        { TODO : Сделать через массив констант }
        try
          ResStream := TResourceStream.CreateFromID(HInstance, 1, RT_RCDATA);
          ResStream.SaveToFile(JDir + 'NP01VN1.DB');
          ResStream.Free;
          ResStream := TResourceStream.CreateFromID(HInstance, 2, RT_RCDATA);
          ResStream.SaveToFile(JDir + 'NP01VN1.PX');
          ResStream.Free;
          ResStream := TResourceStream.CreateFromID(HInstance, 3, RT_RCDATA);
          ResStream.SaveToFile(JDir + 'NP01VN1.XG0');
          ResStream.Free;
          ResStream := TResourceStream.CreateFromID(HInstance, 4, RT_RCDATA);
          ResStream.SaveToFile(JDir + 'NP01VN1.YG0');
          ResStream.Free;
          ResStream := TResourceStream.CreateFromID(HInstance, 5, RT_RCDATA);
          ResStream.SaveToFile(JDir + 'NP01VN.DB');
          ResStream.Free;
          ResStream := TResourceStream.CreateFromID(HInstance, 6, RT_RCDATA);
          ResStream.SaveToFile(JDir + 'NP01VN.MB');
          ResStream.Free;
          ResStream := TResourceStream.CreateFromID(HInstance, 7, RT_RCDATA);
          ResStream.SaveToFile(JDir + 'NP01VN.VAL');
          ResStream.Free;
          ResStream := TResourceStream.CreateFromID(HInstance, 8, RT_RCDATA);
          ResStream.SaveToFile(JDir + 'NP01VN2.DB');
          ResStream.Free;
          ResStream := TResourceStream.CreateFromID(HInstance, 9, RT_RCDATA);
          ResStream.SaveToFile(JDir + 'NP01VN2.PX');
          ResStream.Free;
        except
          Result := False;
        end
      end;
    end;
  end
  else
    Result := False;
end;

procedure TFmJournal.FormShow(Sender: TObject);
//var
 // ResStream: TResourceStream;
begin
  CurYear := YearOf(Date);
  if (FileExists(JournalDir + 'np01vn.db') = False) or (FileExists(JournalDir +
    'np01vn1.db') = False) or (FileExists(JournalDir + 'np01vn2.db') = False)
      then
  begin
    if InstallJournal(JournalDir,NetDir) = False then
      Exit;

    (*if Application.MessageBox('Таблицы журнала не найдены! ' + #13#10 +
      'Создать новые таблицы журнала?', 'Журнал не найден!', MB_YESNOCANCEL +
      MB_ICONSTOP + MB_DEFBUTTON2) = IDYES then
    begin
      if (DirectoryExists(JournalDir) = False) and (ForceDirectories(JournalDir)
        = False) then
      begin
        Application.MessageBox(PAnsiChar('Не удалось создать каталог хранения таблиц журнала'
          + JournalDir), 'Ошибка создания каталога', MB_OK + MB_ICONSTOP +
          MB_DEFBUTTON2);
        Exit;
      end;
      if FileExists(JournalDir + 'np01vn.db') then
      begin
        if DeleteFile(JournalDir + 'np01vn.db') = False then
        begin
          ShowMessage('Не удается перезаписать файл np01vn.db');
          Exit;
        end;
      end;
      if FileExists(JournalDir + 'np01vn1.db') then
      begin
        if DeleteFile(JournalDir + 'np01vn1.db') = False then
        begin
          ShowMessage('Не удается перезаписать файл np01vn1.db');
          Exit;
        end;
      end;
      if FileExists(JournalDir + 'np01vn2.db') then
      begin
        if DeleteFile(JournalDir + 'np01vn2.db') = False then
        begin
          ShowMessage('Не удается перезаписать файл np01vn2.db');
          Exit;
        end;
      end;
      //если таблиц нету то достаем пустые таблицы из ресурсов
      { TODO : Сделать через массив констант }
      ResStream := TResourceStream.CreateFromID(HInstance, 1, RT_RCDATA);
      ResStream.SaveToFile(JournalDir + 'NP01VN1.DB');
      ResStream.Free;
      ResStream := TResourceStream.CreateFromID(HInstance, 2, RT_RCDATA);
      ResStream.SaveToFile(JournalDir + 'NP01VN1.PX');
      ResStream.Free;
      ResStream := TResourceStream.CreateFromID(HInstance, 3, RT_RCDATA);
      ResStream.SaveToFile(JournalDir + 'NP01VN1.XG0');
      ResStream.Free;
      ResStream := TResourceStream.CreateFromID(HInstance, 4, RT_RCDATA);
      ResStream.SaveToFile(JournalDir + 'NP01VN1.YG0');
      ResStream.Free;
      ResStream := TResourceStream.CreateFromID(HInstance, 5, RT_RCDATA);
      ResStream.SaveToFile(JournalDir + 'NP01VN.DB');
      ResStream.Free;
      ResStream := TResourceStream.CreateFromID(HInstance, 6, RT_RCDATA);
      ResStream.SaveToFile(JournalDir + 'NP01VN.MB');
      ResStream.Free;
      ResStream := TResourceStream.CreateFromID(HInstance, 7, RT_RCDATA);
      ResStream.SaveToFile(JournalDir + 'NP01VN.VAL');
      ResStream.Free;
      ResStream := TResourceStream.CreateFromID(HInstance, 8, RT_RCDATA);
      ResStream.SaveToFile(JournalDir + 'NP01VN2.DB');
      ResStream.Free;
      ResStream := TResourceStream.CreateFromID(HInstance, 9, RT_RCDATA);
      ResStream.SaveToFile(JournalDir + 'NP01VN2.PX');
      ResStream.Free;
    end
    else
      Exit;
     *)
  end;
  tbl1.DatabaseName := JournalDir;
  qry1.DatabaseName := tbl1.DatabaseName;
  tbl2.DatabaseName := tbl1.DatabaseName;
  tbl3.DatabaseName := tbl1.DatabaseName;
  qry1.DatabaseName := tbl1.DatabaseName;
  try
    { TODO -oСтеценко А.В. -cСделать : Сделать проверку наличия конкретных таблиц }
    tbl2.Open;
    tbl3.Open;
    tbl1.Open;
    if tbl1.RecordCount < 1 then
    begin
      btnState1.Enabled := False;
      btnState2.Enabled := False;
      btnState3.Enabled := False;
      btn6.Enabled := False;
      btn8.Enabled := False;
    end;
  except
    ShowMessage(csErrorMsg_ServiceTable);
  end;
  mmo1.Lines.Text := ClrMak42;
end;

procedure TFmJournal.btn1Click(Sender: TObject);
begin
  qry1.SQL.Text := csSQL_MarkClear;
  tbl1.DisableControls;
  qry1.ExecSQL;
  tbl1.Refresh;
  tbl1.EnableControls;
end;

procedure TFmJournal.SetJournalFilter();
var
  bNeedAnd: Boolean;
  i: Integer;
  filtr: string;

  procedure NeedAnd;
  begin
    if bNeedAnd = True then
      filtr := filtr + ' AND '
    else
      bNeedAnd := True;
  end;

begin
  //tbl1.DisableControls;
  filtr := '';

  bNeedAnd := False;
  if btnFiltr1.Down = True then
  begin
    filtr := Format(FilterQ[1], [tbl1.FieldByName(csField_FnId).AsInteger]);
    bNeedAnd := True;
  end;
  for i := 2 to 6 do
    if (FmJournal.FindComponent('btnFiltr' + inttostr(i)) as TSpeedButton).Down
      = true then
    begin
      NeedAnd;
      filtr := filtr + FilterQ[i];
    end;
  bNeedAnd := bNeedAnd or btnFiltr7.Down;
  { if btnFiltr7.Down then
   begin
     NeedAnd;
     filtr := filtr + '(TName LIKE ' + #39 + edtFilterText.Text + #39')';
     // filtr := filtr + '(TName='''+edtFilterText.Text+'*'')';
   end;}
  tbl1.Filtered := False;
  if bNeedAnd then
  begin
    tbl1.Filter := filtr;
    tbl1.Filtered := True;
  end;
  tbl1.EnableControls;
end;

procedure TFmJournal.btn2Click(Sender: TObject);
var
  s: string;
  i: Word;
begin
  i := monthof(Date);
  s := FillZero(i + 1) + inttostr(i + 1) + csSymb_Dot + IntToStr(CurYear);
  qry1.SQL.Text := csSQL_SetMark + csSQL_AND + csSymb_LeftParenthesis +
    csField_Mmyyyy + csSymb_Equal + csSymb_Quote2 + s + csSymb_Quote2 +
    csSymb_RightParenthesis;
  tbl1.DisableControls;
  qry1.ExecSQL;
  tbl1.Refresh;
  tbl1.EnableControls;
end;

procedure TFmJournal.dbgrdh1Columns8GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Params.Text = csJournal_NullDate then
    Params.Text := csSymb_Null;
end;

procedure TFmJournal.dbgrdh1Columns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Params.Text = csTrue then
    Params.Background := clOlive;
end;

procedure TFmJournal.dbgrdh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if dbgrdh1.DataSource.DataSet.FieldByName(csField_Wdate).AsString <>
    csJournal_NullDate then
  begin
    Background := clGreen;
    AFont.Color := clWhite;
  end
  else if dbgrdh1.DataSource.DataSet.FieldByName(csField_Pdate).AsString <>
    csJournal_NullDate then
    Background := clYellow;
end;

procedure TFmJournal.btn6Click(Sender: TObject);
//var
  (*
  qry2, qry3: TQuery;
  t1: TTable;
  i: Integer;
  s, s0: string;
  *)
begin
  if tbl1.FieldByName('Makname').AsString = 'P1' then
  begin
    id_mess := 0;
    // надо задать базу данных - каталог
    Num_tNP01FN := tbl1.FieldByName('Digit').AsInteger;
    Name_tNP01F := 'NP01F' + IntToStr(Num_tNP01FN) + '.db';
    Name_tDPLN := 'DPL' + IntToStr(Num_tNP01FN) + '.db';
    pyt := NetDir + tbl1.FieldByName('Fname2').AsString;
    if tbl1.FieldByName('PDate').AsString <> '01.01.2000' then
    begin
      id_mess := MessageDlg('Вы хотите пересоздать макет?',
        mtInformation, [mbYes, mbNo, mbCancel], 0);
      if id_mess = 6 then //yes
      begin
        // Form2.Close;
        form4.ShowModal;
      end;

      if id_mess = 7 then //no
      begin
        if FileExists(pyt + '\' + Name_tDPLN) = True then
        begin
          //показ справки
          form5.Table_DPLN.DatabaseName := pyt;
          Form5.Table_DPLN.TableName := Name_tDPLN;
          Form2.Visible := false;
          Form2.Close;
          Form5.ShowModal;
        end
        else
        begin
          if
            Application.MessageBox('Таблица макета не обнаружена! Это могло произойти в следствие некорректной ручной простановки состояния обработки.'
            + #13#10#13#10 + 'Пересоздать таблицу макета?',
            'Таблица не найдена!', MB_YESNOCANCEL + MB_ICONWARNING +
            MB_DEFBUTTON2) = IDYES then
            form4.ShowModal;
        end;
      end;
    end
    else
      form4.ShowModal;
  end
  else
  begin

  end;
end;

procedure TFmJournal.tbl1MarkChange(Sender: TField);
{var
  s: string;
  i: Word;}
begin
  (* if Sender.AsBoolean = True then
   begin
     //    i := monthof(Date);
     //    s := FillZero(i + 1) + inttostr(i + 1) + '.' + IntToStr(Index.CurYear);
     if {(tbl1.FieldByName('Mmyyyy').AsString <> s) or}
     (tbl1.FieldByName(csField_Sdate).AsString <> csJournal_NullDate) then
       Sender.AsBoolean := False;
   end;*)
end;

procedure TFmJournal.btn8Click(Sender: TObject);
begin
  if pnl_1.Visible then
    pnl_1.Hide
  else
    pnl_1.Show;
end;

procedure TFmJournal.btn3Click(Sender: TObject);
begin
  qry1.SQL.Text := csSQL_SetMark;
  tbl1.DisableControls;
  qry1.ExecSQL;
  tbl1.Refresh;
  tbl1.EnableControls;
end;

procedure TFmJournal.dbgrdh1Columns1GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Params.Text = '01.2000' then
    Params.Text := ''
  else
  begin
    try
      Params.Text := SysUtils.LongMonthNames[StrToInt(Copy(Params.Text, 1, 2))];
    except
    end;
    //     + ' ' + copy(Params.Text, 4, 4);
  end;
end;

procedure CreateNewTableTMS(NewTable: TTable);
var
  q: TQuery;
begin
  q := TQuery.Create(nil);
  try
    //q.DatabaseName := StartDir + Workname_2 + '\';
    //if (iNum = 1) then
//    begin
      {-- Стеценко А.В. 22.03.2011 Добавил поле Eim для хранения единиц измерения --}
    q.SQL.Text := 'create table "' + NewTable.TableName +
      '" (Vp char(1), Cp char(3), Shifr char(8), KI char(4), Kol char(11), Podrazd integer, Znak char(1), Eim char(5), Kol2 char(11), Primech char(50), Norma char(9), Kol_m char(3), Kol_m2 char(3), Kol_m3 char(3),Kol3 char(11))';
    {
    Vp char(1),       = 0
    Cp char(3),       = 1
    Shifr char(8),    = 2
    KI char(4),       = 3
    Kol char(11),     = 4
    Podrazd integer,  = 5
    Znak char(1),     = 6
    Eim char(5),      = 7
    Kol2 char(11),    = 8
    Primech char(50), = 9
    Norma char(9),    = 10
    Kol_m char(3),    = 11
    Kol_m2 char(3),   = 12
    Kol_m3 char(3),   = 13
    Kol3 char(11))    = 14
    }

    q.ExecSQL();
  finally
    q.Free;
  end;
end;

procedure TFmJournal.dbgrdh1DblClick(Sender: TObject);
var
  TempRec: TRecord;
begin
  if tbl1.RecordCount > 0 then
  begin
    TempRec := TRecord.Create(tbl1.FieldByName(csField_Digit).AsInteger,
      tbl1.FieldByName(csField_Kod).AsInteger,
      tbl1.FieldByName(csField_Tname).AsString, 0, csRoute, csNote,
      tbl1.FieldByName(csField_Data).AsString);
    CurRec := TempRec;
    Workname_2 := tbl1.FieldByName(csField_Fname2).AsString;
    Kod2 := StrToInt(TempRec.Data);
    Kod := tbl1.FieldByName(csField_Kod).AsInteger;
    case Kod of
      3, 4, 5:
        begin
          CurRec.Digit := tbl1.FieldByName(csField_OldDigit).AsInteger;
          Ost.frm42 := Tfrm42.Create(Application); //Tfrm42 описан в Ost.pas
          Ost.frm42.ShowModal;
          FreeAndNil(Ost.frm42);
        end;
      1, 6, 7, 8:
        begin
          FormEdit := TFormEdit.Create(Application);
          //TFormEdit описан в Start.pas
          FormEdit.Caption := 'Документ: ' + Workname_2;
          FormEdit.ShowModal();
          FormEdit.Free;
        end;
    end;
    FreeAndNil(TempRec);
  end;

end;

procedure TFmJournal.btnFiltr0Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to 7 do
    (FmJournal.FindComponent('btnFiltr' + inttostr(i)) as TSpeedButton).Down
      := False;
  tbl1.Filtered := False;
  tbl1.Filter := ''
end;

procedure TFmJournal.dbgrdh1Columns9GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Params.Text = csJournal_NullDate then
    Params.Text := csSymb_Null;
end;

procedure TFmJournal.ds1DataChange(Sender: TObject; Field: TField);
var
  s, f_spr, f_mak: string;
  b_spr, b_mak: Boolean;
begin
  stat1.Panels.Items[1].Text := 'Записей: ' + IntToStr(tbl1.RecordCount);
  btnState1.Enabled := False;
  btnState2.Enabled := False;
  btnState3.Enabled := False;
  if tbl1.FieldByName('WDate').AsString <> '01.01.2000' then
  begin
    btnState1.Enabled := True;
    btnState2.Enabled := True;
  end
  else if tbl1.FieldByName('PDate').AsString <> '01.01.2000' then
  begin
    btnState1.Enabled := True;
    btnState3.Enabled := True;
  end
  else
  begin
    btnState2.Enabled := True;
    btnState3.Enabled := True;
  end;
  //  if tbl1.FieldByName('Makname').AsString = 'P1' then
  //  begin
  s := NetDir + tbl1.FieldByName('Fname2').AsString + '\NP01F' +
    IntToStr(tbl1.FieldByName('Digit').AsInteger);
  f_spr := s + csSprFilePostfix;
  f_mak := s + csMakFilePostfix;
  b_spr := FileExists(f_spr);
  b_mak := FileExists(f_mak);
  if b_spr then
    try
      mmoSpravka.Lines.LoadFromFile(f_spr);
    except
    end;
  if b_mak then
    try
      mmoMaket.Lines.LoadFromFile(f_mak);
    except
    end;
  mmoSpravka.Visible := b_spr;
  mmoMaket.Visible := b_mak;
  dbmmoSpravka.Visible := not (b_spr);
  dbmmoMaket.Visible := not (b_mak);
  //  end;
end;

procedure TFmJournal.btnFiltr1Click(Sender: TObject);
begin
  FmJournal.SetJournalFilter;
end;

procedure TFmJournal.btnState1Click(Sender: TObject);
begin
  tbl1.Edit;
  tbl1.FieldByName('WDate').AsString := '01.01.2000';
  tbl1.FieldByName('PDate').AsString := '01.01.2000';
  tbl1.Post;
end;

procedure TFmJournal.btnState2Click(Sender: TObject);
begin
  tbl1.Edit;
  tbl1.FieldByName('WDate').AsString := '01.01.2000';
  tbl1.FieldByName('PDate').AsDateTime := Date;
  tbl1.Post;

end;

procedure TFmJournal.btnState3Click(Sender: TObject);
begin
  tbl1.Edit;
  if tbl1.FieldByName('PDate').AsString = '01.01.2000' then
    tbl1.FieldByName('PDate').AsDateTime := Date;
  tbl1.FieldByName('WDate').AsDateTime := Date;
  tbl1.Post;
end;

function GetTempDir: string;
var
  Buf: array[0..1023] of Char;
begin
  SetString(Result, Buf, GetTempPath(Sizeof(Buf) - 1, Buf));
end;

procedure TFmJournal.btn4Click(Sender: TObject);
var
  i: Integer;
  myFile: TextFile;
  printDialog: TPrintDialog;
begin
  // Создание диалога выбора принтера
  printDialog := TPrintDialog.Create(Form1);

  // Если пользователь выбрал принтер (или значение по умолчанию), то печатайте!
  if printDialog.Execute then
  begin
    // Попытка открыть файл принтера
    AssignPrn(myFile);

    // Теперь подготовливаемся дляя записи на принтер
    ReWrite(myFile);
    WriteLn(myFile, ' ');
    case pgc1.TabIndex of
      0:
        begin
          for I := 0 to dbmmoSpravka.Lines.Count - 1 do
            WriteLn(myFile, '     ' + dbmmoSpravka.Lines[i]);
        end;
      1:
        begin
          for I := 0 to dbmmoMaket.Lines.Count - 1 do
            WriteLn(myFile, '     ' + dbmmoMaket.Lines[i]);
        end;
    end;
    // Закрытие фала
    CloseFile(myFile);
  end;
  (*
  Printer.BeginDoc;
  Printer.Canvas.Font.Size := 12;

  case pgc1.TabIndex of
    0:
      begin
        for I := 0 to dbmmoSpravka.Lines.Count - 1 do
          Printer.Canvas.TextOut(20, 150 + (150 * i), dbmmoSpravka.Lines[i]);
      end;
    1:
      begin
        for I := 0 to dbmmoMaket.Lines.Count - 1 do
          Printer.Canvas.TextOut(20, 150 + (150 * i), dbmmoMaket.Lines[i]);
      end;
  end;

  Printer.EndDoc;
  *)
  (*  DeleteFile(csTempMaket);
    case pgc1.TabIndex of
      0: dbmmoSpravka.Lines.SaveToFile(GetTempDir + csTempMaket);
      1: dbmmoMaket.Lines.SaveToFile(GetTempDir + csTempMaket);
    end;
    ShellExecute(0, PAnsiChar(csPrint), PAnsiChar(GetTempDir + csTempMaket), '',
      '', SW_SHOWNORMAL);
      *)
end;
{$F+}
//условная компиляция для использования процедурного типа

procedure SaveToFile_P1(MaketDirName: string; MaketFileName:
  TFileName; SpravkaFileName: TFileName = '');
var
  i, chP0, chP1: Integer;
  s2, s: string;
  s3: TStringList;
  List1: TStringList;
begin
  list1 := TStringList.Create;
  if FmJournal.dbmmoMaket.Visible then
    List1.Assign(FmJournal.dbmmoMaket.Lines)
  else
    List1.Assign(FmJournal.mmoMaket.Lines);
  chP0 := 0;
  chP1 := 0;
  s3 := TStringList.Create;
  for i := 0 to List1.Count - 1 do
  begin
    if (List1[i][1] + List1[i][2]) = 'P1' then
      Inc(chP1)
    else if (List1[i][1] + List1[i][2]) = 'P0' then
      Inc(chP0);
  end;
  //            dbmmoSpravka.Lines.Clear;
  s3.Add('* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *');
  s3.Add('   Дата ' + datetostr(Date) + '               Время   ' +
    timetostr(Time));
  s3.Add('   Макеты для директивного плана  *' + MaketDirName + MaketFileName +
    '*');
  s3.Add('');
  s3.Add('   Всего записей за ' + datetostr(Date) + '   -        ' +
    inttostr(chP0 + chP1));
  s3.Add('       в том числе:');
  s3.Add('         макет Р0  -   ' + IntToStr(chP0));
  s3.Add('         макет Р1  -   ' + inttostr(chP1));
  s3.Add('* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *');
  // s1:=s3.Text;
  // CharToOem(PChar(s1), PChar(s2));
  if SpravkaFileName = '' then
    s2 := 'SPR_' + MaketFileName
  else
    s2 := SpravkaFileName;
  try
    List1.SaveToFile(MaketDirName + MaketFileName);
    FmJournal.tbl1.Edit;
    //FmJournal.dbmmoSpravka.Lines.Clear;
    //FmJournal.dbmmoSpravka.Text := s3.Text;

    FmJournal.tbl1.FieldByName('Kl').AsInteger := chP1 + chP0;
    FmJournal.tbl1.Post;
    s3.SaveToFile(MaketDirName + s2);
    s := NetDir + FmJournal.tbl1.FieldByName('Fname2').AsString + '\NP01F' +
      IntToStr(FmJournal.tbl1.FieldByName('Digit').AsInteger);
    s3.SaveToFile(s + csSprFilePostfix);
  finally
    FreeAndNil(s3);
    FreeAndNil(List1);
  end;
end;

procedure SaveToFile_42(MaketDirName: string; MaketFileName:
  TFileName; SpravkaFileName: TFileName = '');
var
  i, chP1: Integer;
  Data, Vrem: string;
  s2, s: string;
  s3: TStringList;
  List1: TStringList;
begin
  list1 := TStringList.Create;
  if FmJournal.dbmmoMaket.Visible then
    List1.Assign(FmJournal.dbmmoMaket.Lines)
  else
    List1.Assign(FmJournal.mmoMaket.Lines);
  chP1 := 0;
  s3 := TStringList.Create;
  for i := 0 to List1.Count - 1 do
  begin
    if (List1[i][1] + List1[i][2]) = '42' then
      Inc(chP1)
  end;
  s3.Add('');
  s3.Add('');
  s3.Add('');
  s3.Add('');
  s3.Add('            СПРАВКА О ЗАПИСАННЫХ ДАННЫХ');
  s3.Add('                  К ЗАДАЧЕ MS02');
  s3.Add('          ( ' + MaketDirName + MaketFileName + ' ) ');
  DateTimeToString(Data, 'dd.mm.yy', Date());
  DateTimeToString(Vrem, 'hh:nn:ss', Time());
  s3.Add(Format('     %-41s%s', [Data, Vrem]));
  s3.Add('     REC LENGTH = 80                   BLK LENGTH = 80');
  s3.Add(Format('     %-21s%-7s%-9s%s', ['ПДО', 'NПК:', 'NДИСК:',
    Data]));
  s3.Add('          ………………………………………………………………………………………');
  s3.Add('         | НОМЕР МАКЕТА | ЧИСЛО ДОКУМЕНТОВ |');
  s3.Add('          ………………………………………………………………………………………');
  s3.Add('');
  s3.Add(Format('             42%19d', [chP1]));
  s3.Add('');
  s3.Add('          ………………………………………………………………………………………');
  s3.Add(Format('            Всего%17d', [chP1]));
  //-------------------
  if SpravkaFileName = '' then
    s2 := 'SPRAVKA_' + MaketFileName
  else
    s2 := SpravkaFileName;
  try
    List1.SaveToFile(MaketDirName + MaketFileName);
    FmJournal.tbl1.Edit;
    //FmJournal.dbmmoSpravka.Lines.Clear;
    //FmJournal.dbmmoSpravka.Text := s3.Text;

    s := NetDir + FmJournal.tbl1.FieldByName('Fname2').AsString + '\NP01F' +
      IntToStr(FmJournal.tbl1.FieldByName('Digit').AsInteger);
    //f_mak := ;
    s3.SaveToFile(s + csSprFilePostfix);
    FmJournal.tbl1.FieldByName('Kl').AsInteger := chP1;
    FmJournal.tbl1.Post;
    s3.SaveToFile(MaketDirName + s2);
  finally
    FreeAndNil(s3);
    FreeAndNil(List1);
  end;
end;
{$F-}

procedure TFmJournal.btn7Click(Sender: TObject);
var
  // s, s1, s2: string;
   // i, chP1, chP0: Integer;
    // s3: TStringList;
   // Data, Vrem: string;
  sprav: string;
  makt: string;
begin
  // chP1 := 0;
  // chP0 := 0;
 //  s3 := TStringList.Create;
  if tbl1.FieldByName('Makname').AsString = 'P1' then
  begin
    sprav := 'SPRAVKA.TXT';
    makt := 'DPL.TXT';
    dlgSave1.InitialDir := NetDirP1;
  end
  else
  begin
    sprav := 'SPR_MS02MAK.TXT';
    makt := 'MS02MAK.TXT';
    dlgSave1.InitialDir := NetDir42;
  end;

  case pgc1.TabIndex of
    0:
      begin
        dlgSave1.FileName := sprav;
        dlgSave1.Title := csDlgSave + csDlgSave_Spr;
      end;
    1:
      begin
        dlgSave1.FileName := makt;
        dlgSave1.Title := csDlgSave + csDlgSave_Mak;
      end;
  end;

  dlgSave1.DefaultExt := '.txt';
  dlgSave1.Filter := 'Текстовые файлы|*.txt|Все файлы|*.*';
  if dlgSave1.Execute then
  begin
    case pgc1.TabIndex of
      0: if dbmmoSpravka.Visible then
          dbmmoSpravka.Lines.SaveToFile(dlgSave1.FileName)
        else
          mmoSpravka.Lines.SaveToFile(dlgSave1.FileName);
      1:
        begin
          if tbl1.FieldByName('Makname').AsString = 'P1' then
          begin
            SaveToFile_P1(ExtractFilePath(dlgSave1.FileName),
              ExtractFileName(dlgSave1.FileName));
          end
          else
          begin
            SaveToFile_42(ExtractFilePath(dlgSave1.FileName),
              ExtractFileName(dlgSave1.FileName));
          end;
        end;
    end;
  end;
end;

procedure TFmJournal.dbgrdh1Columns4GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Params.Text = 'P1' then
    Params.Text := 'NP01'
  else if Params.Text = '42' then
    Params.Text := 'MS02';

end;

procedure TFmJournal.btn9Click(Sender: TObject);
begin
  tbl1.Refresh;
end;

procedure TFmJournal.btn11Click(Sender: TObject);
type
  tf1 = procedure(p1: string; p2: TFileName; p3: TFileName);
var
  i: Integer;
  s, dir, mak, sprav: string;
  f: tf1;
begin
  if tbl1.FieldByName('Makname').AsString = '42' then
  begin
    dir := NetDir42;
    mak := 'MS02MAK_';
    sprav := 'SPR_MS02MAK_';
    f := SaveToFile_42;

    {if (DirectoryExists(NetDir42) = False) and (CreateDir(NetDir42) = False)
      then
      ShowMessage('Нет доступа к каталогу ' + NetDir42)
    else
    begin
      i := -1;
      repeat
        Inc(i);
        s := 'MS02MAK_' + inttostr(i) + '.TXT';
      until FileExists(NetDir42 + s) = False;
      SaveToFile_42(NetDir42, s, 'SPR_MS02MAK_' + inttostr(i) + '.TXT');
    end;}
  end
  else
  begin
    dir := NetDirP1;
    mak := 'DPL_';
    sprav := 'SPRAVKA_';
    f := SaveToFile_P1;
    { if (DirectoryExists(NetDirP1) = False) and (CreateDir(NetDirP1) = False)
       then
       ShowMessage('Нет доступа к каталогу ' + NetDirP1)
     else
     begin
       i := -1;
       repeat
         Inc(i);
         s := 'DPL_' + inttostr(i) + '.TXT';
       until FileExists(NetDirP1 + s) = False;
       SaveToFile_P1(NetDirP1, s, 'SPRAVKA_' + inttostr(i) + '.TXT');
     end;}
  end;
  if (DirectoryExists(dir) = False) and (CreateDir(dir) = False) then
    ShowMessage('Нет доступа к каталогу ' + dir)
  else
  begin
    i := -1;
    repeat
      Inc(i);
      s := mak + inttostr(i) + '.TXT';
    until FileExists(dir + s) = False;
    f(dir, s, sprav + inttostr(i) + '.TXT');
  end;
  ShowMessage('Макет успешно сохранен с именем ' + s);
end;

procedure StrToClipbrd(StrValue: string);
var
  // S: string;
  hMem: THandle;
  pMem: PChar;
begin
  hMem := GlobalAlloc(GHND or GMEM_SHARE, Length(StrValue) + 1);
  if hMem <> 0 then
  begin
    pMem := GlobalLock(hMem);
    if pMem <> nil then
    begin
      StrPCopy(pMem, StrValue);
      GlobalUnlock(hMem);
      if OpenClipboard(0) then
      begin
        EmptyClipboard;
        SetClipboardData(CF_TEXT, hMem);
        CloseClipboard;
      end
      else
        GlobalFree(hMem);
    end
    else
      GlobalFree(hMem);
  end;
end;

procedure TFmJournal.dbgrdh1Columns3GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if (Params.Text <> '') and (Params.Text[1] <> 'С') then
    Params.Text := 'Сл. зап. ' + Params.Text;
end;

procedure TFmJournal.FormResize(Sender: TObject);
begin
  if Width < 750 then
    Width := 750;
  if Height < 440 then
    Height := 440;
end;

procedure TFmJournal.btnMaketCopyClick(Sender: TObject);
var
  s: string;
begin
  s := mmo1.Text;
  StrToClipbrd(s);
end;

procedure TFmJournal.btnMaketClrClick(Sender: TObject);
begin
  mmo1.Clear;
  lbl1.Caption := '0';
  if rg1.ItemIndex = 0 then
    mmo1.Lines.Text := ClrMak42;
end;

procedure TFmJournal.mmo1Change(Sender: TObject);
begin
  lbl1.Caption := IntToStr(mmo1.Lines.count);
end;

procedure TFmJournal.rg1Click(Sender: TObject);
begin
  mmo1.Clear;
  lbl1.Caption := '0';
  if rg1.ItemIndex = 0 then
    mmo1.Lines.Text := ClrMak42;
end;

procedure TFmJournal.btnMaketAddClick(Sender: TObject);
var
  i: Integer;
  blob: TStream;
  s: TStringList;
begin
  if mmoMaket.Visible then
    mmo1.Lines.Add(GetMaketOnly(mmoMaket.Lines))
      // mmo1.Lines.Add(mmoMaket.Text)
  else
  begin
    if tbl1.FieldByName('Makname').AsString = '42' then
    begin
      blob := Tbl1.CreateBlobStream(Tbl1.FieldByName(csField_Maket), bmRead);
      s := TStringList.Create;
      try
        s.LoadFromStream(blob);

        for i := 1 to s.Count - 1 do
          mmo1.Lines.Add(s[i]);
      finally
        FreeAndNil(s);
        FreeAndNil(blob);
      end;
    end
    else
      mmo1.Lines.Add(dbmmoMaket.Text);
  end;
end;

procedure TFmJournal.btnMaketSaveClick(Sender: TObject);
var
  s, sprav, makt, zad, sfile: string;
  i, i0, i1, i2: Integer;
  s3: TStringList;
  Data, Vrem: string;
begin
  if rg1.ItemIndex = 1 then
  begin
    sprav := 'SPRAVKA_';
    makt := 'DPL.TXT';
    zad := 'NP01';
    dlgSave1.InitialDir := NetDirP1;
  end
  else
  begin
    sprav := 'SPR_';
    makt := 'MS02MAK.TXT';
    zad := 'MS02';
    dlgSave1.InitialDir := NetDir42;
  end;
  dlgSave1.Title := 'Сохранения буфера макета "' + rg1.Items[rg1.itemIndex] +
    '"';
  dlgSave1.FileName := makt;
  dlgSave1.DefaultExt := '.txt';
  dlgSave1.Filter := 'Текстовые файлы|*.txt|Все файлы|*.*';
  if dlgSave1.Execute = True then
  begin
    s3 := TStringList.Create;
    i0 := 0;
    i1 := 0;
    i2 := 0;
    i := 0;
    while i < mmo1.Lines.Count do
      if Trim(mmo1.Lines[i]) = '' then
        mmo1.Lines.Delete(i)
      else
        inc(i);
    for i := 0 to mmo1.Lines.Count - 1 do
      if Length(mmo1.Lines[i]) > 2 then
      begin
        s := Copy(mmo1.Lines[i], 1, 2);
        if s = '42' then
          Inc(i0)
        else if s = 'P1' then
          Inc(i1)
        else if s = 'P0' then
          Inc(i2);
      end;
    s3.Add('');
    s3.Add('');
    s3.Add('');
    s3.Add('');
    s3.Add('            СПРАВКА О ЗАПИСАННЫХ ДАННЫХ');
    s3.Add('                  К ЗАДАЧЕ ' + zad);
    sfile := ExtractFilePath(dlgSave1.FileName) + sprav +
      ExtractFileName(dlgSave1.FileName);
    s3.Add('          ( ' + dlgSave1.FileName + ' ) ');
    DateTimeToString(Data, 'dd.mm.yy', Date());
    DateTimeToString(Vrem, 'hh:nn:ss', Time());
    s3.Add(Format('     %-41s%s', [Data, Vrem]));
    s3.Add('     REC LENGTH = 80                   BLK LENGTH = 80');
    s3.Add(Format('     %-21s%-7s%-9s%s', ['ПДО', 'NПК:', 'NДИСК:',
      Data]));
    s3.Add('          ………………………………………………………………………………………');
    s3.Add('         | НОМЕР МАКЕТА | ЧИСЛО ДОКУМЕНТОВ |');
    s3.Add('          ………………………………………………………………………………………');
    s3.Add('');
    if i0 > 0 then
      s3.Add(Format('             42%19d', [i0]));
    if i2 > 0 then
      s3.Add(Format('             P0%19d', [i2]));
    if i1 > 0 then
      s3.Add(Format('             P1%19d', [i1]));
    s3.Add('');
    s3.Add('          ………………………………………………………………………………………');
    s3.Add(Format('            Всего%17d', [i0 + i1 + i2]));
    try
      mmo1.Lines.SaveToFile(dlgSave1.FileName);
      s3.SaveToFile(sfile);
    except
      ShowMessage('Ошибка при сохранении!');
    end;
    FreeAndNil(s3);
  end;
end;

procedure TFmJournal.btnSaveGridClick(Sender: TObject);
begin
  dlgSave1.DefaultExt := '.xls';
  dlgSave1.Filter :=
    'Электронные таблицы Ms Excel|*.xls|Текст с форматированием|*.rtf|Веб-страницы|*.htm|Текстовые файлы|*.txt|Текстовые файлы с разделителями|*.csv|Все файлы|*.*';
  dlgSave1.Title := 'Сохранение журнала в файл';
  dlgSave1.FileName := Caption + ' за ' + FormatDateTime('dd-mm-yyyy_hh-nn', Now)
    + '.xls';
  ExportGrid(True);
end;

procedure TFmJournal.btnArcClick(Sender: TObject);
begin
  pnl_arc.Visible := btnArc.Down;
end;

procedure TFmJournal.btn12Click(Sender: TObject);
var
  // spath: string;
  q: TQuery;
  // s: TLogFile;
  oldFiltered: Boolean;
  oldFilter: string;
  SavePlace: TBookmark;
  iBeforeFilter: Integer;

  //  отключаем/включаем на всякий долгий случай кнопки фильтрации
  procedure OnOffFiltr(const b: Boolean);
  var
    i: Integer;
  begin
    for i := 0 to 6 do
    begin
      (FmJournal.FindComponent('btnFiltr' + inttostr(i)) as TSpeedButton).Enabled
        := b;
    end;
  end;

begin

  //spath := ExtractFilePath(Application.ExeName) + 'NP01VN_archiv.log';
 // s := TLogFile.Create(spath, 3145728);
 // s.PutLine('');
 // s.PutLine('Start');
 // dbgrdh1.Columns[0].Visible := True;
 // dbgrdh1.Columns[0].ReadOnly := True;
  //  ShowMessage(DateTimeToStr(now - 180));
  q := TQuery.Create(nil);
  q.DatabaseName := tbl1.DatabaseName;
  q.SQL.Text := 'select * from "NP01VN1.DB" where SDate <''' + datetostr(Date -
    se1.Value) + '''';
  q.Open;
  if q.RecordCount > 0 then
  begin
    lstArchive.Clear;
    // s.PutLine(q.SQL.Text + ' => ' + inttostr(q.RecordCount));
    SavePlace := tbl1.GetBookmark;
    oldFiltered := tbl1.Filtered;
    oldFilter := tbl1.Filter;
    tbl1.Filtered := False;
    // s.PutLine('Table record => ' + IntToStr(tbl1.RecordCount));
    tbl1.DisableControls;
    OnOffFiltr(False);
    while not (q.Eof) do
    begin
      tbl1.Filtered := False;
      tbl1.Filter := '(FnId = ' + q.FieldByName('Id').AsString + ')';
      tbl1.Filtered := True;
      // s.PutLine(tbl1.Filter + ' => ' + IntToStr(tbl1.RecordCount));
      iBeforeFilter := tbl1.RecordCount;
      tbl1.Filtered := False;
      tbl1.Filter := tbl1.Filter + ' AND (WDate <> ''01.01.2000'')';
      tbl1.Filtered := True;
      // s.PutLine(tbl1.Filter + ' => ' + IntToStr(tbl1.RecordCount));
      if tbl1.RecordCount = iBeforeFilter then
      begin
        if iBeforeFilter = 0 then
          //     s.PutLine('!!! empty FnId=' + q.FieldByName('Id').AsString)
        else
        begin
          //     s.PutLine('work FnId=' + q.FieldByName('Id').AsString);
          lstArchive.Items.Add(q.FieldByName('Id').AsString + '=' +
            q.FieldByName('Fname').AsString);
        end;
      end;
      q.Next;
    end;
    tbl1.Filtered := False;
    tbl1.Filter := oldFilter;
    tbl1.Filtered := oldFiltered;
    OnOffFiltr(True);
    tbl1.GotoBookmark(SavePlace);
    tbl1.EnableControls;
    tbl1.FreeBookmark(SavePlace);
    lbl4.Caption := IntToStr(lstArchive.Count);
    btn10.Enabled := not (lstArchive.Count = 0);
  end;
  q.Close;
  FreeAndNil(q);
  // FreeAndNil(s);

end;

procedure TFmJournal.lstArchiveDblClick(Sender: TObject);
begin
  if lstArchive.Count > 0 then
  begin
    tbl1.Locate('FnId', StrToInt(lstArchive.Items.Names[lstArchive.ItemIndex]),
      []);
  end;
end;

procedure TFmJournal.btn10Click(Sender: TObject);
var
  i: Integer;
  t1, t2: TTable;
  q1, q2: TQuery;
  s, fnames: string;
  Frm1: TFormArcDir;
  ArcDir_1, ArcJrnlDir_1: string;
begin
  if
    Application.MessageBox('Все пользователи NP01VN Maket должны завершить работу с программой, для избежания ошибок в процессе перемещения документов в архив! Рекомендуется предварительно создать 7 ZIP архив баз.'
    + #13#10#13#10 + 'Продолжить?', 'Подготовка к архивации',
    MB_YESNOCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    ArcDir_1:='';
    ArcJrnlDir_1:='';

    Frm1 := TFormArcDir.Create(Self);
    Frm1.PodrazdDir := NetDirArc;
    if (Frm1.ShowModal = mrOk) and (Frm1.lst1.itemIndex > -1) then
    begin
      ArcDir_1 := NetDirArc + Frm1.lst1.Items[Frm1.lst1.itemIndex] + '\' +
        csArcDataDir + '\';
      ArcJrnlDir_1 := NetDirArc + Frm1.lst1.Items[Frm1.lst1.itemIndex] + '\' +
        csArcJrnlDir + '\';
    end;
    FreeAndNil(Frm1);
    if (not DirectoryExists(ArcDir_1)) and (not DirectoryExists(ArcJrnlDir_1)) then
    begin
      Application.MessageBox('Нет доступа к архивному хранилищу документов:',
        'Архивация невозможна!', MB_OK + MB_ICONSTOP + MB_DEFBUTTON2);
    end
    else if lstArchive.Count > 0 then
    begin
      tbl1.DisableControls;
      t1 := TTable.Create(Self);
      t2 := TTable.Create(Self);
      q1 := TQuery.Create(Self);
      q2 := TQuery.Create(Self);
      q1.DatabaseName := JournalDir;
      q2.DatabaseName := JournalDir;
      t1.DatabaseName := ArcJrnlDir_1;
      t2.DatabaseName := ArcJrnlDir_1;
      t2.TableName := 'NP01VN1.DB';
      t1.TableName := 'NP01VN.DB';
      try
        t1.Open;
        t2.Open;
      except
        ShowMessage('Ошибка открытия таблиц журнала');
        //{ TODO -oСтеценко А.В. -cДоработать : Сделать обработку ошибки открытия файлов журнала архива }
      end;
      for i := 0 to lstArchive.Count - 1 do
      begin
        q1.SQL.Text := 'select * from "np01vn1.db" where Id = ' +
          lstArchive.Items.Names[i];
        q1.Open;
        s := NetDir + lstArchive.Items.Names[i] + '\';
        if (q1.RecordCount > 0) and (FileExists(s + 'PARADOX.LCK') = False)
          and
          (FileExists(s + 'PDOXUSRS.LCK') = False) then
        begin
          fnames := q1.FieldByName('Fname').AsString;
          fCopyDir(NetDir + fnames, ArcDir_1 + fnames);
          t2.AppendRecord([nil, fnames, q1.FieldByName('Sdate').AsDateTime,
            q1.FieldByName('Doc').AsString]);
          q2.SQL.Text := 'select * from "np01vn.db" where FnId = ' +
            lstArchive.Items.Names[i];
          q2.Open;
          while not q2.Eof do
          begin
            t1.Append;
            t1.FieldByName('Mmyyyy').AsString :=
              q2.FieldByName('Mmyyyy').AsString;
            t1.FieldByName('Tname').AsString :=
              q2.FieldByName('Tname').AsString;
            t1.FieldByName('kod').AsInteger :=
              q2.FieldByName('kod').AsInteger;
            t1.FieldByName('oldKod').AsInteger :=
              q2.FieldByName('oldKod').AsInteger;
            t1.FieldByName('Digit').AsInteger :=
              q2.FieldByName('Digit').AsInteger;
            t1.FieldByName('OldDigit').AsInteger :=
              q2.FieldByName('OldDigit').AsInteger;
            t1.FieldByName('Makname').AsString :=
              q2.FieldByName('Makname').AsString;
            t1.FieldByName('Kl').AsInteger := q2.FieldByName('Kl').AsInteger;
            t1.FieldByName('FnId').AsInteger :=
              t2.FieldByName('Id').AsInteger;
            t1.FieldByName('Data').AsString :=
              q2.FieldByName('Data').AsString;
            t1.FieldByName('Sdate').AsDateTime :=
              q2.FieldByName('Sdate').AsDateTime;
            t1.FieldByName('WDate').AsDateTime :=
              q2.FieldByName('WDate').AsDateTime;
            t1.FieldByName('PDate').AsDateTime :=
              q2.FieldByName('PDate').AsDateTime;
            t1.FieldByName('Rekv_P0').AsString :=
              q2.FieldByName('Rekv_P0').AsString;
            TMemoField(t1.FieldByName('Maket')).Assign(q2.FieldByName('Maket'));
            TMemoField(t1.FieldByName('Spravka')).Assign(q2.FieldByName('Spravka'));
            t1.Post;
            q2.Next;
          end;
          q2.Close;
          q1.Close;
          q1.SQL.Text := 'delete from "np01vn1.db" where Id = ' +
            lstArchive.Items.Names[i];
          q1.ExecSQL;
          q1.SQL.Text := 'delete from "np01vn.db" where FnId = ' +
            lstArchive.Items.Names[i];
          q1.ExecSQL;
          try
            fRemoveDir(NetDir + fnames);
          except
            ShowMessage('Из-за ошибки доступа не удалось удалить каталог:'#10#13
              + NetDir + fnames + #10#13'Удалите его вручную!');
          end;
        end
        else
          ShowMessage('Документ:"' + lstArchive.Items.Names[i] +
            '" не доступен для переноса в архив!'#10#13'Удостоверьтесь что с документом не ведется работа, и он доступен/существует в хранилище документов:"'
            + NetDir + '"');
        q1.Active := False;
      end;
      t1.Close;
      t2.Close;
      FreeAndNil(q1);
      FreeAndNil(q2);
      FreeAndNil(t1);
      FreeAndNil(t2);
      tbl1.EnableControls;
      tbl1.Refresh;
      ShowMessage('Архивация завершена!');
    end;
  end;
end;

procedure TFmJournal.btn14Click(Sender: TObject);
var
  s, s1: string;
  SavePlace: TBookmark;

  procedure UnLockTable;
  begin
    tbl3.Open;
    tbl2.Open;
    tbl1.Open;
    tbl1.EnableControls;
  end;

  procedure LockButton(const b: Boolean);
  begin
    btn10.Enabled := not (b);
    btn12.Enabled := not (b);
    btn13.Enabled := not (b);
    btn14.Enabled := not (b);
    btnArc.Enabled := not (b);
    txt1.Visible := b;
    Application.ProcessMessages;
  end;

begin
  if
    Application.MessageBox('Все пользователи NP01VN Maket должны завершить работу с программой, для избежания ошибок в процессе архивации!'
    + #13#10#13#10 + 'Продолжить?', 'Подготовка к архивации',
    MB_YESNOCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    tbl1.DisableControls;
    SavePlace := tbl1.GetBookmark;
    tbl1.Close;
    tbl2.Close;
    tbl3.Close;
    if (FileExists(JournalDir + '\PARADOX.LCK') = True) or
      (FileExists(JournalDir + '\PDOXUSRS.LCK') = True) then
    begin
      ShowMessage('Создание архива невозможно!'#10#13'Нет монопольного доступа к таблицам журнала. Для создания архива ВСЕ пользователи должны завершить работу с программой.');
      UnLockTable;
      Abort;
    end
    else if not DirectoryExists(backup_dir) then
      if not ForceDirectories(backup_dir) then
      begin
        ShowMessage('Нет доступа к ' + backup_dir);
        UnLockTable;
        Abort;
      end;
    s1 := backup_dir + FormatDateTime('dd_mm_yyy-hh_nn', Now) + csArcExt;
    s := ExtractFilePath(Application.ExeName) + csArhivRun + s1 + ' ' + NetDir
      { + ' -x!temp.*'};
    LockButton(True);
    Unit3.Start(s);
    s := ExtractFilePath(Application.ExeName) + csArhivRun + s1 + ' ' +
      JournalDir;
    Unit3.Start(s);
    LockButton(False);
    UnLockTable;
    tbl1.GotoBookmark(SavePlace);
    tbl1.FreeBookmark(SavePlace);
    ShowMessage('Архив ' + s1 +
      ' создан!'#13#10#13#10'Рекомендуется проверить все ли файлы журнала были включены в архив.');
  end;
end;

procedure TFmJournal.btn13Click(Sender: TObject);
begin
  if lstArchive.ItemIndex > -1 then
  begin
    lstArchive.Items.Delete(lstArchive.ItemIndex);
    lbl4.Caption := IntToStr(lstArchive.Count);
  end;
end;

procedure TFmJournal.btn15Click(Sender: TObject);
var
  SavePlace: TBookmark;
  i: Integer;
  q1: TQuery;
begin
  i := tbl1.RecordCount;
  SavePlace := tbl1.GetBookmark;
  tbl1.DisableControls;
  q1 := TQuery.Create(Self);
  q1.DatabaseName := JournalDir;
  q1.SQL.Text := 'DELETE FROM "NP01VN.DB" WHERE (FnId IS NULL)';
  q1.ExecSQL;
  FreeAndNil(q1);
  tbl1.Refresh;
  tbl1.GotoBookmark(SavePlace);
  tbl1.FreeBookmark(SavePlace);
  tbl1.EnableControls;
  ShowMessage('Удалено неопределенных записей: ' + inttostr(i -
    tbl1.RecordCount));
end;

procedure TFmJournal.btnFiltr7Click(Sender: TObject);
begin
  FmJournal.SetJournalFilter;
end;

procedure TFmJournal.tbl1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  s_filter, s_field: string;
begin
  if btnFiltr7.Down then
  begin
    s_filter := AnsiUpperCase(trim(edtFilterText.Text));
    s_field := AnsiUpperCase(trim(DataSet.FieldByName('TName').AsString));
    if s_filter[length(s_filter)] = '*' then
    begin
      s_filter := trim(copy(s_filter, 1, pred(length(s_filter))));
      Accept := AnsiPos(s_filter, s_field) = 1;
    end
    else
      Accept := AnsiPos(s_filter, s_field) > 0;
  end;
end;

procedure TFmJournal.SelectMakets2One(OutList: TStrings);
var
  i, j, n: integer;
  blob: TStream;
  s: TStringList;
begin
  if dbgrdh1.SelectedRows.Count > 0 then
  begin
    n := pred(dbgrdh1.SelectedRows.Count);
    for i := 0 to n do
    begin
      Tbl1.GotoBookmark(pointer(dbgrdh1.SelectedRows.Items[i]));
      if mmoMaket.Visible then
        OutList.Add(GetMaketOnly(mmoMaket.Lines))
      else
      begin
        blob := Tbl1.CreateBlobStream(Tbl1.FieldByName(csField_Maket),
          bmRead);
        s := TStringList.Create;
        try
          s.LoadFromStream(blob);
          OutList.Add(GetMaketOnly(s))
        finally
          FreeAndNil(s);
          FreeAndNil(blob);
        end;
      end;
    end;
  end;
end;

function TFmJournal.GetMaketOnly(InList1: TStrings): string;
var
  list1: TStringList;
  i: integer;
begin
  list1 := TStringList.Create;
  list1.Assign(InList1);
  i := 0;
  while i < list1.Count do
    if (length(Trim(list1[i])) < 2) or not (((list1[i][1] = '4') and (list1[i][2]
      =
      '2')) or ((list1[i][1] = 'P') and ((list1[i][2] = '0') or (list1[i][2] =
      '1')))) then
      list1.Delete(i)
    else
      inc(i);
  Result := list1.Text;
  FreeAndNil(list1);
end;

procedure TFmJournal.btnAddSelectMaketClick(Sender: TObject);
begin
  SelectMakets2One(mmo1.Lines);
end;

end.

