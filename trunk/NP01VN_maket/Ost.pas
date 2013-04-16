unit Ost;

interface

uses
  Windows, ShellAPI, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Grids, DBGrids, DBTables, DB, StdCtrls, Printers, {FileCtrl,}
  StrUtils, Dialogs, Buttons, ExtCtrls, jpeg, Constants, SHFolder, Mask,
  Spin, Menus, StdActns, ActnList, ExcelXP, office2000, ComObj, ComCtrls,
  ActiveX, nExcel;

type
  Tfrm42 = class(TForm)
    DBGrid1: TDBGrid;
    Table42: TTable;
    DataSource1: TDataSource;
    Table42Ar: TTable;
    Table42ArData: TDateField;
    Table42ArNpok: TFloatField;
    Table42ArVp: TStringField;
    Table42ArCp: TStringField;
    Table42ArShifr: TStringField;
    Table42ArKi: TStringField;
    Table42ArKol: TStringField;
    Table42ArPodrazd: TFloatField;
    Table42ArZnak: TStringField;
    PrintDialog1: TPrintDialog;
    Label1: TLabel;
    Table42Vp: TStringField;
    Table42Cp: TStringField;
    Table42Shifr: TStringField;
    Table42KI: TStringField;
    Table42Kol: TStringField;
    Table42Podrazd: TIntegerField;
    Table42Znak: TStringField;
    BitBtn1: TBitBtn;
    strngfldTable42Eim: TStringField;
    mmo1: TMemo;
    Table42Primech: TStringField;
    Table42Kol2: TStringField;
    pnl1: TPanel;
    txt1: TStaticText;
    txt2: TStaticText;
    txt3: TStaticText;
    txt4: TStaticText;
    txt5: TStaticText;
    txt6: TStaticText;
    txt7: TStaticText;
    txt8: TStaticText;
    txt9: TStaticText;
    btn1: TBitBtn;
    btn3: TBitBtn;
    strngfldTable42Norma: TStringField;
    strngfldTable42Kol_m: TStringField;
    strngfldTable42Kol_m2: TStringField;
    txt10: TStaticText;
    txt11: TStaticText;
    txt12: TStaticText;
    txt13: TStaticText;
    txt14: TStaticText;
    strngfldTable42Kol3: TStringField;
    strngfldTable42Kol_m3: TStringField;
    txt15: TStaticText;
    txt16: TStaticText;
    txt17: TStaticText;
    lbl2: TLabel;
    dbgrd1: TDBGrid;
    ds1: TDataSource;
    btn2: TButton;
    qry1: TQuery;
    btn4: TBitBtn;
    medt1: TMaskEdit;
    lbl1: TLabel;
    txt18: TStaticText;
    se1: TSpinEdit;
    lbl3: TLabel;
    btn5: TSpeedButton;
    lblRecCount: TLabel;
    pm1: TPopupMenu;
    N9: TMenuItem;
    N4: TMenuItem;
    N1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    lblShifrTitle: TLabel;
    actlst1: TActionList;
    edtct1: TEditCut;
    edtcpy1: TEditCopy;
    edtpst1: TEditPaste;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    btnExcel: TButton;
    dlgSave1: TSaveDialog;
    grp1: TGroupBox;
    btnSort0: TSpeedButton;
    btnSort2: TSpeedButton;
    btnSort1: TSpeedButton;
    procedure Table42VpValidate(Sender: TField);
    procedure Table42CpValidate(Sender: TField);
    procedure Table42KolSetText(Sender: TField; const Text: string);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Table42BeforePost(DataSet: TDataSet);
    procedure Table42ShifrSetText(Sender: TField; const Text: string);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure TableHeaderMove(const MonthCount: byte; const OneColumn: Boolean =
      False);
    procedure Table42KISetText(Sender: TField; const Text: string);
    procedure Table42Kol2SetText(Sender: TField; const Text: string);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure strngfldTable42NormaSetText(Sender: TField;
      const Text: string);
    procedure strngfldTable42Kol3SetText(Sender: TField;
      const Text: string);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure se1Exit(Sender: TObject);
    procedure Table42BeforeInsert(DataSet: TDataSet);
    procedure Table42AfterInsert(DataSet: TDataSet);
    procedure Table42AfterDelete(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnSort2Click(Sender: TObject);
    procedure btnSort0Click(Sender: TObject);
    procedure btnSort1Click(Sender: TObject);
  public
    procedure SetIndex(_Sort: Integer);
  private

  end;

  TZehList = array of integer;
var
  frm42: Tfrm42;
  ZehList1: TZehList;
  CurPok: integer;
  FullNetPath: string;
  sdocname: string;

function Find(Ar: array of integer; X: Integer): integer;
//procedure CopyToA(FileName: string);
//procedure CopyMak(FileName, NetPath: string);
//procedure CreateNewTableTMS(NewTable: TTable);

procedure SetBorderNative(Range: IXLSRange; Weight: Integer);

implementation

uses KoaUtils, ASU_DBF, ClipB, math, SAVLib, SAVLib_DB, Journal, Unit3, Unit1,
  DateUtils;

{$R *.dfm}

var
  NS03, NS02KI: string;
  iNum: Byte = 1;
  CurDate: string;
  sPrevPrim: string; //примечание из предыдущ записи
  //убирает лишние пробелы из строкового флоата

function GetFloatTrimStr(a: string): string;
begin
  Result := StringReplace(a, ' ', '', [rfReplaceAll]);
  if (Result = ',') or (Result = '') then
    Result := '0';
end;

function GetFloatTrim(a: string): Double;
begin
  Result := StrToFloat(GetFloatTrimStr(a));
end;

function GetIntTrimStr(a: string): string;
begin
  Result := StringReplace(a, ' ', '', [rfReplaceAll]);
  if Result = '' then
    Result := '0';
end;

procedure Tfrm42.FormShow(Sender: TObject);
var
  i: Integer;
  //  s: TStringList;
    //q: TQuery;
    //t: TTable;

begin
  //Table42Podrazd.DefaultExpression := KodPodrazd;
  //Table42.ReadOnly := Index.FormIndex.lbl1.Visible;
  //mmo1.ReadOnly := Table42.ReadOnly;
 { btn3.Enabled := not (Table42.ReadOnly);
  btn4.Enabled := not (Table42.ReadOnly);
  btnMSO.Enabled := not (Table42.ReadOnly);
  N5.Enabled := not (Table42.ReadOnly);
  N6.Enabled := not (Table42.ReadOnly);
  N7.Enabled := not (Table42.ReadOnly);
  N11.Enabled := not (Table42.ReadOnly);
  N12.Enabled := not (Table42.ReadOnly);
  N15.Enabled := not (Table42.ReadOnly);}
  Table42.DisableControls;
  Table42.TableType := ttParadox;
  (* if Table42.ReadOnly=False then
   begin
   Table42.TableName := csNP01F + IntToStr(CurRec.Digit) + csDBExt;
   Table42.DatabaseName := StartDir + WorkName + '\';
   end
   else
   begin
   Table42.TableName := csNP01F + IntToStr(CurRec.Digit) + csDBExt;
   Table42.DatabaseName := NetDir + WorkName + '\';
   end;*)
  Table42.TableName := csNP01F + IntToStr(CurRec.Digit) + csDBExt;
  Table42.DatabaseName := Journal.ExtractShortPathName(NetDir + WorkName_2 + '\');
{  ShowMessage('Table42.TableName=' +
    Journal.ExtractShortPathName(Table42.TableName) + '|||Table42.DatabaseName=' +
    Journal.ExtractShortPathName(Table42.DatabaseName));}
  mmo1.Text := CurRec.Title;
  case CurRec.Kod of
    3:
      begin
        frm42.Caption := csLimitCorrect + csMonth;
        TableHeaderMove(1, True);
        txt5.Caption := SysUtils.LongMonthNames[kod2];
      end;
    4:
      begin
        frm42.Caption := csLimitCorrect + csQuartal;
        i := StrToInt(IntToStr(kod2)[3]);
        if i = 1 then
          TableHeaderMove(4 - StrToInt(IntToStr(kod2)[2]))
        else
          TableHeaderMove(3);
        i := ((StrToInt(IntToStr(kod2)[1]) - 1) * 3) + 1;
        txt5.Caption := SysUtils.LongMonthNames[i];
        txt6.Caption := SysUtils.LongMonthNames[i + 1];
        txt15.Caption := SysUtils.LongMonthNames[i + 2];
      end;
    5:
      begin
        frm42.Caption := csOstLimitCorrect + csMonth;
        TableHeaderMove(1, True);
        txt5.Caption := SysUtils.LongMonthNames[kod2];
      end;
  end;
  {  if not Table42.Exists then
      CreateNewTableTMS(Table42);}
  frm42.Caption := {FormIndex.Label1.Caption +} ' : ' + frm42.Caption;
  try
    Table42.Open;
    Table42.Last;
  except
    Show
  end;
  Table42.EnableControls;
  SetIndex(CurRec.Sort);
  (Self.FindComponent('btnSort' + inttostr(CurRec.Sort)) as TSpeedButton).Down
    := True;

  lblRecCount.Caption := IntToStr(DataSource1.DataSet.RecordCount);
end;

procedure GetZehList(var _ZehList: TZehList);
var
  q: TQuery;
  i: integer;
begin
  q := TQuery.Create(nil);
  q.SQL.Text := 'select ceh from "' + ExtractFilePath(Application.ExeName) +
    'SM50.dbf" where pr_gr="11" order by ceh';
  q.Open;
  SetLength(_ZehList, q.RecordCount);
  for i := 0 to q.RecordCount - 1 do
  begin
    _ZehList[i] := q.Fields[0].AsInteger;
    q.Next;
  end;
  FreeAndNil(q);
end;

function Find(Ar: array of integer; X: integer): integer;
var
  i: integer;
begin
  for i := 0 to Length(Ar) - 1 do
  begin
    if (Ar[i] = X) then
    begin
      Result := i;
      Exit;
    end;
  end;
  Result := -1;
end;

procedure Tfrm42.TableHeaderMove(const MonthCount: byte; const OneColumn: Boolean
  = False);
begin
  if MonthCount = 1 then
  begin
    txt6.Visible := not (OneColumn);
    txt13.Visible := not (OneColumn);
    txt14.Visible := not (OneColumn);
    txt15.Visible := not (OneColumn);
    txt16.Visible := not (OneColumn);
    txt17.Visible := not (OneColumn);
    if OneColumn = True then
    begin
      txt4.Width := txt5.Width;
      txt4.Caption := 'Кол-во матер-ла';
      txt7.Left := 367;
      txt8.Left := 413;
      txt9.Left := 461;
    end
    else
    begin
      txt9.Left := 672;
      txt8.Left := 624;
      txt7.Left := 578;
      txt4.Width := 324;
      txt4.Caption := 'Количество материала';
    end;
    DBGrid1.Columns.Items[7].Visible := not (OneColumn);
    DBGrid1.Columns.Items[8].Visible := not (OneColumn);
    DBGrid1.Columns.Items[9].Visible := not (OneColumn);
    DBGrid1.Columns.Items[10].Visible := not (OneColumn);
    DBGrid1.Columns.Items[5].ReadOnly := not (OneColumn);
    DBGrid1.Columns.Items[6].ReadOnly := not (OneColumn);
    DBGrid1.Columns.Items[7].ReadOnly := not (OneColumn);
    DBGrid1.Columns.Items[8].ReadOnly := not (OneColumn);
  end
  else
  begin
    txt9.Left := 672;
    txt8.Left := 624;
    txt7.Left := 578;
    txt4.Width := 324;
    txt4.Caption := 'Количество материала';
    txt6.Visible := True;
    txt13.Visible := True;
    txt14.Visible := True;
    txt15.Visible := True;
    txt16.Visible := True;
    txt17.Visible := True;
    DBGrid1.Columns.Items[7].Visible := True;
    DBGrid1.Columns.Items[8].Visible := True;
    DBGrid1.Columns.Items[9].Visible := True;
    DBGrid1.Columns.Items[10].Visible := True;
    DBGrid1.Columns.Items[7].ReadOnly := False;
    DBGrid1.Columns.Items[8].ReadOnly := False;
    if MonthCount = 2 then
    begin
      DBGrid1.Columns.Items[5].ReadOnly := True;
      DBGrid1.Columns.Items[6].ReadOnly := True;
    end
    else
    begin
      DBGrid1.Columns.Items[5].ReadOnly := False;
      DBGrid1.Columns.Items[6].ReadOnly := False;
    end
  end;
end;

procedure Tfrm42.Table42VpValidate(Sender: TField);
begin
  if (TField(Sender).AsString <> '2') and
    (TField(Sender).AsString <> '9') then
    SysUtils.Abort;
end;

procedure Tfrm42.Table42CpValidate(Sender: TField);
begin
  {  if (TField(Sender).AsString = '') or
      (Find(ZehList1, TField(Sender).AsInteger) = -1) then
      SysUtils.Abort;}
end;

procedure Tfrm42.Table42KolSetText(Sender: TField; const Text: string);
var
  Ind: integer;
  (*Zel, Dr,*)Digit: string;
begin
  Digit := Text;
  Ind := Pos(' ', Digit);
  while (Ind > 0) do
  begin
    System.Delete(Digit, Ind, 1);
    Ind := Pos(' ', Digit);
  end;
  Table42.FieldByName(csField_Kol).AsString := Format('%.3f',
    [StrToFloat(Digit)]);
end;

procedure Tfrm42.Table42ShifrSetText(Sender: TField; const Text: string);
var
  NewText: string;
  NumZero, i: integer;
begin
  NewText := Trim(Text);
  NumZero := 8 - Length(NewText);
  for i := 0 to NumZero - 1 do
    NewText := NewText + '0';
  TField(Sender).AsString := NewText;
end;

(*procedure CreateNewTableTMS(NewTable: TTable);
var
  q: TQuery;
begin
  q := TQuery.Create(nil);
  try
    q.DatabaseName := StartDir + Workname_2 + '\';
    if (iNum = 1) then
    begin
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
    end
    else
    begin
      q.SQL.Text := 'create table "' + NewTable.TableName +
        '" (Num autoinc, KI char(4), Chert char(13), Kol integer, TM char(32), ' +
        'TM1 char(22) )';
    end;
    q.ExecSQL();
  finally
    FreeAndNil(q);
  end;
end; *)

procedure Tfrm42.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Table42.ReadOnly = False then
  begin
    if mmo1.Text = '' then
    begin
      ShowMessage(csShowMsg_InputTblName);
      mmo1.SetFocus();
      Action := caNone;
      Exit;
    end;
    if (Table42.State <> dsBrowse) then
      Table42.Post;
    Table42.Close;
    CurRec.Title := mmo1.Text;
  end;
end;

{procedure OpenTable(_Rec: TRecord);
begin
  try
    with Table1 do
    begin
      Active := False;
      TableType := ttParadox;
      TableName := 'NP01F' + IntToStr(_Rec.Digit) + '.db';
      DatabaseName := StartDir + WorkName + '\';

      if (not Table1.Exists) then
      begin
        if (not CreateNewTableTMS(Table1)) then
          Exit;
      end
      else
      begin // создание индексов
        CreateIndex;
      end;
      Sort := _Rec.Sort;
      SetIndex(Sort);
      FillPrim(Table1);
    end;
  except
    if Table1.Active = True then
      Table1.Close;
    Table1.Exclusive := False;
  end;
end;}

procedure Tfrm42.Table42BeforePost(DataSet: TDataSet);
var
  t: TTable;
  s: string;
begin
  if (DataSet.FieldByName(csField_Cp).AsString = '') then
  begin
    Dialogs.ShowMessage(csShowMsg_InputCP);
    DBGrid1.SelectedIndex := 5;
    SysUtils.Abort
  end
  else if (DataSet.FieldByName(csField_Shifr).AsString = '') then
  begin
    Dialogs.ShowMessage(csShowMsg_InputShifr);
    DBGrid1.SelectedIndex := 1;
    SysUtils.Abort
  end;
  t := TTable.Create(nil);
  t.DatabaseName := NS02KI;
  t.TableName := cNS02KITable;
  t.ReadOnly := True;
  try
    t.Open;
    s := '';
    s := CodASCII(VarToStr(t.Lookup(csField_Ki,
      DataSet.FieldByName(csField_Ki).AsString,
      csField_VP)));
    t.Close;
  except
    Dialogs.ShowMessage(csShowMsg_InputKod);
    DBGrid1.SelectedIndex := 0;
    Exit;
  end;
  FreeAndNil(t);
  if (s = '') and (DataSet.FieldByName(csField_VP).Value = null) then
  begin
    Dialogs.ShowMessage('Код изделия отсутствует в справочнике. Заполните поле "Вид продукции" вручную!');
    DBGrid1.SelectedIndex := 2;
    SysUtils.Abort
  end
  else
  begin
    if s <> '' then
    begin
      if s = 'С' then
        DataSet.FieldByName(csField_VP).AsString := '2'
      else
        DataSet.FieldByName(csField_VP).AsString := '9';
    end
  end;
  {end;}
  if Dataset.FieldByName('Primech').Value = Null then
    Dataset.FieldByName('Primech').Value := sPrevPrim;
end;

procedure Tfrm42.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  B: Integer;
begin
  {
  По нажатию тчк или зпт в полях кол-во переход на символ после разделителя
  }
  if ((DBGrid1.SelectedField.FieldName = csField_Kol) or
    (DBGrid1.SelectedField.FieldName = csField_Kol2) or
    (DBGrid1.SelectedField.FieldName = csField_Kol3) or
    (DBGrid1.SelectedField.FieldName = csField_Norma)) and ((Key = 188) or (Key
    =
    190) or (Key = 110)) then
  begin
    Key := 0;
    for B := 0 to DBGrid1.ControlCount - 1 do
      if DBGrid1.Controls[B] is TInPlaceEdit then
        with DBGrid1.Controls[B] as TInPlaceEdit do
          if (DBGrid1.SelectedField.FieldName = csField_Kol) or
            (DBGrid1.SelectedField.FieldName = csField_Kol2) or
            (DBGrid1.SelectedField.FieldName = csField_Kol3) then
            SelStart := 7
          else
            SelStart := 4;

  end;
  (*if (DBGrid1.SelectedField.FieldName = 'Vp') then
  begin
    if (Key = VK_SPACE) then
    begin
      if DBGrid1.DataSource.DataSet.State = dsBrowse then
        DBGrid1.DataSource.DataSet.Edit;
      DBGrid1.DataSource.DataSet.FieldByName('vp').AsInteger := 11 -
        DBGrid1.DataSource.DataSet.FieldByName('vp').AsInteger;
    end;
  end
    {  else if (DBGrid1.SelectedField.FieldName = 'KI') then
      begin
        if (Key = VK_RETURN) then
        begin
          if DBGrid1.DataSource.DataSet.State = dsInsert then
            DBGrid1.DataSource.DataSet.Edit;
          DBGrid1.DataSource.DataSet.FieldByName('vp').AsInteger := 11 -
            DBGrid1.DataSource.DataSet.FieldByName('vp').AsInteger;
        end;
      end
     }*)
end;

(*function Tfrm42.CreateMak42(FileName: string; Table1: TTable; KolField: string
  = csField_Kol; Ostatok: Boolean = False): integer;
var
  f: TextFile;
  s: string;
  Kol: real;
  Zel, Drobn: string;

begin
  Result := 0;
  { Table42.DatabaseName := StartDir;
   Table42.TableName := WorkName[1] + '.db';
   Table42.Open;
   }
  AssignFile(f, FileName);
  try
    Rewrite(f);
    s := Format('XX %-21s%-7s%-9s%s', ['ПДО', 'NПК:', 'NДИСК:', CurDate]);
    CharToOem(PChar(s), PChar(s));
    Writeln(f, s);
    Table1.first;
    with Table1 do
    begin
      while not Eof do
      begin
        s := '4201' + FieldByName(csField_VP).AsString;
        s := s + Format('%.3u', [FieldbyName(csField_Cp).AsInteger]);
        s := s + Format('%.8u', [FieldbyName(csField_Shifr).AsInteger]);
        s := s + Format('%.4u', [FieldbyName(csField_Ki).AsInteger]);
        if FieldByName(KolField).Value <> Null then
          try
            Kol := FieldByName(KolField).AsFloat;
          except
            Kol := 0;
          end
        else
          Kol := 0;
        if Kol <> 0 then
        begin
          Zel := Format('%.7u', [Round(Int(Kol))]);
          Drobn := Format('%.3u', [Round(Frac(Kol) * 1000)]);
          if Ostatok = False then
            s := s + Zel + Drobn + Format('%.3u',
              [FieldbyName(csField_Podrazd).AsInteger])
            + '0000000000' + FieldbyName(csField_Znak).AsString
          else
            s := s + '0000000000' + Format('%.3u',
              [FieldbyName(csField_Podrazd).AsInteger])
            + Zel + Drobn + FieldbyName(csField_Znak).AsString;
          Writeln(f, s);
          Inc(Result);
        end;
        Next;
      end;
    end;
  finally
    //    Table42.Close;
    CloseFile(f);
  end;
end;   *)

(*procedure CopyMak(FileName, NetPath: string);
var
  f: Integer;
  FileSize: integer;
  FullPath: string;
  SearchPath: string;
  MesBuf: PChar;
  bRes: Boolean;
  SlPos, OldSlPos: integer;
  FreeBytesAvailableToCaller, TotalNumberOfBytes, TotalNumberOfFreeBytes: INT64;
begin
  // определение размера файла
  f := FileOpen(FileName, fmOpenRead);
  FileSize := GetFileSize(f, nil);
  FileClose(f);

  MesBuf := StrAlloc(512);
  // определение свободного места на диске
  FullPath := ExpandFileName(NetPath);
  FullNetPath := FullPath;
  FullPath := ExcludeTrailingPathDelimiter(FullPath);

  OldSlPos := PosEx('\', FullPath);
  SlPos := PosEx('\', FullPath, OldSlPos + 1);
  while (SlPos > 0) do
  begin
    SearchPath := Copy(FullPath, 1, SlPos - 1);
    if not DirectoryExists(SearchPath) then
    begin
      bRes := CreateDir(SearchPath);
      if (not bRes) then
      begin
        FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM or
          FORMAT_MESSAGE_ALLOCATE_BUFFER,
          nil, GetLastError(), 0, @MesBuf, 511, nil);
        ShowMessage(MesBuf);
        Exit;
      end;
    end;
    OldSlPos := SlPos;
    Slpos := PosEx('\', FullPath, OldSlPos + 1);
  end;

  GetDiskFreeSpaceEx(PChar(FullPath), FreeBytesAvailableToCaller,
    TotalNumberOfBytes, @TotalNumberOfFreeBytes);
  if (FreeBytesAvailableToCaller < FileSize) then
  begin
    ShowMessage(csErrorMsg_DiskFull);
  end;
  CopyFile(PChar(FileName), PChar(FullNetPath + FileName), False);
end;

procedure Tfrm42.Spr(FileName: string; Table1: TTable);
var
  f: System.Text;
  s: string;
  Data, Vrem: string;
begin
  //  AssignFile(f, 'SPR_MS02MAK.TXT');
  AssignFile(f, FileName);
  try
    Rewrite(f);
    Writeln(f);
    Writeln(f);
    Writeln(f);
    Writeln(f);
    Writeln(f, '            СПРАВКА О ЗАПИСАННЫХ ДАННЫХ');
    Writeln(f, '                  К ЗАДАЧЕ MS02');
    //    Writeln(f, '          ( ' + FullNetPath + 'MS02MAK.TXT ) ');
    Writeln(f, '          ( ' + ExtractFileName(FileName) + ' ) ');
    DateTimeToString(Data, 'dd.mm.yy', Date());
    DateTimeToString(Vrem, 'hh:nn:ss', Time());
    Writeln(f, Format('     %-41s%s', [Data, Vrem]));
    Writeln(f, '     REC LENGTH = 80                   BLK LENGTH = 80');
    s := Format('     %-21s%-7s%-9s%s', ['ПДО', 'NПК:', 'NДИСК:', Data]);
    Writeln(f, s);

    Writeln(f, '          ………………………………………………………………………………………');
    Writeln(f, '         | НОМЕР МАКЕТА | ЧИСЛО ДОКУМЕНТОВ |');
    Writeln(f, '          ………………………………………………………………………………………');
    Writeln(f);
    Table1.Open;
    Writeln(f, Format('             42%19d', [Table1.RecordCount]));
    Writeln(f);
    Writeln(f, '          ………………………………………………………………………………………');
    Writeln(f, Format('            Всего%17d', [Table1.RecordCount]));
    CloseFile(f);
    //    CopyFile('SPR_MS02MAK.TXT', PChar(FullNetPath + 'SPR_MS02MAK.TXT'), False);

    {    if PrintDialog1.Execute then
        begin
          ShellExecute(0, 'print', 'SPR_MS02MAK.TXT', '', '', SW_HIDE);
        end;}

  except
    CloseFile(f);
  end;
end;  *)

(*
procedure Tfrm42.AddToArchive;
var
  q: TQuery;
begin
  q := TQuery.Create(self);

  q.SQL.Text := 'select max(npok) from np01vnf2.db where data="' + CurDate +
    '"';
  q.Open;

  CurPok := q.Fields[0].AsInteger + 1;
  Table42Ar.Open;
  if q.Fields[0].AsInteger > 0 then
  begin // записи уже есть

    if (frmConf.ShowModal() = mrOK) then
    begin
      if MessageDlg('Архив за ' + CurDate + ' будет удален!', mtConfirmation,
        [mbOK, mbCancel], 0) = mrOK then
      begin
        while Table42Ar.Locate('Data', CurDate, []) do
          Table42Ar.Delete;
        CurPok := 1;
      end;
    end;
  end;
  Table42.Open;

  while not Table42.Eof do
  begin
    Table42Ar.Append;
    Table42Ar['Data'] := CurDate;
    Table42Ar['Npok'] := CurPok;
    Table42Ar['Vp'] := Table42['Vp'];
    Table42Ar['Cp'] := Table42['Cp'];
    Table42Ar['Shifr'] := Table42['Shifr'];
    Table42Ar['Ki'] := Table42['Ki'];
    Table42Ar['Kol'] := Table42['Kol'];
    Table42Ar['Podrazd'] := Table42['Podrazd'];
    Table42Ar['Znak'] := Table42['Znak'];
    Table42.Next;
  end;
  if (Table42Ar.State <> dsBrowse) then
    Table42Ar.Post;
  Table42.Close;
  Table42Ar.Close;
  q.Close;
  q.Free;
end;
*)

(*procedure CopyToA(FileName: string);
var
  f: Integer;
  FileSize, FreeSpace: integer;
begin
  f := FileOpen(FileName, fmOpenRead);
  FileSize := GetFileSize(f, @FileSize);
  FileClose(f);
  FreeSpace := DiskFree(1);
  while (FreeSpace < FileSize) do
  begin
    ShowMessage(csErrorMsg_DiskFull + csErrorMsg_DiskAChange);
    FreeSpace := DiskFree(1);
  end;
  CopyFile(PChar(FileName), PChar('A:\' + FileName), true);
end; *)

procedure Tfrm42.FormCreate(Sender: TObject);
{var
  BMP: TBitmap;}
begin
  NS03 := GetPath(Basespdo, cNS03Table) + cNS03Table;
  NS02KI := GetPath(Basespdo, cNS02KITable);
  DateTimeToString(CurDate, csDdmmyy, Date());
  sPrevPrim := '';
  {  BMP := TBitmap.Create;
    bmp.Width := Img1.Picture.Graphic.Width;
    bmp.Height := Img1.Picture.Graphic.Height;
    try
      bmp.Canvas.Draw(0, 0, Img1.Picture.Graphic);
      Btn1.Glyph := BMP;
      bmp.Canvas.Draw(0, 0, Img2.Picture.Graphic);
      Btn2.Glyph := BMP;
      bmp.Canvas.Draw(0, 0, Img3.Picture.Graphic);
      Btn3.Glyph := BMP;
    finally;
      bmp.Free;
    end;}
end;

procedure Tfrm42.DBGrid1ColExit(Sender: TObject);
//var
  // q: TQuery;
//  t: TTable;
//  s: string;
  //  bNoMat: Boolean;
begin
  if ((DBGrid1.DataSource.DataSet.State = dsEdit) or
    (DBGrid1.DataSource.DataSet.State = dsInsert)) then
  begin
    case DBGrid1.SelectedIndex of
      1:
        begin
          { t := TTable.Create(nil);
           t.TableName := NS03;
           t.ReadOnly := True;
           s := '';
           try
             t.Open;
             s := VarToStr(t.Lookup('shm',
               DBGrid1.DataSource.DataSet[csField_Shifr],
               'eio'));
             if not (s = '') then
               Table42.FieldByName('eim').AsString := EiList.Values[s]
             else
               Dialogs.ShowMessage(cShifrError);
             t.Close;
           except
           end;
           FreeAndNil(t); }
        end;
      {   4, 6, 8:
           begin
             Table42.FieldByName(DBGrid1.Fields[DBGrid1.SelectedIndex].FieldName).AsString :=
               GetIntTrimStr(Table42.FieldByName(DBGrid1.Fields[DBGrid1.SelectedIndex].FieldName).AsString);
           end;
         3, 5, 7, 9:
           begin
             Table42.FieldByName(DBGrid1.Fields[DBGrid1.SelectedIndex].FieldName).AsString :=
               GetFloatTrimStr(Table42.FieldByName(DBGrid1.Fields[DBGrid1.SelectedIndex].FieldName).AsString);
           end;}
    end;
  end;
end;

procedure Tfrm42.Table42KISetText(Sender: TField; const Text: string);
var
  NewText: string;
  NumZero, i: integer;
begin
  NewText := Trim(Text);
  NumZero := 4 - Length(NewText);
  for i := 0 to NumZero - 1 do
    NewText := '0' + NewText;
  TField(Sender).AsString := NewText;
end;

procedure Tfrm42.Table42Kol2SetText(Sender: TField; const Text: string);
var
  Ind: integer;
  Digit: string;
begin
  Digit := Text;
  Ind := Pos(' ', Digit);
  while (Ind > 0) do
  begin
    System.Delete(Digit, Ind, 1);
    Ind := Pos(' ', Digit);
  end;
  Table42.FieldByName(csField_Kol2).AsString := Format('%.3f',
    [StrToFloat(Digit)]);
end;

procedure Tfrm42.btn1Click(Sender: TObject);
var
  i: integer;
  Rows: TRowsOst;
begin
  if DBGrid1.SelectedRows.Count > 0 then
  begin
    SetLength(Rows.DBRecAr, DBGrid1.SelectedRows.Count);
    with DBGrid1.DataSource.DataSet do
      for i := 0 to DBGrid1.SelectedRows.Count - 1 do
      begin
        GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
        Rows.DBRecAr[i].Vp := FieldByName(csField_VP).Asstring[1];
        Rows.DBRecAr[i].Cp := FieldByName(csField_Cp).AsString;
        Rows.DBRecAr[i].Shifr := FieldByName(csField_Shifr).AsString;
        Rows.DBRecAr[i].KI := FieldByName(csField_Ki).AsString;
        Rows.DBRecAr[i].Kol := FieldByName(csField_Kol).AsString;
        // Rows.DBRecAr[i].Podrazd := FieldByName(csField_Shifr).AsInteger;
        Rows.DBRecAr[i].Znak := FieldByName(csField_Znak).AsString[1];
        Rows.DBRecAr[i].Eim := FieldByName(csField_Eim).AsString;
        Rows.DBRecAr[i].Kol2 := FieldByName(csField_Kol2).AsString;
        Rows.DBRecAr[i].Primech := FieldByName(csField_Primech).AsString;
        Rows.DBRecAr[i].Kol3 := FieldByName(csField_Kol3).AsString;
        Rows.DBRecAr[i].Norma := FieldByName(csField_norma).AsString;
        Rows.DBRecAr[i].Kol_m := FieldByName(csField_kol_m).AsString;
        Rows.DBRecAr[i].Kol_m2 := FieldByName(csField_kol_m2).AsString;
        Rows.DBRecAr[i].Kol_m3 := FieldByName(csField_kol_m3).AsString;
        {for j := 1 to 3 do
          Rows.DBRecAr[i].Kol[j] := FieldByName('kol' + IntToStr(j)).AsInteger;
        for j := 1 to 10 do
          Rows.DBRecAr[i].TM[j] := FieldByName('TM' + IntToStr(j)).AsString;}
      end;
    CopyToClipboardOst(Rows);
  end;
end;

procedure Tfrm42.btn3Click(Sender: TObject);
var
  i: integer;
  Rows: TRowsOst;
begin
  try
    Rows := LoadFromClipboardOst();
    if Rows.Num = 0 then
      Exit;

    with DBGrid1.DataSource.Dataset do
    begin
      // for i := Rows.Num - 1 downto 0 do
      for i := 0 to Rows.Num - 1 do
      begin
        Append;
        //Insert();
        FieldByName(csField_VP).Asstring := Rows.DBRecAr[i].Vp;
        FieldByName(csField_Cp).AsString := Rows.DBRecAr[i].Cp;
        FieldByName(csField_Shifr).AsString := Rows.DBRecAr[i].Shifr;
        FieldByName(csField_Ki).AsString := Rows.DBRecAr[i].KI;
        FieldByName(csField_Kol).AsString := Rows.DBRecAr[i].Kol;
        //FieldByName(csField_Shifr).AsInteger := Rows.DBRecAr[i].Podrazd;
        FieldByName(csField_Znak).AsString := Rows.DBRecAr[i].Znak;
        FieldByName(csField_Eim).AsString := Rows.DBRecAr[i].Eim;
        FieldByName(csField_Kol2).AsString := Rows.DBRecAr[i].Kol2;
        FieldByName(csField_Primech).AsString := Rows.DBRecAr[i].Primech;
        FieldByName(csField_Kol3).AsString := Rows.DBRecAr[i].Kol3;
        FieldByName(csField_norma).AsString := Rows.DBRecAr[i].Norma;
        FieldByName(csField_kol_m).AsString := Rows.DBRecAr[i].Kol_m;
        FieldByName(csField_kol_m2).AsString := Rows.DBRecAr[i].Kol_m2;
        FieldByName(csField_kol_m3).AsString := Rows.DBRecAr[i].Kol_m3;
        {for j := 1 to 3 do
           if (Rows.DBRecAr[i].Kol[j] = 0) then
             FieldByName('kol' + IntToStr(j)).Value := Null
           else
             FieldByName('kol' + IntToStr(j)).AsInteger :=
               Rows.DBRecAr[i].Kol[j];}
         //Next;

      end;
      Post;
    end;
  except
    ShowMessage(csErrorMsg_RunError);
  end;

end;

procedure Tfrm42.DataSource1DataChange(Sender: TObject; Field: TField);
var
  FieldName: string;
  i: Double;

  function SetTextCol(const Text: string): string;
  var
    Ind: integer;
    Digit: string;
  begin
    Digit := Text;
    Ind := Pos(' ', Digit);
    while (Ind > 0) do
    begin
      System.Delete(Digit, Ind, 1);
      Ind := Pos(' ', Digit);
    end;
    Result := Format('%.3f',
      [StrToFloat(Digit)]);

  end;
begin
  //  lblShifrTitle.Caption :=    FormIndex.GetShifrTitle(DBGrid1.DataSource.DataSet.FieldByName('Shifr').AsString);
  if (Field = nil) then
    exit;
  FieldName := Field.FieldName;
  if ((FieldName = 'Norma') or (FieldName = 'Kol_m') or (FieldName = 'Kol_m2')
    or (FieldName = 'Kol_m3')) and (Table42.State <> dsBrowse) then
  begin
    i := GetFloatTrim(DBGrid1.DataSource.DataSet.FieldByName('Norma').AsString);
    if (DBGrid1.DataSource.DataSet.FieldByName('Norma').AsString <> '') and
      (i > 0) and
      (DBGrid1.DataSource.DataSet.FieldByName('Kol_m').AsString <> '') and
      (DBGrid1.Columns.Items[6].ReadOnly = False) then
    begin
      DBGrid1.DataSource.DataSet.FieldByName('Kol').AsString :=
        SetTextCol(FloatToStr(
        RoundTo(i * DBGrid1.DataSource.DataSet.FieldByName('Kol_m').AsInteger,
        -3)))
    end;
    if (DBGrid1.DataSource.DataSet.FieldByName('Norma').AsString <> '') and
      (i > 0) and
      (DBGrid1.DataSource.DataSet.FieldByName('Kol_m2').AsString <> '') and
      (DBGrid1.Columns.Items[8].ReadOnly = False) then
    begin
      DBGrid1.DataSource.DataSet.FieldByName('Kol2').AsString :=
        SetTextCol(FloatToStr(
        RoundTo(i * DBGrid1.DataSource.DataSet.FieldByName('Kol_m2').AsInteger,
        -3)))
    end;
    if (DBGrid1.DataSource.DataSet.FieldByName('Norma').AsString <> '') and
      (i > 0) and
      (DBGrid1.DataSource.DataSet.FieldByName('Kol_m3').AsString <> '') and
      (DBGrid1.Columns.Items[10].ReadOnly = False) then
    begin
      DBGrid1.DataSource.DataSet.FieldByName('Kol3').AsString :=
        SetTextCol(FloatToStr(
        RoundTo(i * DBGrid1.DataSource.DataSet.FieldByName('Kol_m3').AsInteger,
        -3)));
    end;
  end;
  lblRecCount.Caption := IntToStr(DataSource1.DataSet.RecordCount);

end;

procedure Tfrm42.strngfldTable42NormaSetText(Sender: TField;
  const Text: string);
var
  Ind: integer;
  Zel, Dr, Digit: string;
begin
  Ind := Pos(',', Text);
  Zel := Copy(Text, 0, Ind - 1);
  Dr := Copy(Text, Ind, 255);
  Digit := Text;
  Ind := Pos(' ', Digit);
  while (Ind > 0) do
  begin
    System.Delete(Digit, Ind, 1);
    Ind := Pos(' ', Digit);
  end;

  Table42.FieldByName('Norma').AsString := Format('%.5f', [StrToFloat(Digit)]);

end;

procedure Tfrm42.strngfldTable42Kol3SetText(Sender: TField;
  const Text: string);
var
  Ind: integer;
  Digit: string;
begin
  Digit := Text;
  Ind := Pos(' ', Digit);
  while (Ind > 0) do
  begin
    System.Delete(Digit, Ind, 1);
    Ind := Pos(' ', Digit);
  end;
  Table42.FieldByName(csField_Kol3).AsString := Format('%.3f',
    [StrToFloat(Digit)]);
end;

procedure Tfrm42.btn2Click(Sender: TObject);
var
  spcex: string;
begin
  btn2.Enabled := False;
  if (Table42.FieldByName('Shifr').Value = null) or
    (Table42.FieldByName('Cp').Value = null) then
    ShowMessage('Введите шифр материала и цех-получатель!')
  else
  begin
    lbl2.Caption := Table42.FieldByName('Shifr').AsString;
    spcex := Table42.FieldByName('Cp').AsString;
    if Length(spcex) = 2 then
      spcex := ' ' + spcex
    else if spcex[3] = ' ' then
    begin
      spcex[3] := spcex[2];
      spcex[2] := spcex[1];
      spcex[1] := ' ';
    end;
    qry1.Close;
    qry1.SQL.Text := 'select cehl, kil, limk, olim from "' + sBD06UL +
      '" where cehl="' + spcex + '" and shml="' +
      Table42.FieldByName('Shifr').AsString + '"';
    try
      qry1.Open;
    except
      ShowMessage('Ошибка открытия БД06УЛ');
    end;
    if qry1.RecordCount < 1 then
    begin
      ShowMessage('Шифр материала ' + lbl2.Caption + ' отсутствует по цеху ' +
        spcex);
    end;
  end;
  btn2.Enabled := True;
end;

procedure Tfrm42.btn4Click(Sender: TObject);
var
  i: integer;
  Rows: TRowsOst;
begin
  try
    Rows := LoadFromClipboardOst();
    if Rows.Num = 0 then
      Exit;

    with DBGrid1.DataSource.Dataset do
    begin
      for i := 0 to Rows.Num - 1 do
      begin
        Append;
        //Insert();
        FieldByName(csField_VP).Asstring := Rows.DBRecAr[i].Vp;
        FieldByName(csField_Cp).AsString := Rows.DBRecAr[i].Cp;
        FieldByName(csField_Shifr).AsString := Rows.DBRecAr[i].Shifr;
        FieldByName(csField_Ki).AsString := Rows.DBRecAr[i].KI;
        //  FieldByName(csField_Kol).AsString := Rows.DBRecAr[i].Kol;
          //FieldByName(csField_Podrazd).AsInteger := Rows.DBRecAr[i].Podrazd;
        FieldByName(csField_Znak).AsString := Rows.DBRecAr[i].Znak;
        FieldByName(csField_Eim).AsString := Rows.DBRecAr[i].Eim;
        // FieldByName(csField_Kol2).AsString := Rows.DBRecAr[i].Kol2;
        FieldByName(csField_Primech).AsString := Rows.DBRecAr[i].Primech;
        // FieldByName(csField_Kol3).AsString := Rows.DBRecAr[i].Kol3;
        FieldByName(csField_norma).AsString := Rows.DBRecAr[i].Norma;
        // FieldByName(csField_kol_m).AsString := Rows.DBRecAr[i].Kol_m;
        // FieldByName(csField_kol_m2).AsString := Rows.DBRecAr[i].Kol_m2;
        // FieldByName(csField_kol_m3).AsString := Rows.DBRecAr[i].Kol_m3;
         {for j := 1 to 3 do
            if (Rows.DBRecAr[i].Kol[j] = 0) then
              FieldByName('kol' + IntToStr(j)).Value := Null
            else
              FieldByName('kol' + IntToStr(j)).AsInteger :=
                Rows.DBRecAr[i].Kol[j];}
          //Next;
      end;
      Post;
    end;
  except
    ShowMessage(csErrorMsg_RunError);
  end;

end;

procedure Tfrm42.btn5Click(Sender: TObject);
var
  s, s1: string;
begin
  if btn5.Down = true then
  begin
    s := '';
    s1 := Trim(medt1.Text);
    if (se1.Text <> '') and (se1.Value > 0) then
    begin
      s := '(Ki=''' + Padl(se1.Text, 4, '0') + ''')';
      if s1 <> '' then
        s := s + ' AND ';
    end;
    if s1 <> '' then
      s := s + '(Shifr=''' + s1 + ''')';
    if s <> '' then
    begin
      Table42.Filtered := False;
      Table42.Filter := s;
      Table42.Filtered := True;
      btn5.Font.Color := clBlue;
    end
    else
      btn5.Down := False;
  end
  else
  begin
    Table42.Filtered := False;
    btn5.Font.Color := clWindowText;
  end;

end;

procedure Tfrm42.se1Exit(Sender: TObject);
begin
  if se1.Text = '' then
    se1.Value := 0;
end;

procedure Tfrm42.Table42BeforeInsert(DataSet: TDataSet);
begin
  if (Table42.RecordCount > 0) and (Table42.RecNo > 0) then
  begin
    sPrevPrim := Table42.FieldByName('Primech').AsString;
  end;
end;

procedure Tfrm42.Table42AfterInsert(DataSet: TDataSet);
begin
  //Table42.FieldByName('Primech').AsString := sPrevPrim;
  lblRecCount.Caption := IntToStr(DataSource1.DataSet.RecordCount);
end;

procedure Tfrm42.Table42AfterDelete(DataSet: TDataSet);
begin
  lblRecCount.Caption := IntToStr(DataSource1.DataSet.RecordCount);
end;

procedure Tfrm42.N2Click(Sender: TObject);
begin
  SAVLib_DB.CopyDBGridToClipboardAsText(DBGrid1, True);
end;

procedure Tfrm42.N3Click(Sender: TObject);
begin
  SAVLib_DB.CopyDBGridToClipboardAsText(DBGrid1);

end;

procedure Tfrm42.N9Click(Sender: TObject);
begin
  SAVLib_DB.GridSelectAll(DBGrid1);
end;

function Head(Sheet: IXLSWorksheet): Integer;
begin
  Sheet.RCRange[1, 23, 3, 23].Font.Bold := True;
  Sheet.RCRange[1, 23, 3, 23].Font.Size := 11;
  Sheet.Cells.Item[2, 22].Value := csDocHead_1;
  Sheet.Cells.Item[3, 22].Value := csDocHead_2;
  Sheet.Cells.Item[2, 1].Value := csDocHead_3 + Copy(sDocName, 1, 10);
  Sheet.Cells.Item[3, 1].Value := Copy(sDocName, 12, 255);
  Result := 4;
end;

{
Вывод подписей
}

function Foot(Sheet: Variant; aRow: Integer): Integer;
var
  Range: Variant;
begin
  Range := Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 5, 20]];
  Range.Font.Size := 11;
  Range.Font.Bold := True;
  Range.Columns['R'].HorizontalAlignment := -4131;
  Range.Cells[1, 1] := csDocFoot_1;
  Range.Cells[1, 20] := csDocFoot_2;
  Range.Cells[3, 1] := csDocFoot_3;
  Range.Cells[3, 20] := csDocFoot_4;
  Range.Cells[5, 1] := csDocFoot_5;
  Range.Cells[5, 20] := csDocFoot_6;
  Result := aRow;
end;

function DelCR(Source: string): string;
const
  CR = $D;
var
  Dest: string;
  I: Integer;
begin
  Dest := '';
  for I := 1 to Length(Source) do
    if (Source[I] <> Chr(CR)) then
      Dest := Dest + Source[I];
  Result := Dest;
end;
{ DONE -oKoa : Добавить двойную линию }

procedure SetBorder(Range: Variant; Weight: Integer);
var
  Border: Variant;
  I: Integer;
begin
  for I := 7 to 11 do
  begin
    Border := Range.Borders[I]; // left
    Border.LineStyle := 1;
    //Border.Weight := Weight;
  end;
  if (Range.Rows.Count > 1) then
  begin
    Border := Range.Borders[I]; // left
    Border.LineStyle := 1;
  end;
  if (Weight < 0) then
    Range.Columns['C'].Borders[7].LineStyle := -4142;
end;

{
Для кодов 6,7,8 выбираем из Код2 либо квартал (по умолч), либо месяц
}

procedure GetFromKod2Str(const Kod_02: string; var k2Quartal:
  Integer;
  var k2Month: Integer; var k2Type: Integer);
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

procedure GetFromKod2(const Kod_02: integer; var k2Quartal: Integer;
  var k2Month: Integer; var k2Type: Integer);

begin
  GetFromKod2Str(IntToStr(Kod_02), k2Quartal, k2Month, k2Type);
end;

procedure Tfrm42.btnExcelClick(Sender: TObject);
var
  // ExcelApp, WorkBook, Sheet, Range: OleVariant;
  WorkBook: IXLSWorkbook;
  Sheet: IXLSWorksheet;
  Range: IXLSRange;
  aRow, {aCol,} I, j: Integer;
  TableRow: TTable;
  iRec: TRecord;
  TableBegin: integer;
  iQ, iM, iT, iKol: Integer;
  TMSKolAr: array[1..3] of Integer;
  TitleWidth: Real;
  ColumnCol, j0, CurIndex, num_i: Integer;
  sPrevPrim, sPrimTek, sExchPrimech: string;
  bPrintShifr: Boolean;
  F: System.Text;
  NameFile: string;

  procedure ExcelFormUpd;
  begin
    Inc(j0);
    if j0 > 100 then
    begin
      Application.ProcessMessages;
      j0 := 0;
    end;
  end;
begin
  btnExcel.Enabled := False;
  if dlgSave1.Execute then
  begin
    j0 := 0;
    sExchPrimech := '"-';
    TableRow := TTable.Create(self);
    TableRow.DatabaseName := Table42.DatabaseName;
    TableRow.TableName := Table42.TableName;
    TableRow.ReadOnly := True;
    try
      TableRow.Open
    except
      ShowMessage('Ошибка открытия таблицы');
    end;
    if TableRow.Active then
    begin
      iRec := TRecord.Create(CurRec.Digit, CurRec.Kod, CurRec.Title,
        CurRec.Sort,
        CurRec.Marsh, CurRec.Prim, CurRec.Data);
      bPrintShifr := False;
      CurIndex := iRec.Sort;
      TableRow.IndexDefs.Update;
      if CurIndex = 0 then
        TableRow.IndexName := ''
      else if (CurIndex < TableRow.IndexDefs.Count) then
        TableRow.IndexName := TableRow.IndexDefs.Items[CurIndex].Name;
      NameFile := NetDir + Workname_2 + csSymb_BackSlash + csNameDoc;
      if FileExists(NameFile) then
      begin
        AssignFile(F, NameFile);
        Reset(F);
        Readln(F, sDocName);
        CloseFile(F);
        try
          CurYear := YearOf(StrToDate(Copy(sDocName, 15, 8)));
        except
        end;
      end
      else
      begin
        sDocName := '';
        CurYear := YearOf(Date);
      end;
      TMSKolAr[1] := 14;
      TMSKolAr[2] := 8;
      TMSKolAr[3] := 4;
      //OleCheck(CoInitialize(nil));
      //ExcelApp := CreateOleObject(csDocExcel);

      Workbook := TXLSWorkbook.Create;
      Sheet := WorkBook.Sheets.Add;
      Sheet.Name := csDocSheetName_1;
      Sheet.Cells.Font.Name := csDocFont_1;
      Sheet.Cells.Font.Size := 12;
      // снять защиту
      Sheet.Cells.Locked := False;
      Workbook.Worksheets[1].PageSetup.LeftMargin := 0.3;
      Workbook.Worksheets[1].PageSetup.TopMargin := 0.3;
      Workbook.Worksheets[1].PageSetup.RightMargin := 0.3;
      Workbook.Worksheets[1].PageSetup.BottomMargin := 0.45;
      Workbook.Worksheets[1].PageSetup.FooterMargin := 0.2;
      Workbook.Worksheets[1].PageSetup.CenterFooter := csDocPageFooter;
      // "&""Arial Cyr,полужирный""&12&F - &D"
    ///////////////////////////////////////////////////
      Sheet.PageSetup.Orientation := 1;
      Sheet.PageSetup.PaperSize := xlPaperA4;
      Sheet.PageSetup.Zoom := False;
      Sheet.PageSetup.FitToPagesWide := 1;
      Sheet.PageSetup.FitToPagesTall := False;
      ///////////////////////////////////////////////////
      ColumnCol := 22;
      Sheet.Cells.Columns[1].Font.Bold := True;
      Sheet.Cells.Columns[2].Font.Bold := True;
      Sheet.Cells.Columns[1].ColumnWidth := 5;
      Sheet.Cells.Columns[2].ColumnWidth := 1.55;
      Sheet.Cells.Columns[3].ColumnWidth := 6.14;
      Sheet.Cells.Columns[4].ColumnWidth := 16;
      Sheet.Cells.Columns[5].ColumnWidth := 6;
      Sheet.Cells.Columns[6].ColumnWidth := 10;
      Sheet.Cells.Columns[7].ColumnWidth := 10;
      Sheet.Cells.Columns[8].ColumnWidth := 10;
      Sheet.Cells.Columns[9].ColumnWidth := 1;
      for i := 10 to 21 do
        Sheet.Cells.Columns[i].ColumnWidth := 2.29;
      Sheet.Cells.Columns[22].ColumnWidth := 30;
      TitleWidth := 0;
      //подсчет суммы ширин столбцов
      for I := 1 to 22 do
        TitleWidth := TitleWidth + Sheet.Cells.Columns[i].ColumnWidth;
      Sheet.Cells.Columns[27].ColumnWidth := TitleWidth;
      Sheet.Cells.Columns[27].WrapText := True;
      Sheet.Cells.Columns[27].Hidden := True;
      for i := 1 to 3 do
        Sheet.Cells.Rows[i].Font.Size := 11;
      aRow := Head(Sheet);
      Inc(aRow);
      Sheet.Cells.Item[aRow, 1].Font.Bold := True;
      Range := Sheet.RCRange[aRow, 1, aRow, ColumnCol];
      Range.Merge;
      Range.HorizontalAlignment := xlHAlignCenter;
      Range.VerticalAlignment := xlVAlignCenter;
      Range.WrapText := True;
      Sheet.Cells.Item[aRow, 27].Value := DelCR(iRec.Title);
      Sheet.Cells.Item[aRow, 1].Value := DelCR(iRec.Title);
      sPrevPrim := '';
      case CurRec.Kod of
        3, 5: //таблица корректировки лимита и остатка лимита ТМЦ месяц
          begin
            Inc(aRow);
            Sheet.RCRange[aRow, 1, aRow + 1, 1].Merge;
            Sheet.RCRange[aRow, 2, aRow + 1, 3].Merge;
            Sheet.RCRange[aRow, 4, aRow + 1, 4].Merge;
            Sheet.RCRange[aRow, 4, aRow + 1, 4].wraptext := True;
            Sheet.RCRange[aRow, 5, aRow + 1, 5].Merge;
            Sheet.RCRange[aRow, 5, aRow + 1, 5].wraptext := True;
            Sheet.RCRange[aRow, 6, aRow, 7].Merge;
            //месяц
            Sheet.RCRange[aRow + 1, 6, aRow + 1, 7].Merge; //кол-во
            Sheet.RCRange[aRow, 8, aRow + 1, 10].Merge;
            //цех пол
            Sheet.RCRange[aRow, 11, aRow + 1, 15].Merge;
            //знак
            Sheet.RCRange[aRow, 16, aRow + 1, 20].Merge;
            Sheet.RCRange[aRow, 21, aRow + 1, 22].Merge;
            Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].HorizontalAlignment :=
              xlHAlignCenter;
            Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].VerticalAlignment :=
              xlVAlignCenter;
            Sheet.Cells.Item[aRow, 1].Value := csDocColumn_1;
            Sheet.Cells.Item[aRow, 2].Value := csDocColumn_2;
            Sheet.Cells.Item[aRow, 4].Value := csDocColumn_11;
            Sheet.Cells.Item[aRow, 5].Value := csDocColumn_12;
            Sheet.Cells.Item[aRow + 1, 6].Value := csDocColumn_15;
            Sheet.Cells.Item[aRow, 6].Value :=
              SysUtils.LongMonthNames[StrToInt(iRec.Data)];
            Sheet.Cells.Item[aRow, 8].Value := csDocColumn_13;
            Sheet.Cells.Item[aRow, 11].Value := csDocColumn_17;
            Sheet.Cells.Item[aRow, 16].Value := csDocColumn_14;
            Sheet.Cells.Item[aRow, 21].Value := csDocColumn_9;
            Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].Font.Bold := True;
            SetBorderNative(Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol], 0);
            Sheet.Cells.Rows[aRow].RowHeight := 27;
            TableBegin := aRow + 2;
            Range := Sheet.RCRange[TableBegin, 1, TableBegin +
              TableRow.RecordCount - 1, ColumnCol];
            SetBorderNative(Range, -1);
            num_i := Ord(TableRow.Fields.FindField('Num') = nil);
            TableRow.First;
            inc(aRow, 2);
            I := 1;
            while not TableRow.Eof do
            begin
              Sheet.Cells.Item[aRow, 1].Value := I;
              Sheet.Cells.Item[aRow, 3].HorizontalAlignment := xlHAlignLeft;
              Sheet.Cells[aRow, 4].Font.Size := 12;
              Sheet.Cells.Item[aRow, 3].Value := TableRow.Fields[4 -
                num_i].AsString;
              Sheet.Cells.Item[aRow, 4].NumberFormat := '@';
              Sheet.Cells.Item[aRow, 4].Value := TableRow.Fields[3 -
                num_i].AsString;
              Sheet.Cells.Item[aRow, 5].Value := TableRow.Fields[8 -
                num_i].AsString;
              Sheet.Cells.Item[aRow, 5].HorizontalAlignment := xlHAlignCenter;
              Sheet.RCRange[aRow, 6, aRow, 7].Merge;
              Sheet.RCRange[aRow, 6, aRow, 7].NumberFormat := '# ##0,000';
              //месяц
              try
                Sheet.Cells.Item[aRow, 6].Value := TableRow.Fields[5 -
                  num_i].AsString;
              except
                Sheet.Cells.Item[aRow, 6].Value := 0;
              end;

              //                Sheet.Cells.Item[aRow, 6].NumberFormat := '# ##0,000';
              Sheet.Cells.Item[aRow, 6].HorizontalAlignment := xlHAlignRight;
              Sheet.RCRange[aRow, 8, aRow, 10].Merge;
              Sheet.Cells.Item[aRow, 8].Value := TableRow.Fields[2 -
                num_i].AsString;
              Sheet.Cells.Item[aRow, 8].HorizontalAlignment := xlHAlignCenter;
              Sheet.RCRange[aRow, 11, aRow, 15].Merge;
              Sheet.Cells.Item[aRow, 11].HorizontalAlignment :=
                xlHAlignCenter;
              Sheet.Cells.Item[aRow, 11].Value := TableRow.Fields[6 -
                num_i].AsString;
              Sheet.RCRange[aRow, 16, aRow, 20].Merge;
              Sheet.Cells.Item[aRow, 16].HorizontalAlignment :=
                xlHAlignCenter;
              Sheet.Cells.Item[aRow, 16].Value := TableRow.Fields[7 -
                num_i].AsString;
              Sheet.RCRange[aRow, 21, aRow, 22].Merge;
              sPrimTek := TableRow.Fields[10 - num_i].AsString;
              if (sPrimTek <> '') and (sPrimTek = sPrevPrim) then
                Sheet.Cells.Item[aRow, 21].Value := sExchPrimech
              else
              begin
                Sheet.Cells.Item[aRow, 21].Value := sPrimTek;
                sPrevPrim := sPrimTek;
              end;
              Inc(aRow);
              Inc(I);
              TableRow.Next;
            end;
            TableRow.Close;

            // защита ячеек
            Sheet.RCRange[TableBegin - 2, 1, aRow - 1, ColumnCol].Locked :=
              True;
            (*
              Inc(aRow);
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1, 1]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 2], Sheet.Cells[aRow + 1, 3]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 4], Sheet.Cells[aRow + 1, 4]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 4], Sheet.Cells[aRow + 1,
                4]].wraptext
                := True;
              Sheet.Range[Sheet.Cells[aRow, 5], Sheet.Cells[aRow + 1, 5]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 5], Sheet.Cells[aRow + 1,
                5]].wraptext
                := True;
              //  Sheet.Range[Sheet.Cells[aRow, 6], Sheet.Cells[aRow, 8]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 6], Sheet.Cells[aRow, 7]].Merge;
              //месяц
              Sheet.Range[Sheet.Cells[aRow + 1, 6], Sheet.Cells[aRow + 1,
                7]].Merge; //кол-во
              Sheet.Range[Sheet.Cells[aRow, 8], Sheet.Cells[aRow + 1,
                10]].Merge;
              //цех пол
              Sheet.Range[Sheet.Cells[aRow, 11], Sheet.Cells[aRow + 1,
                15]].Merge;
              //знак
              Sheet.Range[Sheet.Cells[aRow, 16], Sheet.Cells[aRow + 1,
                22]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]].HorizontalAlignment :=
                -4108;
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]].VerticalAlignment :=
                -4108;
              Sheet.Cells[aRow, 1] := csDocColumn_1;
              Sheet.Cells[aRow, 2] := csDocColumn_2;
              Sheet.Cells[aRow, 4] := csDocColumn_11;
              Sheet.Cells[aRow, 5] := csDocColumn_12;
              Sheet.Cells[aRow + 1, 6] := csDocColumn_15;
              Sheet.Cells[aRow, 6] :=
                SysUtils.LongMonthNames[StrToInt(iRec.Data)];
              Sheet.Cells[aRow, 8] := csDocColumn_13;
              Sheet.Cells[aRow, 11] := csDocColumn_14;
              Sheet.Cells[aRow, 16] := csDocColumn_9;
              { if bPrintShifr then
                 Sheet.Cells[aRow, 23] := csDocColumn_16;}
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]].Font.Bold := True;
              SetBorder(Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]], 0);
              Sheet.Rows[aRow].RowHeight := 27;
              aRow := aRow + 2;
              TableBegin := aRow;
              Range := Sheet.Range[Sheet.Cells[TableBegin, 1],
                Sheet.Cells[TableBegin
                + TableRow.RecordCount - 1, ColumnCol]];
              SetBorder(Range, -1);
              TableRow.First;
              I := 1;
              while not TableRow.Eof do
              begin
                ExcelFormUpd;
                Sheet.Cells[aRow, 1] := I;
                Sheet.Cells[aRow, 3].HorizontalAlignment := -4131;
                Sheet.Cells[aRow, 4].Font.Size := 13;
                Sheet.Cells[aRow, 3] := TableRow.Fields[3].AsString;
                Sheet.Cells[aRow, 4].NumberFormat := '@';
                Sheet.Cells[aRow, 4] := TableRow.Fields[2].AsString;
                Sheet.Cells[aRow, 5] := TableRow.Fields[7].AsString;
                Sheet.Cells[aRow, 5].HorizontalAlignment := -4108;
                Sheet.Range[Sheet.Cells[aRow, 6], Sheet.Cells[aRow, 7]].Merge;
                //месяц
                try
                  Sheet.Cells[aRow, 6] := TableRow.Fields[4].AsFloat;
                except
                  Sheet.Cells[aRow, 6] := 0;
                end;
                Sheet.Cells[aRow, 6].NumberFormat := '0,000';
                Sheet.Cells[aRow, 6].HorizontalAlignment := -4152;
                Sheet.Range[Sheet.Cells[aRow, 8], Sheet.Cells[aRow, 10]].Merge;
                Sheet.Cells[aRow, 8] := TableRow.Fields[1].AsString;
                Sheet.Cells[aRow, 8].HorizontalAlignment := -4108;
                Sheet.Range[Sheet.Cells[aRow, 11], Sheet.Cells[aRow, 15]].Merge;
                Sheet.Cells[aRow, 11].HorizontalAlignment := -4108;
                Sheet.Cells[aRow, 11] := TableRow.Fields[6].AsString;
                Sheet.Range[Sheet.Cells[aRow, 16], Sheet.Cells[aRow, 22]].Merge;
                sPrimTek := TableRow.Fields[9].AsString;
                if (sPrimTek <> '') and (sPrimTek = sPrevPrim) then
                  Sheet.Cells[aRow, 16] := sExchPrimech
                else
                begin
                  Sheet.Cells[aRow, 16] := sPrimTek;
                  sPrevPrim := sPrimTek;
                end;
                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;
              TableRow.Close;
              // защита ячеек
              Sheet.Range[Sheet.Cells[TableBegin - 2, 1], Sheet.Cells[aRow - 1,
                ColumnCol]].Locked := True;
              *)
          end;
        4: //таблица корректировки лимита ТМЦ квартал
          begin
            Inc(aRow);
            GetFromKod2(StrToInt(iRec.Data), iQ, iM, iT);
            Sheet.RCRange[aRow, 1, aRow + 1, 1].Merge;
            Sheet.RCRange[aRow, 2, aRow + 1, 3].Merge;
            Sheet.RCRange[aRow, 4, aRow + 1, 4].Merge;
            Sheet.RCRange[aRow, 4, aRow + 1, 4].wraptext := True;
            Sheet.RCRange[aRow, 5, aRow + 1, 5].Merge;
            Sheet.RCRange[aRow, 5, aRow + 1, 5].wraptext := True;
            Sheet.RCRange[aRow, 6, aRow, 8].Merge;
            Sheet.RCRange[aRow, 9, aRow + 1, 12].Merge;
            Sheet.RCRange[aRow, 13, aRow + 1, 16].Merge;
            Sheet.RCRange[aRow, 17, aRow + 1, 22].Merge;
            Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].HorizontalAlignment :=
              xlHAlignCenter;
            Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].VerticalAlignment :=
              xlHAlignCenter;
            Sheet.Cells.Item[aRow, 1].Value := csDocColumn_1;
            Sheet.Cells.Item[aRow, 2].Value := csDocColumn_2;
            Sheet.Cells.Item[aRow, 4].Value := csDocColumn_11;
            Sheet.Cells.Item[aRow, 5].Value := csDocColumn_12;
            Sheet.Cells.Item[aRow, 6].Value := csDocColumn_15;
            Sheet.Cells.Item[aRow, 9].Value := csDocColumn_13;
            Sheet.Cells.Item[aRow, 13].Value := csDocColumn_14;
            Sheet.Cells.Item[aRow, 17].Value := csDocColumn_9;
            // название месяцев
            if iT = 2 then
            begin //буд квартал, все мес
              iKol := 3;
            end
            else if iT = 1 then
            begin //текущий квартал, анализируем месяца
              iKol := 4 - iM;
            end;
            i := iKol;
            while i > 0 do
            begin
              Sheet.Cells.Item[aRow + 1, 9 - i].Value :=
                SysUtils.LongMonthNames[(iQ - 1) * 3 + 4 - i];
              Dec(i);
            end;
            // -----
            Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].Font.Bold := True;
            SetBorderNative(Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol], 0);
            Sheet.Cells.Rows[aRow].RowHeight := 27;
            CurIndex := iRec.Sort;
            TableRow.IndexDefs.Update;
            if CurIndex = 0 then
              TableRow.IndexName := ''
            else if (CurIndex < TableRow.IndexDefs.Count) then
              TableRow.IndexName := TableRow.IndexDefs.Items[CurIndex].Name;
            aRow := aRow + 2;
            TableBegin := aRow;
            Range := Sheet.RCRange[TableBegin, 1, TableBegin +
              TableRow.RecordCount - 1, ColumnCol];
            SetBorderNative(Range, -1);
            num_i := Ord(TableRow.Fields.FindField('Num') <> nil);
            TableRow.First;
            I := 1;
            while not TableRow.Eof do
            begin
              Sheet.Cells.Item[aRow, 1].Value := I;
              Sheet.Cells.Item[aRow, 3].HorizontalAlignment := xlHAlignLeft;
              Sheet.Cells.Item[aRow, 4].Font.Size := 12;
              Sheet.Cells.Item[aRow, 4].NumberFormat := '@';
              Sheet.Cells.Item[aRow, 3].Value := TableRow.Fields[3 +
                num_i].AsString;
              Sheet.Cells.Item[aRow, 4].Value := TableRow.Fields[2 +
                num_i].AsString;
              Sheet.Cells.Item[aRow, 5].Value := TableRow.Fields[7 +
                num_i].AsString;
              Sheet.Cells.Item[aRow, 5].HorizontalAlignment := xlHAlignCenter;
              j := iKol;
              while j > 0 do
              begin
                Sheet.RCRange[aRow, 9 - j, aRow, 9 - j].NumberFormat :=
                  '# ##0,000';
                Sheet.Cells.Item[aRow, 9 - j].Value :=
                  TableRow.Fields[TMSKolAr[j] + num_i].AsString;
                {Sheet.Cells.Item[aRow, 9 - j].Value :=
                  StringReplace(TableRow.Fields[TMSKolAr[j]].AsString, ',',
                  '.', [rfReplaceAll]);}
                Dec(j);
              end;
              Sheet.RCRange[aRow, 9, aRow, 12].Merge;
              Sheet.Cells.Item[aRow, 9].Value := TableRow.Fields[1 +
                num_i].AsString;
              Sheet.Cells.Item[aRow, 9].HorizontalAlignment := xlHAlignCenter;
              Sheet.RCRange[aRow, 13, aRow, 16].Merge;
              Sheet.RCRange[aRow, 13, aRow, 16].NumberFormat := '0';
              Sheet.Cells.Item[aRow, 13].Value := TableRow.Fields[6 +
                num_i].AsString;
              Sheet.Cells.Item[aRow, 13].HorizontalAlignment :=
                xlHAlignCenter;
              Sheet.RCRange[aRow, 17, aRow, 22].Merge;
              sPrimTek := TableRow.Fields[9 + num_i].AsString;
              if (sPrimTek <> '') and (sPrimTek = sPrevPrim) then
                Sheet.Cells.Item[aRow, 17].Value := sExchPrimech
              else
              begin
                Sheet.Cells.Item[aRow, 17].Value := sPrimTek;
                sPrevPrim := sPrimTek;
              end;
              Inc(aRow);
              Inc(I);
              TableRow.Next;
            end;
            TableRow.Close;

            // защита ячеек
            //Sheet.RCRange[TableBegin - 2, 1, aRow - 1, 22].Locked := True;
            (*Inc(aRow);
            GetFromKod2(StrToInt(iRec.Data), iQ, iM, iT);
            Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1, 1]].Merge;
            Sheet.Range[Sheet.Cells[aRow, 2], Sheet.Cells[aRow + 1, 3]].Merge;
            Sheet.Range[Sheet.Cells[aRow, 4], Sheet.Cells[aRow + 1, 4]].Merge;
            Sheet.Range[Sheet.Cells[aRow, 4], Sheet.Cells[aRow + 1,
              4]].wraptext
              := True;
            Sheet.Range[Sheet.Cells[aRow, 5], Sheet.Cells[aRow + 1, 5]].Merge;
            Sheet.Range[Sheet.Cells[aRow, 5], Sheet.Cells[aRow + 1,
              5]].wraptext
              := True;
            Sheet.Range[Sheet.Cells[aRow, 6], Sheet.Cells[aRow, 8]].Merge;
            Sheet.Range[Sheet.Cells[aRow, 9], Sheet.Cells[aRow + 1,
              12]].Merge;
            Sheet.Range[Sheet.Cells[aRow, 13], Sheet.Cells[aRow + 1,
              16]].Merge;
            //Sheet.Range[Sheet.Cells[aRow, 6], Sheet.Cells[aRow, 8]].Merge;
            Sheet.Range[Sheet.Cells[aRow, 17], Sheet.Cells[aRow + 1,
              22]].Merge;
            if bPrintShifr then
              Sheet.Range[Sheet.Cells[aRow, 23], Sheet.Cells[aRow + 1,
                23]].Merge;
            Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
              ColumnCol]].HorizontalAlignment :=
              -4108;
            Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
              ColumnCol]].VerticalAlignment :=
              -4108;
            Sheet.Cells[aRow, 1] := csDocColumn_1;
            Sheet.Cells[aRow, 2] := csDocColumn_2;
            Sheet.Cells[aRow, 4] := csDocColumn_11;
            Sheet.Cells[aRow, 5] := csDocColumn_12;
            Sheet.Cells[aRow, 6] := csDocColumn_15;
            Sheet.Cells[aRow, 9] := csDocColumn_13;
            Sheet.Cells[aRow, 13] := csDocColumn_14;
            Sheet.Cells[aRow, 17] := csDocColumn_9;
            // название месяцев
            if iT = 2 then
            begin //буд квартал, все мес
              iKol := 3;
            end
            else if iT = 1 then
            begin //текущий квартал, анализируем месяца
              iKol := 4 - iM;
            end;
            i := iKol;
            while i > 0 do
            begin
              Sheet.Cells[aRow + 1, 9 - i] := SysUtils.LongMonthNames[(iQ - 1) *
                3 + 4 - i];
              Dec(i);
            end;
            // -----
            Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
              ColumnCol]].Font.Bold := True;
            SetBorder(Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
              ColumnCol]], 0);
            Sheet.Rows[aRow].RowHeight := 27;
            aRow := aRow + 2;
            TableBegin := aRow;
            Range := Sheet.Range[Sheet.Cells[TableBegin, 1],
              Sheet.Cells[TableBegin
              + TableRow.RecordCount - 1, ColumnCol]];
            SetBorder(Range, -1);
            TableRow.First;
            I := 1;
            while not TableRow.Eof do
            begin
              ExcelFormUpd;
              Sheet.Cells[aRow, 1] := I;
              Sheet.Cells[aRow, 3].HorizontalAlignment := -4131;
              Sheet.Cells[aRow, 4].Font.Size := 13;
              Sheet.Cells[aRow, 4].NumberFormat := '@';
              Sheet.Cells[aRow, 3] := TableRow.Fields[3].AsString;
              Sheet.Cells[aRow, 4] := TableRow.Fields[2].AsString;
              Sheet.Cells[aRow, 5] := TableRow.Fields[7].AsString;
              Sheet.Cells[aRow, 5].HorizontalAlignment := -4108;
              j := iKol;
              while j > 0 do
              begin
                Sheet.Range[Sheet.Cells[aRow, 9 - j], Sheet.Cells[aRow, 9 -
                  j]].NumberFormat := '0,000';
                //                Sheet.Cells[aRow, 9 - j].NumberFormat := '0.000';
                Sheet.Cells[aRow, 9 - j] :=
                  StringReplace(TableRow.Fields[TMSKolAr[j]].AsString, ',',
                  '.',
                  [rfReplaceAll]);
                Dec(j);
              end;
              Sheet.Range[Sheet.Cells[aRow, 9], Sheet.Cells[aRow, 12]].Merge;
              Sheet.Cells[aRow, 9] := TableRow.Fields[1].AsString;
              Sheet.Cells[aRow, 9].HorizontalAlignment := -4108;
              Sheet.Range[Sheet.Cells[aRow, 13], Sheet.Cells[aRow, 16]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 13], Sheet.Cells[aRow,
                16]].NumberFormat := '0';
              Sheet.Cells[aRow, 13] := TableRow.Fields[6].AsString;
              Sheet.Cells[aRow, 13].HorizontalAlignment := -4108;
              Sheet.Range[Sheet.Cells[aRow, 17], Sheet.Cells[aRow, 22]].Merge;
              sPrimTek := TableRow.Fields[9].AsString;
              if (sPrimTek <> '') and (sPrimTek = sPrevPrim) then
                Sheet.Cells[aRow, 17] := sExchPrimech
              else
              begin
                Sheet.Cells[aRow, 17] := sPrimTek;
                sPrevPrim := sPrimTek;
              end;
              Inc(aRow);
              Inc(I);
              TableRow.Next;
            end;*)
          end;
      end;
      Sheet.PageSetup.PrintArea := 'A1:V' + IntToStr(aRow + 1);
      WorkBook.SaveAs(dlgSave1.FileName);
      ShellExecute(Handle, 'open', PAnsiChar(dlgSave1.FileName), nil, nil,
        SW_RESTORE);
    end;
    FreeAndNil(TableRow);

  end;
  btnExcel.Enabled := True;
end;

procedure SetBorderNative(Range: IXLSRange; Weight: Integer);
var
  Border: IXLSBorder;
  I: Integer;
begin
  for I := 7 to 11 do
  begin
    Border := Range.Borders[i];
    Border.LineStyle := xlContinuous
  end;
  if (Range.Rows.Count > 1) then
  begin
    Border := Range.Borders[I]; // left
    Border.LineStyle := 1;
  end;
  if (Weight < 0) then
    Range.Columns[3].Borders[7].LineStyle := xlLineStyleNone;
end;

procedure Tfrm42.SetIndex(_Sort: Integer);
var
  bActive: Boolean;
  IndexNames1: TStringList;
  iKi, iShifr: string;
begin
  IndexNames1 := TStringList.Create;
  { DONE : Добавить поиск по индексам }
  if Table42.Active then
  begin
    if Table42.State <> dsBrowse then
      Table42.Post;
    //   iNum := Table42.FieldByName('Num').AsInteger;
    iKi := Table42.FieldByName('Ki').Asstring;
    iShifr := Table42.FieldByName('Shifr').Asstring;
  end;
  bActive := Table42.Active;
  if bActive then
    Table42.Active := False;
  Table42.Exclusive := True;
  Table42.Active := True;
  //SortTMS := _Sort;
  Table42.GetIndexNames(IndexNames1);
  if (_Sort = 0) or (IndexNames1.Count = 0) then
    Table42.IndexName := ''
  else
    Table42.IndexName := IndexNames1[_Sort - 1];
  Table42.Active := False;
  Table42.Exclusive := False;
  if bActive then
  begin
    Table42.Open;
    case _Sort of
      // 0: Table42.Locate('Num', iNum, []);
      1: Table42.Locate('Ki', iKi, []);
      2: Table42.Locate('Shifr', iShifr, []);
      3: Table42.Locate('Ki;Shifr', VarArrayOf([iKi, iShifr]), []);
    end;
  end;
  CurRec.Sort := _Sort;
  FreeAndNil(IndexNames1);
end;

procedure Tfrm42.btnSort2Click(Sender: TObject);
begin
  if btnSort2.Down then
    SetIndex(2);
end;

procedure Tfrm42.btnSort0Click(Sender: TObject);
begin
  if btnSort0.Down then
    SetIndex(0);
end;

procedure Tfrm42.btnSort1Click(Sender: TObject);
begin
  if btnSort1.Down then
    SetIndex(1);
end;

initialization
  //  GetZehList(ZehList1);

end.

