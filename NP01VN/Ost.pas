unit Ost;

interface

uses
  Windows, ShellAPI, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Grids, DBGrids, DBTables, DB, StdCtrls, Printers, {FileCtrl,}
  StrUtils, Dialogs, Buttons, ExtCtrls, jpeg, Constants, SHFolder, Mask,
  Spin, Menus, StdActns, ActnList;

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
    btnMSO: TButton;
    pm1: TPopupMenu;
    N9: TMenuItem;
    N4: TMenuItem;
    N1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N7: TMenuItem;
    lblShifrTitle: TLabel;
    N10: TMenuItem;
    N11: TMenuItem;
    actlst1: TActionList;
    edtct1: TEditCut;
    edtcpy1: TEditCopy;
    edtpst1: TEditPaste;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    btnSave: TBitBtn;
    tmr1: TTimer;
    txtKodPodr: TStaticText;
    grp1: TGroupBox;
    btnSort0: TSpeedButton;
    btnSort2: TSpeedButton;
    btnSort1: TSpeedButton;
    btn6: TBitBtn;
    btn7: TButton;
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
    procedure btnMSOClick(Sender: TObject);
    procedure Table42AfterDelete(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btnSort0Click(Sender: TObject);
    procedure btnSort2Click(Sender: TObject);
    procedure btnSort1Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
  public
    function CreateMak42(FileName: string; Table1: TTable; KolField: string =
      csField_Kol; Ostatok: Boolean = False): integer;
    //procedure AddToArchive;
    procedure Spr(FileName: string; Table1: TTable);
    procedure TableSave;
    procedure NormaHack; //с 9 символов до 13 расширяем
    procedure CreateNewTableTMS(NewTable: TTable);
    procedure SetIndex(_Sort: Integer);
    procedure CreateIndex;
  end;

  TZehList = array of integer;
var
  frm42: Tfrm42;
  ZehList1: TZehList;
  CurPok: integer;
  FullNetPath: string;
  SortTMS: Integer;

function Find(Ar: array of integer; X: Integer): integer;
procedure CopyToA(FileName: string);
procedure CopyMak(FileName, NetPath: string);
procedure GetZehList(var _ZehList: TZehList);

implementation

uses Main, KoaUtils, Index, NewString, ASU_DBF, ClipB, math, PasteFromMSO,
  SAVLib, SAVLib_DB;

{$R *.dfm}

var
  NS03, NS02KI: string;
  iNum: Byte = 1;
  CurDate: string;
  sPrevPrim, sPrevPodrazd, FormCapt: string; //примечание из предыдущ записи
  //убирает лишние пробелы из строкового флоата

function GetFloatTrimStr(a: string): string;
begin
  Result := StringReplace(a, ' ', '', [rfReplaceAll]);
  if (Result = ',') or (Result = '') then
    Result := '0';
end;

function CheckKi(var source: string): Boolean;
begin
  Result := not (StrToIntDef(source, 0) = 0);
  if Result and (Length(source) <= 4) then
    source := SAVLib.Padl(source, 4, '0')
  else
    Result := False;
end;

function CheckZnak(var source: string): Boolean;
begin
  source := Trim(source);
  Result := (source = '0') or (source = '1');

end;

function CheckShifr(var source: string): Boolean;
var
  i, n: Integer;
begin
  Result := True;
  source := Trim(source);
  n := Length(source);
  if n < 9 then
  begin
    i := 1;
    while (i < n + 1) and (Result = True) do
    begin
      Result := (Pos(source[i], '0123456789') <> 0);
      Inc(i);
    end;
    if Result and (n < 8) then
      source := Padl(source, 8, '0');
  end
  else
    Result := False;
end;

function CheckCP(var source: string): Boolean;
var
  i, n: Integer;
begin
  Result := True;
  source := Trim(source);
  n := Length(source);
  if n < 4 then
  begin
    i := 1;
    while (i < n + 1) and (Result = True) do
    begin
      Result := (Pos(source[i], '0123456789') <> 0);
      Inc(i);
    end;
    if Result and (n < 2) then
      source := Padl(source, 2, '0');
  end
  else
    Result := False;
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

  procedure Podr118;
  begin
    txt10.Visible := False;
    txt11.Visible := False;
    txt12.Visible := False;
    DBGrid1.Columns[4].Visible := False;
    DBGrid1.Columns[5].Visible := False;
    txt4.Left := txt3.Left + txt3.Width - 2;
    txt5.Left := txt4.Left;
    txt4.Width := txt4.Width + txt11.Width - 2;
    txt5.Width := txt4.Width;
    DBGrid1.Columns[6].Width := txt4.Width - 2;
    txt7.Left := txt4.Left + txt4.Width - 2;
    txt8.Left := txt7.Left + txt7.Width - 2;
    txt9.Left := txt8.Left + txt8.Width - 2;
  end;
begin
  Table42Podrazd.DefaultExpression := UsrAcs.DivisionStr;
  Table42.ReadOnly := Index.FormIndex.lbl1.Visible or Index.ShowOld;
  mmo1.ReadOnly := Table42.ReadOnly;
  btn3.Enabled := not (Table42.ReadOnly);
  btn4.Enabled := not (Table42.ReadOnly);
  btnMSO.Enabled := not (Table42.ReadOnly);
  N5.Enabled := not (Table42.ReadOnly);
  N6.Enabled := not (Table42.ReadOnly);
  N7.Enabled := not (Table42.ReadOnly);
  N11.Enabled := not (Table42.ReadOnly);
  N12.Enabled := not (Table42.ReadOnly);
  N15.Enabled := not (Table42.ReadOnly);
  Table42.DisableControls;
  Table42.TableType := ttParadox;
  Table42.TableName := csNP01F + IntToStr(CurRec.Digit) + csDBExt;
  Table42.DatabaseName := StartDir + WorkName_2 + '\';
  mmo1.Text := CurRec.Title;
  case NewString.Kod of
    3:
      begin
        frm42.Caption := csLimitCorrect + csMonth;
        TableHeaderMove(1, True);
        txt5.Caption := SysUtils.LongMonthNames[kod2];
        DBGrid1.Columns[13].Visible := UsrAcs.Shortened;
        DBGrid1.Columns[13].Width := txtKodPodr.Width - 2;
        txtKodPodr.Visible := UsrAcs.Shortened;
        if UsrAcs.Shortened then
        begin
          Podr118;
          txtKodPodr.Left := txt8.Left + txt8.Width - 2;
          txt9.Left := txtKodPodr.Left + txtKodPodr.Width - 2;
          DBGrid1.Columns[13].PickList.Assign(UsrAcs.CodsList);
        end
        else
          txt9.Left := txt8.Left + txt8.Width - 2;
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
        DBGrid1.Columns[13].Visible := UsrAcs.Shortened;
        DBGrid1.Columns[13].Width := txtKodPodr.Width - 2;
        txtKodPodr.Visible := UsrAcs.Shortened;
        if UsrAcs.Shortened then
        begin
          Podr118;
          txtKodPodr.Left := txt8.Left + txt8.Width - 2;
          txt9.Left := txtKodPodr.Left + txtKodPodr.Width - 2;
          DBGrid1.Columns[13].PickList.Assign(UsrAcs.CodsList);
        end
        else
          txt9.Left := txt8.Left + txt8.Width - 2;
      end;
  end;

  if not FileExists(Table42.DatabaseName + Table42.TableName) then
  begin
    if not Table42.ReadOnly then
      CreateNewTableTMS(Table42)
    else
    begin
      ShowMessage('Таблица не обнаружена в сетевом хранилище!');
      Abort;
    end;
  end
  else if Form1.TableFieldTest(Table42, csField_Shifr) = False then
    CreateNewTableTMS(Table42);
  frm42.Caption := FormIndex.Label1.Caption + ' : ' + frm42.Caption;
  SortTMS := CurRec.Sort;
  SetIndex(SortTMS);
  (Self.FindComponent('btnSort' + inttostr(SortTMS)) as TSpeedButton).Down
    :=
    True;
  Table42.Open;
  // Хак на изменение поля Норма
  NormaHack;
  Table42.Last;
  Table42.EnableControls;
  lblRecCount.Caption := IntToStr(DataSource1.DataSet.RecordCount);
  FormCapt := frm42.Caption;
  tmr1.Interval := 1000 * iAutoSaveSec;
  tmr1.Enabled := (not (Table42.ReadOnly)) and (bAutoSave);
  frm42.Caption := FormCapt + '     Открыто в ' + SysUtils.TimeToStr(Time);
end;

procedure Tfrm42.CreateIndex;
var
  NumIndex: Integer;
begin
  with Table42 do
  begin
    Open;
    IndexDefs.Update;
    NumIndex := IndexDefs.Count;
    Close;
    if (NumIndex < 2) then
    begin // создать индекс
      Exclusive := True;
      Open;
      if (NumIndex = 0) then
        AddIndex('', 'Num', [ixPrimary]);
      AddIndex('TMS_Ki', 'KI', [ixCaseInsensitive]);
      AddIndex('TMS_Shi', 'Shifr', [ixCaseInsensitive]);
      AddIndex('TMS_KiShi', 'Ki;Shifr', [ixCaseInsensitive]);
      Close;
      Exclusive := False;
    end;
  end;
end;

procedure GetZehList(var _ZehList: TZehList);
var
  q: TQuery;
  i: integer;
begin
  q := TQuery.Create(nil);
  q.SQL.Text := 'select ceh from "' + sSM50 + '" where pr_gr="11" order by ceh';
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
      txt7.Left := txt12.Left + txt12.Width - 2;
      txt8.Left := txt7.Left + txt7.Width - 2;
      txt9.Left := txt8.Left + txt8.Width - 2;
    end
    else
    begin
      txt9.Left := 720;
      txt8.Left := 670;
      txt7.Left := 626;
      txt4.Width := 344;
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
    txt9.Left := 720;
    txt8.Left := 670;
    txt7.Left := 626;
    txt4.Width := 344;
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
  if (TField(Sender).AsString = '') or
    (Find(ZehList1, TField(Sender).AsInteger) = -1) then
    SysUtils.Abort;
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
begin
  TField(Sender).AsString := Padl(Text, 8, '0');
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
    iKi := Table42.FieldByName('Ki').Asstring;
    iShifr := Table42.FieldByName('Shifr').Asstring;
  end;
  bActive := Table42.Active;
  if bActive then
    Table42.Active := False;
  Table42.Exclusive := True;
  Table42.Active := True;
  SortTMS := _Sort;
  Table42.GetIndexNames(IndexNames1);
  if (SortTMS = 0) or (IndexNames1.Count = 0) then
    Table42.IndexName := ''
  else
    Table42.IndexName := IndexNames1[SortTMS - 1];
  Table42.Active := False;
  Table42.Exclusive := False;
  if bActive then
  begin
    Table42.Open;
    case SortTMS of
      1: Table42.Locate('Ki', iKi, []);
      2: Table42.Locate('Shifr', iShifr, []);
      3: Table42.Locate('Ki;Shifr', VarArrayOf([iKi, iShifr]), []);
    end;
  end;
  FreeAndNil(IndexNames1);
end;

procedure Tfrm42.CreateNewTableTMS(NewTable: TTable);
var
  q: TQuery;
  t: TTable;
  s: string;
begin
  s := NewTable.DatabaseName + NewTable.TableName;
  if FileExists(s) then
    fDeleteFile(s);
  if (iNum = 1) then
  begin
    t := TTable.Create(Self);
    with t do
    begin
      TableName := NewTable.TableName;
      DatabaseName := NewTable.DatabaseName;
      TableType := ttParadox;
      Exclusive := True;
      DefaultIndex := False;
      if not Exists then
      begin
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
        Kol3 char(11))    = 14}
        with FieldDefs do
        begin
          Clear;
          Add('Num', ftAutoInc, 0, True);
          Add('Vp', ftString, 1, True);
          Add('Cp', ftString, 3, True);
          Add('Shifr', ftString, 8, True);
          Add('KI', ftString, 4);
          Add('Kol', ftString, 11);
          Add('Podrazd', ftInteger);
          Add('Znak', ftString, 1, True);
          Add('Eim', ftString, 5);
          Add('Kol2', ftString, 11);
          Add('Primech', ftString, 50);
          Add('Norma', ftString, 13);
          Add('Kol_m', ftString, 3);
          Add('Kol_m2', ftString, 3);
          Add('Kol_m3', ftString, 3);
          Add('Kol3', ftString, 11);
        end;
        IndexDefs.Clear;
        IndexDefs.Add('', 'Num', [ixPrimary]);
        CreateTable;
        AddIndex('TMS_Ki', 'KI', [ixCaseInsensitive]);
        AddIndex('TMS_Shi', 'Shifr', [ixCaseInsensitive]);
        AddIndex('TMS_KiShi', 'Ki;Shifr', [ixCaseInsensitive]);
      end;
    end;
    if t.Active then
      t.Close;
    FreeAndNil(t);
  end
  else
  begin
    q := TQuery.Create(nil);
    q.SQL.Text := 'create table "' + NewTable.TableName +
      '" (Num autoinc, KI char(4), Chert char(13), Kol integer, TM char(32), ' +
      'TM1 char(22) )';
    q.ExecSQL;
    FreeAndNil(q);
  end;
end;

procedure Tfrm42.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Table42.ReadOnly = False then
  begin
    tmr1.Enabled := False;
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
    CurRec.Sort := SortTMS;
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
  case Key of
    VK_DECIMAL, 188, 190:
      // По нажатию тчк или зпт в полях кол-во переход на символ после разделителя
      begin
        if (DBGrid1.SelectedField.FieldName = csField_Kol) or
          (DBGrid1.SelectedField.FieldName = csField_Kol2) or
          (DBGrid1.SelectedField.FieldName = csField_Kol3) or
          (DBGrid1.SelectedField.FieldName = csField_Norma) then
        begin
          Key := 0;
          for B := 0 to DBGrid1.ControlCount - 1 do
            if DBGrid1.Controls[B] is TInPlaceEdit then
              with DBGrid1.Controls[B] as TInPlaceEdit do
                if DBGrid1.SelectedField.FieldName = csField_Norma then
                  SelStart := 4
                else
                  SelStart := 7;
        end;
      end;
    VK_RETURN:
      begin
        repeat
          DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1;
        until DBGrid1.Columns.Items[DBGrid1.SelectedIndex].Visible;
        for B := 0 to DBGrid1.ControlCount - 1 do
          if DBGrid1.Controls[B] is TInPlaceEdit then
            with DBGrid1.Controls[B] as TInPlaceEdit do
            begin
              SelStart := 0;
              SelLength := 0;
            end;
      end;
    VK_LEFT:
      begin
        for B := 0 to DBGrid1.ControlCount - 1 do
          if DBGrid1.Controls[B] is TInPlaceEdit then
            with DBGrid1.Controls[B] as TInPlaceEdit do
              if SelStart = 0 then
                repeat
                  DBGrid1.SelectedIndex := DBGrid1.SelectedIndex - 1;
                until DBGrid1.Columns.Items[DBGrid1.SelectedIndex].Visible;
      end;
  end;

end;

function Tfrm42.CreateMak42(FileName: string; Table1: TTable; KolField: string
  = csField_Kol; Ostatok: Boolean = False): integer;
var
  f: TextFile;
  s: string;
  Kol: real;
  Zel, Drobn: string;

begin
  Result := 0;
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
    CloseFile(f);
  end;
end;

procedure CopyMak(FileName, NetPath: string);
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
  AssignFile(f, FileName);
  try
    Rewrite(f);
    Writeln(f);
    Writeln(f);
    Writeln(f);
    Writeln(f);
    Writeln(f, '            СПРАВКА О ЗАПИСАННЫХ ДАННЫХ');
    Writeln(f, '                  К ЗАДАЧЕ MS02');
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
  except
    CloseFile(f);
  end;
end;

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

procedure CopyToA(FileName: string);
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
end;

procedure Tfrm42.FormCreate(Sender: TObject);
begin
  NS03 := GetPath(Basespdo, cNS03Table) + cNS03Table;
  NS02KI := GetPath(Basespdo, cNS02KITable);
  DateTimeToString(CurDate, csDdmmyy, Date());
  sPrevPrim := '';
  sPrevPodrazd := UsrAcs.DivisionStr;
end;

procedure Tfrm42.DBGrid1ColExit(Sender: TObject);
var
  t: TTable;
  s: string;
begin
  if ((DBGrid1.DataSource.DataSet.State = dsEdit) or
    (DBGrid1.DataSource.DataSet.State = dsInsert)) then
  begin
    case DBGrid1.SelectedIndex of
      1:
        begin
          t := TTable.Create(nil);
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
          FreeAndNil(t);
        end;
    end;
  end;
end;

procedure Tfrm42.Table42KISetText(Sender: TField; const Text: string);
begin
  TField(Sender).AsString := Padl(Text, 4, '0');
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
      for i := 0 to Rows.Num - 1 do
      begin
        Append;
        FieldByName(csField_VP).Asstring := Rows.DBRecAr[i].Vp;
        FieldByName(csField_Cp).AsString := Rows.DBRecAr[i].Cp;
        FieldByName(csField_Shifr).AsString := Rows.DBRecAr[i].Shifr;
        FieldByName(csField_Ki).AsString := Rows.DBRecAr[i].KI;
        FieldByName(csField_Kol).AsString := Rows.DBRecAr[i].Kol;
        FieldByName(csField_Znak).AsString := Rows.DBRecAr[i].Znak;
        FieldByName(csField_Eim).AsString := Rows.DBRecAr[i].Eim;
        FieldByName(csField_Kol2).AsString := Rows.DBRecAr[i].Kol2;
        FieldByName(csField_Primech).AsString := Rows.DBRecAr[i].Primech;
        FieldByName(csField_Kol3).AsString := Rows.DBRecAr[i].Kol3;
        FieldByName(csField_norma).AsString := Rows.DBRecAr[i].Norma;
        FieldByName(csField_kol_m).AsString := Rows.DBRecAr[i].Kol_m;
        FieldByName(csField_kol_m2).AsString := Rows.DBRecAr[i].Kol_m2;
        FieldByName(csField_kol_m3).AsString := Rows.DBRecAr[i].Kol_m3;
      end;
      Post;
    end;
  except
    ShowMessage(csErrorMsg_RunError);
  end;
  lblRecCount.Caption := IntToStr(DataSource1.DataSet.RecordCount);
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
    if Length(Result) > 11 then
      ShowMessage('Полученное в результате умножения на норму число "' + Result
        +
        '" больше 9999999,999.'#13#10'Верхние разряды числа будут утеряны. Необходима корректировка нормы на машину либо кол-ва машин!');
  end;

begin
  lblShifrTitle.Caption :=
    FormIndex.GetShifrTitle(DBGrid1.DataSource.DataSet.FieldByName('Shifr').AsString);
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
      ShowMessage('Ошибка открытия BD06UL');
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
        FieldByName(csField_VP).Asstring := Rows.DBRecAr[i].Vp;
        FieldByName(csField_Cp).AsString := Rows.DBRecAr[i].Cp;
        FieldByName(csField_Shifr).AsString := Rows.DBRecAr[i].Shifr;
        FieldByName(csField_Ki).AsString := Rows.DBRecAr[i].KI;
        FieldByName(csField_Znak).AsString := Rows.DBRecAr[i].Znak;
        FieldByName(csField_Eim).AsString := Rows.DBRecAr[i].Eim;
        FieldByName(csField_Primech).AsString := Rows.DBRecAr[i].Primech;
        FieldByName(csField_norma).AsString := Rows.DBRecAr[i].Norma;
      end;
      Post;
    end;
  except
    ShowMessage(csErrorMsg_RunError);
  end;
  lblRecCount.Caption := IntToStr(DataSource1.DataSet.RecordCount);
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
      s := '(Ki=''' + Index.FormIndex.Padl(se1.Text, 4, '0') + ''')';
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
    sPrevPodrazd := Table42.fieldbyname('Podrazd').AsString;
  end;
end;

procedure Tfrm42.Table42AfterInsert(DataSet: TDataSet);
begin
  lblRecCount.Caption := IntToStr(DataSource1.DataSet.RecordCount);
  if DBGrid1.SelectedRows.Count > 1 then
    Table42.Cancel
  else
  begin
    DataSet.FieldByName('Podrazd').Value := sPrevPodrazd;
    DBGrid1.SelectedIndex := 0;
  end;
end;

procedure Tfrm42.btnMSOClick(Sender: TObject);
var
  IgnList, ImpList: TStringList;
  TestList: TList;
begin
  IgnList := TStringList.Create;
  ImpList := TStringList.Create;
  TestList := TList.Create;
  TestList.Add(TTestElement.Create('KI', CheckKi));
  TestList.Add(TTestElement.Create('Shifr', CheckShifr));
  TestList.Add(TTestElement.Create('Znak', CheckZnak));
  TestList.Add(TTestElement.Create('Cp', CheckCP));
  ImpList.Text := 'KI'#13#10'Shifr'#13#10'Cp';
  IgnList.Text := '';
  if DBGrid1.Columns.Items[6].Visible = False then
    IgnList.Text := 'Kol'#13#10'Kol_m';
  if DBGrid1.Columns.Items[8].Visible = False then
  begin
    if IgnList.Text <> '' then
      IgnList.Text := IgnList.Text + #13#10;
    IgnList.Text := IgnList.Text + 'Kol2'#13#10'Kol_m2';
  end;
  if DBGrid1.Columns.Items[10].Visible = False then
  begin
    if IgnList.Text <> '' then
      IgnList.Text := IgnList.Text + #13#10;
    IgnList.Text := IgnList.Text + 'Kol3'#13#10'Kol_m3';
  end;
  PasteMSO.FillCheckList(Table42, ImpList, IgnList);
  PasteMSO.Indication := IntToStr(NewString.Kod);
  FreeAndNil(IgnList);
  FreeAndNil(ImpList);
  PasteFromMSO.TestMethods := TestList;
  StringGridClear(PasteMSO.strngrd1);
  PasteMSO.ChecklistIniFileName := LocalStorage + 'np01vn_chklst1.ini';
  if PasteMSO.ShowModal = mrOk then
    PasteMSO.PasteToGrid(Table42, DBGrid1);
  FreeAndNil(TestList);
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

procedure Tfrm42.N11Click(Sender: TObject);
begin
  FormIndex.FieldFill(DBGrid1);
end;

procedure Tfrm42.btnSaveClick(Sender: TObject);
begin
  TableSave;
end;

procedure Tfrm42.tmr1Timer(Sender: TObject);
begin
  if not (Table42.State in dsEditModes) then
    TableSave;
end;

procedure Tfrm42.TableSave;
begin
  Table42.FlushBuffers;
  frm42.Caption := FormCapt + '     Сохранено в ' + TimeToStr(Time);
end;

procedure Tfrm42.NormaHack;
const
  csNorma = 'Norma';
var
  r1: ChangeRec;
  table1: TTable;
begin
  if index.FormIndex.GetFieldsSize(Table42, csNorma) < 13 then
  begin
    Table42.Close;
    table1 := TTable.Create(Self);
    table1.DatabaseName := Table42.DatabaseName;
    table1.TableName := Table42.TableName;
    Table1.Exclusive := True;
    table1.Open;
    Fillchar(r1, sizeof(r1), 0);
    StrPCopy(r1.szName, csNorma);
    r1.iType := 1;
    r1.iLength := 13;
    index.FormIndex.ChangeField(Table1, Table1.FieldByName(csNorma), r1);
    Table1.Close;
    FreeAndNil(table1);
    Table42.Open;
  end;
end;

procedure Tfrm42.btnSort0Click(Sender: TObject);
begin
  if btnSort0.Down then
    SetIndex(0);
end;

procedure Tfrm42.btnSort2Click(Sender: TObject);
begin
  if btnSort2.Down then
    SetIndex(2);
end;

procedure Tfrm42.btnSort1Click(Sender: TObject);
begin
  if btnSort1.Down then
    SetIndex(1);
end;

procedure Tfrm42.btn6Click(Sender: TObject);
const
  cs1 = '\\nevz\nevz\ASUP_Data1\LWS\prg_dlph\NP01VN01.exe';
  cs2 = 'Модуль NP01VN01 недоступен!';
  cs3 = 'C:\lws';

var
  s1, s2: string;
begin
  if isTest then
    s1 := cs2 + cs1
  else
    s1 := cs2;
  if FileExists(cs1) then
  begin
    s2 := '/ext';
    if Table42.RecordCount > 0 then
    begin
      if Table42.FieldByName(csField_Ki).Value <> null then
        s2 := s2 + ' /ki=' + Table42.FieldByName(csField_Ki).AsString;
      if Table42.FieldByName(csField_Shifr).Value <> null then
        s2 := s2 + ' /shifr=' + Table42.FieldByName(csField_Shifr).AsString;
      if Table42.FieldByName(csField_Cp).Value <> null then
        s2 := s2 + ' /cp=' + Table42.FieldByName(csField_Cp).AsString;
    end;
    ShellExecute(Handle, nil, PAnsiChar(cs1), PAnsiChar(s2), cs3,
      SW_RESTORE);
  end
  else
    ShowMessage(s1);
end;

procedure Tfrm42.BitBtn1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure Tfrm42.btn7Click(Sender: TObject);
begin
  sPrevPrim := '';
end;

initialization

end.

