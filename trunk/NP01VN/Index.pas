unit Index;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, Grids, DBGrids, DB, DBTables, Mask,
  ComObj, DBCtrls, ExcelXP, Constants, ComCtrls, Office2000, ActiveX,
  VKDBFDataSet, ExtCtrls, BDE, nExcel;

type
  ChangeRec = packed record
    szName: DBINAME;
    iType: Word;
    iSubType: Word;
    iLength: Word;
    iPrecision: Byte;
  end;

  TFormIndex = class(TForm)
    BitBtnDelete: TBitBtn;
    BitBtnUp: TBitBtn;
    BitBtnDown: TBitBtn;
    BitBtn1: TBitBtn;
    DBGridIndex: TDBGrid;
    TableIndex: TTable;
    DataSourceIndex: TDataSource;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    ButtonExcel: TButton;
    TableIndexNum: TIntegerField;
    TableIndexDigit: TIntegerField;
    TableIndexKod: TIntegerField;
    TableIndexFileName: TIntegerField;
    TableIndexTitle: TStringField;
    TableIndexMarsh: TStringField;
    TableIndexPrim: TStringField;
    TableIndextype: TStringField;
    Codes: TButton;
    ButtonCopy: TButton;
    bDocName: TButton;
    lDocName: TLabel;
    btn1: TBitBtn;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    ButtonNet: TButton;
    strngfldTableIndexData: TStringField;
    N4: TMenuItem;
    NYear1: TMenuItem;
    Nm01: TMenuItem;
    Nm02: TMenuItem;
    Nm03: TMenuItem;
    Nm04: TMenuItem;
    Nm05: TMenuItem;
    Nm06: TMenuItem;
    Nm07: TMenuItem;
    Nm08: TMenuItem;
    Nm09: TMenuItem;
    Nm010: TMenuItem;
    Nm011: TMenuItem;
    Nm012: TMenuItem;
    NQuart: TMenuItem;
    NOst01: TMenuItem;
    NOst02: TMenuItem;
    NOst03: TMenuItem;
    NOst04: TMenuItem;
    NOst05: TMenuItem;
    NOst06: TMenuItem;
    NOst07: TMenuItem;
    NOst08: TMenuItem;
    NOst09: TMenuItem;
    NOst010: TMenuItem;
    NOst011: TMenuItem;
    NOst012: TMenuItem;
    lbl1: TLabel;
    BitBtnCreate: TBitBtn;
    pm1: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    stat1: TStatusBar;
    N11: TMenuItem;
    btn2: TBitBtn;
    btn3: TBitBtn;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    mm1: TMainMenu;
    pmKods: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    vkdbNS03: TVKDBFNTX;
    vkdbNs02nch: TVKDBFNTX;
    btnOPiUTMC: TBitBtn;
    pmOPiUTMC: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    btnNativeExcel: TButton;
    procedure FormShow(Sender: TObject);
    procedure BitBtnDeleteClick(Sender: TObject);
    procedure TableIndexCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridIndexEnter(Sender: TObject);
    procedure BitBtnDownClick(Sender: TObject);
    procedure BitbtnCreateClick(Sender: TObject);
    procedure BitBtnUpClick(Sender: TObject);
    procedure DBGridIndexDblClick(Sender: TObject);
    procedure ButtonExcelClick(Sender: TObject);
    procedure ButtonCopyClick(Sender: TObject);
    procedure bDocNameClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure Nm01Click(Sender: TObject);
    procedure Nm02Click(Sender: TObject);
    procedure Nm03Click(Sender: TObject);
    procedure Nm04Click(Sender: TObject);
    procedure Nm05Click(Sender: TObject);
    procedure Nm06Click(Sender: TObject);
    procedure Nm07Click(Sender: TObject);
    procedure Nm08Click(Sender: TObject);
    procedure Nm09Click(Sender: TObject);
    procedure Nm010Click(Sender: TObject);
    procedure Nm011Click(Sender: TObject);
    procedure Nm012Click(Sender: TObject);
    procedure Nk01Click(Sender: TObject);
    procedure Nk02Click(Sender: TObject);
    procedure Nk03Click(Sender: TObject);
    procedure Nk04Click(Sender: TObject);
    procedure NOst01Click(Sender: TObject);
    procedure NOst02Click(Sender: TObject);
    procedure NOst03Click(Sender: TObject);
    procedure NOst04Click(Sender: TObject);
    procedure NOst05Click(Sender: TObject);
    procedure NOst06Click(Sender: TObject);
    procedure NOst07Click(Sender: TObject);
    procedure NOst08Click(Sender: TObject);
    procedure NOst09Click(Sender: TObject);
    procedure NOst011Click(Sender: TObject);
    procedure NOst010Click(Sender: TObject);
    procedure NOst012Click(Sender: TObject);
    procedure NQuartClick(Sender: TObject);
    procedure ButtonNetClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    // procedure btnCreateClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure DataSourceIndexDataChange(Sender: TObject; Field: TField);
    procedure N11Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure CodesClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure btnOPiUTMCClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure btnNativeExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    function CreateIndexTable(): Integer;
    procedure EnableButtons(State: Boolean);
    function UpdateTable(): Boolean;
    procedure NewString();
    function CreateNewTable(NewTable: TTable): Boolean;
  public
    { Public declarations }
    procedure ButtonsOff(State: Boolean);
    function LockJournal(const p: Boolean): Boolean;
    procedure GetFromKod2Str(const Kod_02: string; var k2Quartal: Integer;
      var k2Month: Integer; var k2Type: Integer);
    procedure GetFromKod2(const Kod_02: integer; var k2Quartal: Integer;
      var k2Month: Integer; var k2Type: Integer);
    function Padl(expression: string; nLength: Integer; cFillChar: Char = ' '):
      string;
    function sDocNameToDate: TDate;
    procedure CodesChert;
    procedure CodesMaterial;
    procedure ShowPopupOnClick(Sender: TObject; PopupMnu: TPopupMenu);
    function GetShifrTitle(const s: string): string;
    function GetChertTitle(const s: string): string;
    procedure FieldFill(Grid: TDBGrid);
    procedure MenuCheck(const aKod, aKod2: Integer);
    procedure ChangeField(Table: TTable; Field: TField; Rec: ChangeRec);
    function GetFieldsSize(T: TTable; const aFieldName: string): Integer;
  end;

  TRecord = class(TObject)
    Digit, Kod: Integer;
    Title: string;
    Sort: Integer;
    Marsh, Prim, Data: string;
  public
    constructor Create(_Digit, _Kod: Integer; _Title: string;
      _Sort: Integer = 0;
      _Marsh: string = 'Маршрут'; _Prim: string = 'Примечание'; _Data: string =
      '');
  end;
  PTRecord = ^TRecord;

var
  FormIndex: TFormIndex;
  NumRows, MaxDigit: Integer;
  RowList: TList;
  CurRec: TRecord;
  NetDir, NetDir42: string;
  CurYear: word = 2011;
  SendOASUPDate: TDateTime; //дата отправки в ОАСУП
  JournalLock: Boolean = False;
  KodCaption: array[1..8] of string[40] = (
    'Корректировка плана',
    'Строка',
    'Корректировка лимита ТМЦ на месяц',
    'Корректировка лимита ТМЦ на квартал',
    'Корректировка остатк лимита ТМЦ на месяц',
    'Корректировка плана и лимита',
    'Корректировка лимита',
    'Корректировка остатка лимита');
  ShowOld: boolean;

procedure ErrorMessage();

implementation

uses NewString, Main, Start, StrUtils, DocName, KoaUtils, Ost, DateUtils,
  Journal, USendOASUP, SAVLib_DB, SAVLib_DBF, Math, ShellAPI, Arhiv;
var
  ExpImpExt: array[1..10] of string[3] = (
    'db',
    'px',
    'val',
    'xg0',
    'yg0',
    'xg1',
    'yg1',
    'xg2',
    'yg2',
    'mb');
{$R *.dfm}

function TFormIndex.GetFieldsSize(T: TTable; const aFieldName: string): Integer;

var
  curProp: CURProps;
  pfldDes, pCurFld: pFLDDesc;
  // pfldDes is a pointer to a list of field descriptors.
  // It must be allocated with (iFields * sizeof(FLDDesc))
  // where iFields is a field in the structure curProps
  // from DbiGetCursorProps
  // pCurFld is a pointer the description of one field in the list.
  i: Integer; // counter
  MemSize: Integer;
begin
  Check(DbiGetCursorProps(T.Handle, curProp));
  // Get enough memory for one field desc times the # of fields
  MemSize := curProp.iFields * SizeOf(FLDDesc);
  pfldDes := AllocMem(MemSize);
  try
    pCurFld := pfldDes;
    Check(DbiGetFieldDescs(T.Handle, pfldDes));
    I := 0;
    Result := 0;
    while (i < curProp.iFields) and (Result = 0) do
    begin
      if pCurFld^.szName = WideString(aFieldName) then
        Result := pCurFld^.iLen;
      // increment pointer to the next record
      inc(pCurFld);
      inc(i);
    end;
  finally
    FreeMem(pfldDes, MemSize);
  end;
end;

procedure TFormIndex.ChangeField(Table: TTable; Field: TField; Rec: ChangeRec);
var
  Props: CURProps;
  hDb: hDBIDb;
  TableDesc: CRTblDesc;
  pFields: pFLDDesc;
  pOp: pCROpType;
  B: Byte;
begin
  // Initialize the pointers...
  pFields := nil;
  pOp := nil;
  // Make sure the table is open exclusively so we can get the db handle...
  if not Table.Active then
    raise EDatabaseError.Create('Table must be opened to restructure');
  if not Table.Exclusive then
    raise EDatabaseError.Create('Table must be opened exclusively' +
      'to restructure');
  Check(DbiSetProp(hDBIObj(Table.Handle), curxltMODE, Integer(xltNONE)));
  // Get the table properties to determine table type...
  Check(DbiGetCursorProps(Table.Handle, Props));
  // Make sure the table is either Paradox or dBASE...
  if (Props.szTableType <> szPARADOX) and (Props.szTableType <> szDBASE) then
    raise EDatabaseError.Create('Field altering can only occur on Paradox' +
      ' or dBASE tables');
  // Allocate memory for the field descriptor...
  pFields := AllocMem(Table.FieldCount * sizeof(FLDDesc));
  // Allocate memory for the operation descriptor...
  pOp := AllocMem(Table.FieldCount * sizeof(CROpType));
  try
    // Set the pointer to the index in the operation descriptor to put
    // crMODIFY (This means a modification to the record is going to happen)...
    Inc(pOp, Field.Index);
    pOp^ := crMODIFY;
    Dec(pOp, Field.Index);
    // Fill the field descriptor with the existing field information...

    Check(DbiGetFieldDescs(Table.Handle, pFields));
    // Set the pointer to the index in the field descriptor to make the
    // midifications to the field
    Inc(pFields, Field.Index);
    // If the szName portion of the ChangeRec has something in it, change it...
    if (Length(Rec.szName) > 0) then
      pFields^.szName := Rec.szName;
    // If the iType portion of the ChangeRec has something in it, change it...
    if (Rec.iType > 0) then
      pFields^.iFldType := Rec.iType;
    // If the iSubType portion of the ChangeRec has something in it, change it...
    if (Rec.iSubType > 0) then
      pFields^.iSubType := Rec.iSubType;
    // If the iLength portion of the ChangeRec has something in it, change it...
    if (Rec.iLength > 0) then
      pFields^.iUnits1 := Rec.iLength;
    // If the iPrecision portion of the ChangeRec has something
    // in it, change it...
    if (Rec.iPrecision > 0) then
      pFields^.iUnits2 := Rec.iPrecision;
    Dec(pFields, Field.Index);
    for B := 1 to Table.FieldCount do
    begin
      pFields^.iFldNum := B;
      Inc(pFields, 1);
    end;
    Dec(pFields, Table.FieldCount);
    // Blank out the structure...
    FillChar(TableDesc, sizeof(TableDesc), #0);
    //  Get the database handle from the table's cursor handle...
    Check(DbiGetObjFromObj(hDBIObj(Table.Handle), objDATABASE, hDBIObj(hDb)));
    // Put the table name in the table descriptor...
    StrPCopy(TableDesc.szTblName, Table.TableName);
    // Put the table type in the table descriptor...
    StrPCopy(TableDesc.szTblType, Props.szTableType);
    // The following three lines are necessary when doing any field restructure
    // operations on a table...
    // Set the field count for the table
    TableDesc.iFldCount := Table.FieldCount;
    // Link the operation descriptor to the table descriptor...
    TableDesc.pecrFldOp := pOp;
    // Link the field descriptor to the table descriptor...
    TableDesc.pFldDesc := pFields;
    // Close the table so the restructure can complete...
    Table.Close;
    // Call DbiDoRestructure...
    Check(DbiDoRestructure(hDb, 1, @TableDesc, nil, nil, nil, False));
  finally
    if (pFields <> nil) then
      FreeMem(pFields);
    if (pOp <> nil) then
      FreeMem(pOp);
  end;
end;

function TFormIndex.Padl(expression: string; nLength: Integer; cFillChar: Char =
  ' '): string;
var
  n, i: Integer;
  s: string;
begin
  s := Trim(expression);
  n := Length(s);
  if nLength > n then
  begin
    Result := '';
    for i := 1 to nLength - n do
      Result := Result + cFillChar;
    Result := Result + s;
  end
  else
    Result := Copy(s, 1, nLength);
end;

function TFormIndex.GetShifrTitle(const s: string): string;
begin
  Result := '';
  if (s <> '') and (Length(s) = 8) and (vkdbNS03.Active) and (Poisk(vkdbNS03,
    'shm', s)) then
    Result := vkdbNS03.fieldbyname('namm').AsString
end;

function TFormIndex.GetChertTitle(const s: string): string;
begin
  Result := '';
  if (s <> '') and (Length(s) = 13) and (vkdbns02nch.Active) and
    (Poisk(vkdbNS02nch, 'chert', s)) then
    Result := vkdbNS02nch.fieldbyname('naim').AsString
end;

function GetTempDir: string;
var
  Buf: array[0..1023] of Char;
begin
  SetString(Result, Buf, GetTempPath(Sizeof(Buf) - 1, Buf));
end;

procedure RemoveAll(path: string);
var
  sr: TSearchRec;
begin
  if FindFirst(path + '\*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if sr.Attr and faDirectory = 0 then
      begin
        DeleteFile(path + '\' + sr.name);
      end
      else
      begin
        if pos('.', sr.name) <= 0 then
          RemoveAll(path + '\' + sr.name);
      end;
    until
      FindNext(sr) <> 0;
  end;
  FindClose(sr);
  RemoveDirectory(PChar(path));
end;

procedure TFormIndex.ButtonsOff(State: Boolean);
begin
  Btn1.Enabled := State;
  BitBtnCreate.Enabled := State;
  BitBtnDelete.Enabled := State;
  BitBtnUp.Enabled := State;
  BitBtnDown.Enabled := State;
  bDocName.Enabled := State;
  lDocName.Enabled := State;
  btn3.Enabled := State;
  btnOPiUTMC.Enabled := State;
end;

function TFormIndex.sDocNameToDate: TDate;
begin
  Result := StrToDate(Copy(sDocName, 15, 8));
end;

procedure TFormIndex.NewString();

var
  NewInd: Integer;
begin
  if (FormNewString.ShowModal() = mrOK) and
    (NewStr <> csSymb_Null) then
  begin
    if (RowList.Count > 0) then
    begin
      NewInd := DBGridIndex.Fields[0].AsInteger;
      if (NewInd < 0) then
        NewInd := 0;
    end
    else
      NewInd := 0;
    {   // новая запись должна иметь номер CurInd + 1 }
    Inc(MaxDigit);
    RowList.Insert(NewInd, TRecord.Create(MaxDigit, Kod, NewStr, 0, csRoute,
      csNote, Inttostr(Kod2)));
    Inc(NumRows);
    UpdateTable();
  end;
end;

function TFormIndex.CreateNewTable(NewTable: TTable): Boolean;
begin
  with NewTable do
    try
      with FieldDefs do
      begin
        Clear;
        with AddFieldDef do
        begin
          Name := csField_Num;
          DataType := ftInteger;
          Required := True;
        end;
        with AddFieldDef do
        begin
          Name := csField_Digit;
          DataType := ftInteger;
        end;
        with AddFieldDef do
        begin
          Name := csField_Kod;
          DataType := ftInteger;
        end;
        with AddFieldDef do
        begin
          Name := csField_FileName;
          DataType := ftInteger;
        end;
        with AddFieldDef do
        begin
          Name := csField_Title;
          DataType := ftString;
          Size := 2000;
        end;
        with AddFieldDef do
        begin
          Name := csField_Marsh;
          DataType := ftString;
          Size := 50;
        end;
        with AddFieldDef do
        begin
          Name := csField_Prim;
          DataType := ftString;
          Size := 50;
        end;
        with AddFieldDef do
        begin
          Name := csField_Data;
          DataType := ftString;
          Size := 10;
        end;
      end;
      { Next, describe any indexes }
      with IndexDefs do
      begin
        Clear;
        with AddIndexDef do
        begin
          Name := csSymb_Null;
          Fields := csField_Num;
          Options := [ixPrimary];
        end;
      end;
      CreateTable;
      Result := True;
    except
      Close;
      Result := False;
    end;
end;

procedure TFormIndex.FieldFill(Grid: TDBGrid);
var
  frm1: TForm;
  btn01, btn02: TButton;
  edt01: TEdit;
  radiog1: TRadioGroup;
  a: array of Integer;
  i, j: Integer;
begin
  if Grid.SelectedRows.Count > 0 then
  begin
    frm1 := TForm.Create(Self);
    frm1.Position := poDesktopCenter;
    frm1.BorderStyle := bsSizeable;
    frm1.Width := 200;
    frm1.Height := 400;
    frm1.Caption := 'Заполнение столбца';
    radiog1 := TRadioGroup.Create(frm1);
    btn01 := TButton.Create(frm1);
    btn02 := TButton.Create(frm1);
    edt01 := TEdit.Create(frm1);
    radiog1.Parent := frm1;
    radiog1.Anchors := [akLeft, akTop, akRight, akBottom];
    btn01.Parent := frm1;
    btn02.Parent := frm1;
    edt01.Parent := frm1;
    edt01.Left := 40;
    edt01.Top := 350;
    edt01.Text := '';
    edt01.Anchors := [akLeft, akRight, akBottom];
    btn01.Width := 80;
    btn01.Height := 22;
    btn01.Left := 5;
    btn01.Top := 375;
    btn01.Caption := 'Заполнить';
    btn01.ModalResult := mrOk;
    btn01.Anchors := [akLeft, akBottom];
    btn01.Visible := True;
    btn02.Top := btn01.Top;
    btn02.Left := 115;
    btn02.Width := btn01.Width;
    btn02.Caption := 'Отмена';
    btn02.Height := btn01.Height;
    btn02.Anchors := [akRight, akBottom];
    btn02.ModalResult := mrCancel;
    btn02.Cancel := True;
    radiog1.Left := 2;
    radiog1.Top := 2;
    radiog1.Width := 198;
    radiog1.Height := 340;
    SetLength(a, Grid.Columns.Count);
    j := 0;
    for i := 0 to Grid.Columns.Count - 1 do
      if (Grid.Columns[i].Visible) and (Grid.Columns[i].ReadOnly = False) then
      begin
        radiog1.Items.Add(Grid.Columns[i].Field.DisplayLabel);
        a[j] := i;
        Inc(j);
      end;
    radiog1.Columns := Ceil(j / 20);
    frm1.Width := radiog1.Columns * 180;
    if (frm1.ShowModal = mrok) and (radiog1.itemindex > -1) then
    begin
      i := 0;
      while i < Grid.SelectedRows.Count do
      begin
        with Grid.DataSource.DataSet do
        begin
          GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
          try
            Edit;
            FieldByName(Grid.Columns[a[radiog1.ItemIndex]].FieldName).AsString
              := edt01.Text;
            Post;
            Inc(i);
          except
            ShowMessage('Несоответствие типов!');
            i := Grid.SelectedRows.Count;
          end;
        end;
      end;
    end;
    FreeAndNil(frm1);
    SetLength(a, 0);
  end
  else
    ShowMessage('Выделите строки!');
end;

function TFormIndex.CreateIndexTable(): Integer;
var
  MaxNum, CurSort: Integer;
  s: TStringList;
  q: TQuery;
  t: TTable;
begin
  MaxNum := 0;
  with TableIndex do
  begin
    TableIndex.Close;
    TableType := ttParadox;
    TableName := IndexTableName;
    DatabaseName := StartDir + WorkName + csSymb_BackSlash;
    if not TableIndex.Exists then
    begin
      CreateNewTable(TableIndex)
    end
    else
    begin
      s := TStringList.Create;
      t := TTable.Create(nil);
      t.TableType := ttParadox;
      t.DatabaseName := TableIndex.DatabaseName;
      t.TableName := TableIndex.TableName;
      t.ReadOnly := True;
      t.Open;
      t.GetFieldNames(s);
      t.Close;
      FreeAndNil(t);
      if s.IndexOf('Data') = -1 then
      begin
        q := TQuery.Create(nil);
        q.DatabaseName := TableIndex.DatabaseName;
        q.SQL.Text := csSQL_Add_Field_Data;
        q.ExecSQL;
        FreeAndNil(q);
      end;
      FreeAndNil(s);
      Open;
      First;
      while not Eof do
      begin
        /////////////////////////////////////////////////////////////
        try
          CurSort := FieldByName('FileName').AsInteger;
        except
          CurSort := 0;
        end;
        if (CurSort > 1) then
          CurSort := 1;
        /////////////////////////////////////////////////////////////
        RowList.Add(TRecord.Create(FieldByName(csField_Digit).AsInteger,
          FieldByName(csField_Kod).AsInteger,
          FieldByName(csField_Title).AsString,
          CurSort, FieldByName(csField_Marsh).AsString,
          FieldByName(csField_Prim).AsString,
          FieldByName(csField_Data).AsString));
        if (MaxNum < FieldByName(csField_Digit).AsInteger) then
          MaxNum := FieldByName(csField_Digit).AsInteger;
        Next;
      end;
    end;
  end;
  Result := MaxNum;
end;

function TFormIndex.LockJournal(const p: Boolean): Boolean;
var
  F: System.Text;
  s: string;
begin
  Result := True;
  s := StartDir + WorkName + csSymb_BackSlash + csJournalLock;
  if p = True then
  begin
    if FileExists(s) = False then
    begin
      try
        AssignFile(F, s);
        Rewrite(F);
        Write(F, '0');
        CloseFile(F);
      except
        Result := False;
        Exit;
      end;
    end;
  end
  else
    Result := DeleteFile(s);
end;

procedure TFormIndex.FormShow(Sender: TObject);
var
  F: System.Text;
  NameFile: string;
  w: Word;
  i: byte;
begin
  RowList := TList.Create;
  MaxDigit := CreateIndexTable();
  NumRows := RowList.Count;
  DBGridIndex.SetFocus();
  Label1.Caption := WorkName;
  JournalLock := FileExists(StartDir + WorkName + csSymb_BackSlash +
    csJournalLock);
  lbl1.Visible := JournalLock;
  ButtonExcel.Visible := isTest;
  ButtonCopy.Enabled := not (JournalLock);
  ButtonsOff(ButtonCopy.Enabled);
  NameFile := StartDir + WorkName + csSymb_BackSlash + csNameDoc;
  if FileExists(NameFile) then
  begin
    AssignFile(F, NameFile);
    Reset(F);
    Readln(F, sDocName);
    CloseFile(F);
    try
      CurYear := YearOf(sDocNameToDate);
    except
    end;
  end
  else
  begin
    sDocName := '';
    CurYear := YearOf(Date);
  end;
  lDocName.Caption := sDocName;
  w := MonthOfTheYear(Date);
  for i := 1 to 12 do
  begin
    (FormIndex.FindComponent(csMenu_TMS + inttostr(i)) as TMenuItem).Caption :=
      SysUtils.LongMonthNames[i];
    (FormIndex.FindComponent(csMenu_TMSOst + inttostr(i)) as TMenuItem).Caption
      := SysUtils.LongMonthNames[i];
  end;
  for i := w - 1 downto 1 do
    (FormIndex.FindComponent(csMenu_TMS + inttostr(i)) as TMenuItem).Enabled :=
      False;
  if w = 12 then
  begin
    NOst01.Visible := true;
    NOst012.Visible := true;
  end
  else
  begin
    (FormIndex.FindComponent(csMenu_TMSOst + inttostr(w)) as TMenuItem).Visible
      := True;
    (FormIndex.FindComponent(csMenu_TMSOst + inttostr(w + 1)) as
      TMenuItem).Visible := True;
  end;
  if vkdbNS03.Active = False then
  begin
    vkdbNS03.DBFFileName := sNS03;
    try
      vkdbNS03.Open;
    except
      ShowMessage('Таблица наименований ТМЦ недоступна!');
    end;
  end;
  if vkdbNs02nch.Active = False then
  begin
    vkdbNs02nch.DBFFileName := sNS02NCH;
    try
      vkdbNs02nch.Open;
    except
      ShowMessage('Таблица наименований чертежей недоступна!');
    end;
  end;
  NQuart.Enabled := (w mod 3) = 0;
end;

procedure TFormIndex.BitBtnDeleteClick(Sender: TObject);
var
  CurInd: Integer;
  iRec: TRecord;
  Table1: TTable;
begin
  if (MessageDlg(csShowMsg_Del, mtConfirmation, mbOKCancel, -1) = mrOK) then
  begin
    CurInd := DBGridIndex.Fields[0].AsInteger - 1;
    if (CurInd >= 0) then
    begin
      iRec := RowList.Items[CurInd];
      if iRec.Kod <> 2 then
      begin
        Table1 := TTable.Create(self);
        Table1.TableType := ttParadox;
        Table1.TableName := csNP01F + IntToStr(iRec.Digit) + csDBExt;
        Table1.DatabaseName := StartDir + WorkName + csSymb_BackSlash;
        Table1.DeleteTable;
        FreeAndNil(Table1);
      end;
      RowList.Delete(CurInd);
    end;
    UpdateTable();
  end;
end;

procedure TFormIndex.EnableButtons(State: Boolean);
var
  CurInd: Integer;
begin
  if (RowList.Count > 0) and (lbl1.Visible = False) then
  begin
    CurInd := DBGridIndex.Fields[0].AsInteger;
    BitBtnDelete.Enabled := True;
    BitBtnUp.Enabled := CurInd > 1;
    BitBtnDown.Enabled := CurInd < NumRows;
  end
  else
    BitBtnDelete.Enabled := False;
end;

procedure TFormIndex.TableIndexCalcFields(DataSet: TDataSet);
begin
  case DataSet.FieldByName(csField_Kod).AsInteger of
    1: DataSet.FieldByName(csField_Type).AsString := csDocType_1;
    2: DataSet.FieldByName(csField_Type).AsString := csDocType_2;
    3: DataSet.FieldByName(csField_Type).AsString := csDocType_3;
    4: DataSet.FieldByName(csField_Type).AsString := csDocType_4;
    5: DataSet.FieldByName(csField_Type).AsString := csDocType_5;
    6: DataSet.FieldByName(csField_Type).AsString := csDocType_6;
    7: DataSet.FieldByName(csField_Type).AsString := csDocType_7;
    8: DataSet.FieldByName(csField_Type).AsString := csDocType_8;
  end;
end;

procedure TFormIndex.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to RowList.Count - 1 do
    TObject(RowList[i]).Free;
  FreeAndNil(RowList);
  TableIndex.Close;
end;

{ TRecord }

constructor TRecord.Create(_Digit, _Kod: Integer; _Title: string;
  _Sort: Integer = 0;
  _Marsh: string = csRoute; _Prim: string = csNote; _Data: string = '');
begin
  Digit := _Digit;
  Kod := _Kod;
  Title := _Title;
  Sort := _Sort;
  Marsh := _Marsh;
  Prim := _Prim;
  Data := _Data;
end;

{
Очищается таблица NP01F0.DB и заполнятется на основе данных из
списка RowList типа TList.
Используется в частносит при изменении порядка следования данных
}

function TFormIndex.UpdateTable: Boolean;
var
  I, CurDigit, CurNum: Integer;
  CurRow: TRecord;
begin
  try
    with TableIndex do
    begin
      CurDigit := FieldByName(csField_Digit).AsInteger;
      CurNum := FieldByName(csField_Num).AsInteger;
      if Active then
        TableIndex.Active := False;
      EmptyTable();
      Open;
      for I := 0 to RowList.Count - 1 do
      begin
        CurRow := RowList.Items[I];
        Append;
        FieldValues[csField_Digit] := CurRow.Digit;
        FieldByName(csField_Num).Value := I + 1;
        FieldByName(csField_Kod).Value := CurRow.Kod;
        FieldByName(csField_FileName).Value := CurRow.Sort;
        FieldByName(csField_Title).Value := CurRow.Title;
        FieldByName(csField_Marsh).Value := CurRow.Marsh;
        FieldByName(csField_Prim).Value := CurRow.Prim;
        FieldByName(csField_Data).Value := CurRow.Data;
      end;
      if State <> dsBrowse then
        Post;
      if not Locate(csField_Digit, CurDigit, []) then
        Locate(csField_Num, CurNum, []);
    end;
    EnableButtons(True);
    TableIndex.FlushBuffers;
    Result := True;
  except
    TableIndex.FlushBuffers;
    TableIndex.Close;
    Result := False;
  end;
end;

procedure TFormIndex.DBGridIndexEnter(Sender: TObject);
begin
  EnableButtons(True);
end;

procedure TFormIndex.BitBtnDownClick(Sender: TObject);
var
  CurIndex: Integer;
begin
  CurIndex := DBGridIndex.Fields[0].AsInteger;
  if CurIndex < NumRows then
  begin
    RowList.Exchange(CurIndex - 1, CurIndex);
    UpdateTable();
  end;
end;

procedure TFormIndex.BitBtnUpClick(Sender: TObject);
var
  CurIndex: Integer;
begin
  CurIndex := DBGridIndex.Fields[0].AsInteger;
  if CurIndex > 1 then
  begin
    RowList.Exchange(CurIndex - 1, CurIndex - 2);
    UpdateTable();
  end;
end;

{
Вывод заголовка
}

function Head(Sheet: Variant): Integer;
begin
  Sheet.Rows['1:3'].Font.Bold := True;
  Sheet.Rows['1:3'].Font.Size := 11;
  Sheet.Cells[2, 22] := sDocHead_1;
  Sheet.Cells[3, 22] := sDocHead_2;
  Sheet.Cells[2, 1] := csDocHead_3 + Copy(sDocName, 1, 10);
  Sheet.Cells[3, 1] := Copy(sDocName, 12, 255);
  Result := 6;
end;

{
Вывод подписей
}

function c(Sheet: Variant; aRow: Integer): Integer;
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
  end;
  if Range.Rows.Count > 1 then
  begin
    Border := Range.Borders[I]; // left
    Border.LineStyle := 1;
  end;
  if Weight < 0 then
    Range.Columns['C'].Borders[7].LineStyle := -4142;
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
  if Range.Rows.Count > 1 then
  begin
    Border := Range.Borders[I]; // left
    Border.LineStyle := 1;
  end;
  if Weight < 0 then
    Range.Columns[3].Borders[7].LineStyle := xlLineStyleNone;
end;

procedure TFormIndex.ButtonExcelClick(Sender: TObject);
var
  ExcelApp, WorkBook, Sheet, Range: OleVariant;
  aRow, aCol, I, j: Integer;
  TableRow: TTable;
  CurIndex: Integer;
  num_i: Integer;
  iRow: Integer;
  iRec: TRecord;
  TableBegin: integer;
  iQ, iM, iT, iKol: Integer;
  TMSKolAr: array[1..3] of Integer;
  mso2003, isTMC, isFirst: Boolean;
  mso2003s: string;
  TitleWidth: Real;
  ColumnCol: Integer;
  exc_start: TTime;
  sPrevPrim, sPrimTek: string; //хранит примечание из предыдущ записи
  sPrevTitle, sTitleTek: string;
begin
  exc_start := Sysutils.Time;
  isTMC := False; // если будет ТМЦ надо будет вставлять разрыв строк
  isFirst := True; // первая ли это таблица
  if sDocName = '' then
  begin
    bDocNameClick(nil);
  end;
  ButtonExcel.Enabled := False;
  TMSKolAr[1] := 14;
  TMSKolAr[2] := 8;
  TMSKolAr[3] := 4;
  TableRow := TTable.Create(self);
  OleCheck(CoInitialize(nil));
  ExcelApp := CreateOleObject(csDocExcel);
  mso2003s := Copy(ExcelApp.Version, 1, 2);
  if strtoint(mso2003s) > 11 then
    mso2003 := False
  else
    mso2003 := True;
  try
    ExcelApp.Visible := ShowExcel;
    Workbook := ExcelApp.WorkBooks.Add;
    Sheet := WorkBook.Sheets.Item[1];
    Sheet.Name := csDocSheetName_1;
    Sheet.Cells.Font.Name := csDocFont_1;
    Sheet.Cells.Font.Size := FontSize;
    // снять защиту
    Sheet.Cells.Locked := False;
    Sheet.PageSetup.LeftMargin := 72 / 25.4 * 8;
    Sheet.PageSetup.TopMargin := 72 / 25.4 * 10;
    Sheet.PageSetup.RightMargin := 72 / 25.4 * 4;
    Sheet.PageSetup.BottomMargin := 72 / 25.4 * 12;
    Sheet.PageSetup.FooterMargin := 72 / 25.4 * 5;
    Sheet.PageSetup.CenterFooter := csDocPageFooter;
    // "&""Arial Cyr,полужирный""&12&F - &D"
    ///////////////////////////////////////////////////
    Sheet.PageSetup.Orientation := PaperOrientation;
    Sheet.PageSetup.PaperSize := PaperSize;
    Sheet.PageSetup.Zoom := False;
    Sheet.PageSetup.FitToPagesWide := 1;
    Sheet.PageSetup.FitToPagesTall := False;
    ///////////////////////////////////////////////////
    if bPrintShifr then
      ColumnCol := 23
    else
      ColumnCol := 22;
    Sheet.Columns['A'].Font.Bold := True;
    Sheet.Columns['C'].Font.Bold := True;
    Sheet.Columns['A'].ColumnWidth := 5;
    Sheet.Columns['B'].ColumnWidth := 1.55;
    Sheet.Columns['C'].ColumnWidth := 6.14;
    Sheet.Columns['D'].ColumnWidth := 16;
    Sheet.Columns['E'].ColumnWidth := 6;
    Sheet.Columns['F'].ColumnWidth := 10;
    Sheet.Columns['G'].ColumnWidth := 10;
    Sheet.Columns['H'].ColumnWidth := 10;
    Sheet.Columns['I'].ColumnWidth := 1;
    Sheet.Columns['J:U'].ColumnWidth := 2.29;
    Sheet.Columns['V'].ColumnWidth := 30;
    if bPrintShifr then
      Sheet.Columns['W'].ColumnWidth := 30
    else
      Sheet.Columns['W'].ColumnWidth := 0;
    TitleWidth := 0;
    //подсчет суммы ширин столбцов
    for I := ord('A') to ord('W') do
      TitleWidth := TitleWidth + Sheet.Columns[chr(i)].ColumnWidth;
    Sheet.Columns['AA'].ColumnWidth := TitleWidth;
    Sheet.Columns['AA'].WrapText := True;
    Sheet.Columns['AA'].Hidden := True;
    aRow := Head(Sheet);
    Inc(aRow);
    for iRow := 0 to RowList.Count - 1 do
    begin
      iRec := RowList.Items[iRow];
      Sheet.Cells[aRow, 1].Font.Bold := True;
      Range := Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow, ColumnCol]];
      Range.Merge;
      Range.HorizontalAlignment := -4108;
      Range.VerticalAlignment := -4108;
      Range.WrapText := True;
      //      Sheet.Rows[aRow].RowHeight := 27;
      Sheet.Cells[aRow, 27] := DelCR(iRec.Title);
      Sheet.Cells[aRow, 1] := DelCR(iRec.Title);
      if PageBreakTMC = True then
      begin
        // разбивка страниц
        if isFirst = True then
          isFirst := False
        else
        begin
          if (iRec.Kod = 3) or (iRec.Kod = 4) or (iRec.Kod = 5) then
          begin
            if isTMC = False then
            begin
              Sheet.HPageBreaks.Add(Before := Sheet.Cells[aRow, 1]);
              isTMC := True
            end;
          end
          else
          begin
            if isTMC = True then
            begin
              Sheet.HPageBreaks.Add(Before := Sheet.Cells[aRow, 1]);
              isTMC := False
            end;
          end;
        end;
        // -- разбивка страниц
      end;
      sPrevPrim := '';
      sPrevTitle := '';
      case iRec.Kod of
        1: //таблица плана
          begin
            if FileExists(StartDir + WorkName + csSymb_BackSlash + csNP01F +
              IntToStr(iRec.Digit) + csDBExt) = True then
            begin
              Inc(aRow);
              GetFromKod2(StrToInt(iRec.Data), iQ, iM, iT);
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                1]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 2], Sheet.Cells[aRow + 1,
                3]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 4], Sheet.Cells[aRow + 1, 4]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 5], Sheet.Cells[aRow + 1, 5]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 6], Sheet.Cells[aRow, 8]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 9], Sheet.Cells[aRow + 1,
                21]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 22], Sheet.Cells[aRow + 1,
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
              Sheet.Cells[aRow, 4] := csDocColumn_3;
              Sheet.Cells[aRow, 5] := csDocColumn_4;
              Sheet.Cells[aRow, 6] := csDocColumn_5;
              {Sheet.Cells[aRow + 1, 6] := csDocColumn_6;
              Sheet.Cells[aRow + 1, 7] := csDocColumn_7;
              Sheet.Cells[aRow + 1, 8] := csDocColumn_8;}
              Sheet.Cells[aRow + 1, 6] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                1];
              Sheet.Cells[aRow + 1, 7] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                2];
              Sheet.Cells[aRow + 1, 8] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                3];
              Sheet.Cells[aRow, 9] := csRoute;
              Sheet.Cells[aRow, 22] := csDocColumn_9;
              if bPrintShifr then
                Sheet.Cells[aRow, 23] := csDocColumn_16;

              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]].Font.Bold
                := True;
              SetBorder(Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]],
                  0);

              {  if bPrintShifr then
                begin

                end;}
              TableRow.DatabaseName := StartDir + WorkName + csSymb_BackSlash;
              TableRow.TableName := csNP01F + IntToStr(iRec.Digit);

              try
                TableRow.Open;
              except
                aRow := aRow + 2;
                Continue;
              end;

              CurIndex := iRec.Sort;

              TableRow.IndexDefs.Update;
              if (CurIndex < TableRow.IndexDefs.Count) then
                TableRow.IndexName := TableRow.IndexDefs.Items[CurIndex].Name;

              aRow := aRow + 2;
              TableBegin := aRow;

              Range := Sheet.Range[Sheet.Cells[TableBegin, 1],
                Sheet.Cells[TableBegin + TableRow.RecordCount, ColumnCol]];
              // + TableRow.RecordCount - 1, 22]];

              SetBorder(Range, -1);
              Sheet.Range[Sheet.Cells[aRow, 10], Sheet.Cells[aRow +
                TableRow.RecordCount - 1, 21]].NumberFormat := '00';

              TableRow.First;
              I := 1;
              while not TableRow.Eof do
              begin
                Sheet.Cells[aRow, 1] := I;
                Sheet.Cells[aRow, 3].HorizontalAlignment := -4131;
                Sheet.Cells[aRow, 4].Font.Size := ChertFontSize;
                for aCol := 3 to 8 do
                  Sheet.Cells[aRow, aCol] := TableRow.Fields[aCol - 2].AsString;
                for aCol := 10 to 21 do
                  Sheet.Cells[aRow, aCol] := TableRow.Fields[aCol - 3].AsString;
                if bExchPrimech then
                begin
                  sPrimTek := TableRow.Fields[TableRow.FieldCount - 5].AsString;
                  if (sPrimTek <> '') and (sPrimTek = sPrevPrim) then
                    Sheet.Cells[aRow, 22] := sExchPrimech
                  else
                  begin
                    Sheet.Cells[aRow, 22] := sPrimTek;
                    sPrevPrim := sPrimTek;
                  end
                end
                else
                  Sheet.Cells[aRow, 22] := TableRow.Fields[TableRow.FieldCount -
                    5].AsString;
                if bPrintShifr then
                begin
                  if bExchTitle then
                  begin
                    sTitleTek :=
                      FormIndex.GetChertTitle(TableRow.FieldByName('Chert').AsString);
                    if (sTitleTek <> '') and (sTitleTek = sPrevTitle) then
                      Sheet.Cells[aRow, 23] := sExchTitle
                    else
                    begin
                      Sheet.Cells[aRow, 23] := sTitleTek;
                      sPrevTitle := sTitleTek;
                    end
                  end
                  else
                    Sheet.Cells[aRow, 23] :=
                      FormIndex.GetChertTitle(TableRow.FieldByName('Chert').AsString);
                end;

                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;

              TableRow.Close;

              // защита ячеек
              Sheet.Range[Sheet.Cells[TableBegin - 2, 1], Sheet.Cells[aRow - 1,
                21]].Locked := True;
            end;
          end;
        2: //строка
          begin
            Range.HorizontalAlignment := -4108;
          end;
        3, 5: //таблица корректировки лимита и остатка лимита ТМЦ месяц
          begin
            if FileExists(StartDir + WorkName + csSymb_BackSlash + csNP01F +
              IntToStr(iRec.Digit) + csDBExt) = True then
            begin
              Inc(aRow);
              //GetFromKod2(StrToInt(iRec.Data), iQ, iM, iT);
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
                20]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 21], Sheet.Cells[aRow + 1,
                22]].Merge;
              if bPrintShifr then
                Sheet.Range[Sheet.Cells[aRow, 23], Sheet.Cells[aRow + 1,
                  23]].Merge;

              (* Sheet.Range[Sheet.Cells[aRow, 8], Sheet.Cells[aRow + 1, 8]].Merge;
               //       Sheet.Range[Sheet.Cells[aRow, 8], Sheet.Cells[aRow + 1, 8]].wraptext;
               Sheet.Range[Sheet.Cells[aRow, 9], Sheet.Cells[aRow + 1,
                 22]].Merge;
               //            Sheet.Range[Sheet.Cells[aRow, 22], Sheet.Cells[aRow + 1, 22]].Merge;
                *)
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
              Sheet.Cells[aRow, 11] := csDocColumn_17;
              Sheet.Cells[aRow, 16] := csDocColumn_14;
              Sheet.Cells[aRow, 21] := csDocColumn_9;
              if bPrintShifr then
                Sheet.Cells[aRow, 23] := csDocColumn_16;
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]].Font.Bold := True;
              SetBorder(Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]], 0);
              Sheet.Rows[aRow].RowHeight := 27;
              TableRow.DatabaseName := StartDir + WorkName + csSymb_BackSlash;
              TableRow.TableName := csNP01F + IntToStr(iRec.Digit);
              CurIndex := iRec.Sort;
              TableRow.IndexDefs.Update;
              if CurIndex = 0 then
                TableRow.IndexName := ''
              else if (CurIndex < TableRow.IndexDefs.Count) then
                TableRow.IndexName := TableRow.IndexDefs.Items[CurIndex].Name;
              try
                TableRow.Open;
              except
                aRow := aRow + 2;
                Continue;
              end;
              aRow := aRow + 2;
              TableBegin := aRow;
              Range := Sheet.Range[Sheet.Cells[TableBegin, 1],
                Sheet.Cells[TableBegin
                + TableRow.RecordCount - 1, ColumnCol]];
              SetBorder(Range, -1);
              num_i := Ord(TableRow.Fields.FindField('Num') = nil);
              TableRow.First;
              I := 1;
              while not TableRow.Eof do
              begin
                Sheet.Cells[aRow, 1] := I;
                Sheet.Cells[aRow, 3].HorizontalAlignment := -4131;
                Sheet.Cells[aRow, 4].Font.Size := ChertFontSize;
                Sheet.Cells[aRow, 3] := TableRow.Fields[4 - num_i].AsString;
                Sheet.Cells[aRow, 4].NumberFormat := '@';
                Sheet.Cells[aRow, 4] := TableRow.Fields[3 - num_i].AsString;
                Sheet.Cells[aRow, 5] := TableRow.Fields[8 - num_i].AsString;
                Sheet.Cells[aRow, 5].HorizontalAlignment := -4108;
                Sheet.Range[Sheet.Cells[aRow, 6], Sheet.Cells[aRow, 7]].Merge;
                //месяц
                try
                  Sheet.Cells[aRow, 6] := TableRow.Fields[5 - num_i].AsFloat;
                except
                  Sheet.Cells[aRow, 6] := 0;
                end;
                Sheet.Cells[aRow, 6].NumberFormat := '0,000';
                Sheet.Cells[aRow, 6].HorizontalAlignment := -4152;
                Sheet.Range[Sheet.Cells[aRow, 8], Sheet.Cells[aRow, 10]].Merge;
                Sheet.Cells[aRow, 8] := TableRow.Fields[2 - num_i].AsString;
                Sheet.Cells[aRow, 8].HorizontalAlignment := -4108;
                Sheet.Range[Sheet.Cells[aRow, 11], Sheet.Cells[aRow, 15]].Merge;
                Sheet.Cells[aRow, 11].HorizontalAlignment := -4108;
                Sheet.Cells[aRow, 11] := TableRow.Fields[6 - num_i].AsString;
                Sheet.Range[Sheet.Cells[aRow, 16], Sheet.Cells[aRow, 20]].Merge;
                Sheet.Cells[aRow, 16].HorizontalAlignment := -4108;
                Sheet.Cells[aRow, 16] := TableRow.Fields[7 - num_i].AsString;
                Sheet.Range[Sheet.Cells[aRow, 21], Sheet.Cells[aRow, 22]].Merge;
                if bExchPrimech then
                begin
                  sPrimTek := TableRow.Fields[10 - num_i].AsString;
                  if (sPrimTek <> '') and (sPrimTek = sPrevPrim) then
                    Sheet.Cells[aRow, 21] := sExchPrimech
                  else
                  begin
                    Sheet.Cells[aRow, 21] := sPrimTek;
                    sPrevPrim := sPrimTek;
                  end;
                end
                else
                  Sheet.Cells[aRow, 21] := TableRow.Fields[10 - num_i].AsString;
                if bPrintShifr then
                begin
                  if bExchTitle then
                  begin
                    sTitleTek :=
                      FormIndex.GetShifrTitle(TableRow.FieldByName('Shifr').AsString);
                    if (sTitleTek <> '') and (sTitleTek = sPrevTitle) then
                      Sheet.Cells[aRow, 23] := sExchTitle
                    else
                    begin
                      Sheet.Cells[aRow, 23] := sTitleTek;
                      sPrevTitle := sTitleTek;
                    end
                  end
                  else
                    Sheet.Cells[aRow, 23] :=
                      FormIndex.GetShifrTitle(TableRow.FieldByName('Shifr').AsString);
                end;
                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;
              TableRow.Close;
              // защита ячеек
              Sheet.Range[Sheet.Cells[TableBegin - 2, 1], Sheet.Cells[aRow - 1,
                ColumnCol]].Locked := True;
            end;
          end;
        4: //таблица корректировки лимита ТМЦ квартал
          begin
            if FileExists(StartDir + WorkName + csSymb_BackSlash + csNP01F +
              IntToStr(iRec.Digit) + csDBExt) then
            begin
              Inc(aRow);
              GetFromKod2(StrToInt(iRec.Data), iQ, iM, iT);
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1, 1]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 2], Sheet.Cells[aRow + 1, 3]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 4], Sheet.Cells[aRow + 1, 4]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 4], Sheet.Cells[aRow + 1,
                4]].wraptext := True;
              Sheet.Range[Sheet.Cells[aRow, 5], Sheet.Cells[aRow + 1, 5]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 5], Sheet.Cells[aRow + 1,
                5]].wraptext := True;
              Sheet.Range[Sheet.Cells[aRow, 6], Sheet.Cells[aRow, 8]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 9], Sheet.Cells[aRow + 1,
                12]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 13], Sheet.Cells[aRow + 1,
                16]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 17], Sheet.Cells[aRow + 1,
                22]].Merge;
              if bPrintShifr then
                Sheet.Range[Sheet.Cells[aRow, 23], Sheet.Cells[aRow + 1,
                  23]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]].HorizontalAlignment := -4108;
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]].VerticalAlignment := -4108;
              Sheet.Cells[aRow, 1] := csDocColumn_1;
              Sheet.Cells[aRow, 2] := csDocColumn_2;
              Sheet.Cells[aRow, 4] := csDocColumn_11;
              Sheet.Cells[aRow, 5] := csDocColumn_12;
              Sheet.Cells[aRow, 6] := csDocColumn_15;
              Sheet.Cells[aRow, 9] := csDocColumn_13;
              Sheet.Cells[aRow, 13] := csDocColumn_14;
              Sheet.Cells[aRow, 17] := csDocColumn_9;
              if bPrintShifr then
                Sheet.Cells[aRow, 23] := csDocColumn_16;
              // название месяцев
              if iT = 2 then //буд квартал, все мес
                iKol := 3
              else if iT = 1 then //текущий квартал, анализируем месяца
                iKol := 4 - iM;
              i := iKol;
              while i > 0 do
              begin
                Sheet.Cells[aRow + 1, 9 - i] := SysUtils.LongMonthNames[(iQ - 1)
                  * 3 + 4 - i];
                Dec(i);
              end;
              // -----
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]].Font.Bold := True;
              SetBorder(Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]], 0);
              Sheet.Rows[aRow].RowHeight := 27;
              TableRow.DatabaseName := StartDir + WorkName + csSymb_BackSlash;
              TableRow.TableName := csNP01F + IntToStr(iRec.Digit);
              CurIndex := iRec.Sort;
              TableRow.IndexDefs.Update;
              if CurIndex = 0 then
                TableRow.IndexName := ''
              else if CurIndex < TableRow.IndexDefs.Count then
                TableRow.IndexName := TableRow.IndexDefs.Items[CurIndex].Name;
              try
                TableRow.Open;
              except
                aRow := aRow + 2;
                Continue;
              end;
              aRow := aRow + 2;
              TableBegin := aRow;
              Range := Sheet.Range[Sheet.Cells[TableBegin, 1],
                Sheet.Cells[TableBegin + TableRow.RecordCount - 1, ColumnCol]];
              SetBorder(Range, -1);
              TableRow.First;
              I := 1;
              while not TableRow.Eof do
              begin
                Sheet.Cells[aRow, 1] := I;
                Sheet.Cells[aRow, 3].HorizontalAlignment := -4131;
                Sheet.Cells[aRow, 4].Font.Size := ChertFontSize;
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
                  Sheet.Cells[aRow, 9 - j] :=
                    StringReplace(TableRow.Fields[TMSKolAr[j]].AsString, ',',
                    '.', [rfReplaceAll]);
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
                if bExchPrimech then
                begin
                  sPrimTek := TableRow.Fields[9].AsString;
                  if (sPrimTek <> '') and (sPrimTek = sPrevPrim) then
                    Sheet.Cells[aRow, 17] := sExchPrimech
                  else
                  begin
                    Sheet.Cells[aRow, 17] := sPrimTek;
                    sPrevPrim := sPrimTek;
                  end
                end
                else
                  Sheet.Cells[aRow, 17] := TableRow.Fields[9].AsString;
                if bPrintShifr then
                begin
                  if bExchTitle then
                  begin
                    sTitleTek :=
                      FormIndex.GetShifrTitle(TableRow.FieldByName('Shifr').AsString);
                    if (sTitleTek <> '') and (sTitleTek = sPrevTitle) then
                      Sheet.Cells[aRow, 23] := sExchTitle
                    else
                    begin
                      Sheet.Cells[aRow, 23] := sTitleTek;
                      sPrevTitle := sTitleTek;
                    end
                  end
                  else
                    Sheet.Cells[aRow, 23] :=
                      FormIndex.GetShifrTitle(TableRow.FieldByName('Shifr').AsString);
                end;
                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;
              TableRow.Close;
              // защита ячеек
              Sheet.Range[Sheet.Cells[TableBegin - 2, 1], Sheet.Cells[aRow - 1,
                22]].Locked := True;
            end;
          end;
        6, 7: //Корректировка плана и лимита, корректировка лимита
          begin
            if FileExists(StartDir + WorkName + csSymb_BackSlash + csNP01F +
              IntToStr(iRec.Digit) + csDBExt) = True then
            begin
              Inc(aRow);
              GetFromKod2(StrToInt(iRec.Data), iQ, iM, iT);
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1, 1]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 2], Sheet.Cells[aRow + 1, 3]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 4], Sheet.Cells[aRow + 1, 4]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 5], Sheet.Cells[aRow + 1, 5]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 6], Sheet.Cells[aRow, 8]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 9], Sheet.Cells[aRow + 1,
                21]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 22], Sheet.Cells[aRow + 1,
                22]].Merge;
              if bPrintShifr then
                Sheet.Range[Sheet.Cells[aRow, 23], Sheet.Cells[aRow + 1,
                  23]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]].HorizontalAlignment := -4108;
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]].VerticalAlignment := -4108;
              Sheet.Cells[aRow, 1] := csDocColumn_1;
              Sheet.Cells[aRow, 2] := csDocColumn_2;
              Sheet.Cells[aRow, 4] := csDocColumn_3;
              Sheet.Cells[aRow, 5] := csDocColumn_4;
              Sheet.Cells[aRow, 6] := csDocColumn_5;
              // название месяцев
              case iT of
                1: iKol := 4 - iM; //текущий квартал, анализируем месяца
                2: iKol := 3; //буд квартал, все мес
              end;
              Sheet.Cells[aRow + 1, 6] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                1];
              Sheet.Cells[aRow + 1, 7] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                2];
              Sheet.Cells[aRow + 1, 8] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                3];
              Sheet.Cells[aRow, 9] := iRec.Marsh;
              Sheet.Cells[aRow, 22] := iRec.Prim;
              if bPrintShifr then
                Sheet.Cells[aRow, 23] := csDocColumn_16;
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]].Font.Bold
                := True;
              SetBorder(Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]], 0);
              TableRow.DatabaseName := StartDir + WorkName + csSymb_BackSlash;
              TableRow.TableName := csNP01F + IntToStr(iRec.Digit);
              try
                TableRow.Open;
              except
                aRow := aRow + 2;
                Continue;
              end;
              CurIndex := iRec.Sort;
              TableRow.IndexDefs.Update;
              if (CurIndex < TableRow.IndexDefs.Count) then
                TableRow.IndexName := TableRow.IndexDefs.Items[CurIndex].Name;
              aRow := aRow + 2;
              TableBegin := aRow;
              Range := Sheet.Range[Sheet.Cells[TableBegin, 1],
                Sheet.Cells[TableBegin + TableRow.RecordCount - 1, ColumnCol]];
              SetBorder(Range, -1);
              Sheet.Range[Sheet.Cells[aRow, 10], Sheet.Cells[aRow +
                TableRow.RecordCount - 1, 21]].NumberFormat := '00';
              TableRow.First;
              I := 1;
              while not TableRow.Eof do
              begin
                Sheet.Cells[aRow, 1] := I;
                Sheet.Cells[aRow, 3].HorizontalAlignment := -4131;
                Sheet.Cells[aRow, 4].Font.Size := ChertFontSize;
                for aCol := 3 to 5 do
                  Sheet.Cells[aRow, aCol] := TableRow.Fields[aCol - 2].AsString;
                if iKol = 3 then
                  Sheet.Cells[aRow, 6] := TableRow.Fields[4].AsString;
                if iKol > 1 then
                  Sheet.Cells[aRow, 7] := TableRow.Fields[5].AsString;
                Sheet.Cells[aRow, 8] := TableRow.Fields[6].AsString;
                for aCol := 10 to 21 do
                  Sheet.Cells[aRow, aCol] := TableRow.Fields[aCol - 3].AsString;
                if bExchPrimech then
                begin
                  sPrimTek := TableRow.Fields[TableRow.FieldCount - 5].AsString;
                  if (sPrimTek <> '') and (sPrimTek = sPrevPrim) then
                    Sheet.Cells[aRow, 22] := sExchPrimech
                  else
                  begin
                    Sheet.Cells[aRow, 22] := sPrimTek;
                    sPrevPrim := sPrimTek;
                  end
                end
                else
                  Sheet.Cells[aRow, 22] := TableRow.Fields[TableRow.FieldCount -
                    5].AsString;
                if bPrintShifr then
                begin
                  if bExchTitle then
                  begin
                    sTitleTek :=
                      FormIndex.GetChertTitle(TableRow.FieldByName('Chert').AsString);
                    if (sTitleTek <> '') and (sTitleTek = sPrevTitle) then
                      Sheet.Cells[aRow, 23] := sExchTitle
                    else
                    begin
                      Sheet.Cells[aRow, 23] := sTitleTek;
                      sPrevTitle := sTitleTek;
                    end
                  end
                  else
                    Sheet.Cells[aRow, 23] :=
                      FormIndex.GetChertTitle(TableRow.FieldByName('Chert').AsString);
                end;
                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;
              TableRow.Close;
              // защита ячеек
              Sheet.Range[Sheet.Cells[TableBegin - 2, 1], Sheet.Cells[aRow - 1,
                21]].Locked := True;
            end;
          end;
        8: //Корректировка плана и лимита, корректировка лимита
          begin
            if FileExists(StartDir + WorkName + csSymb_BackSlash + csNP01F +
              IntToStr(iRec.Digit) + csDBExt) = True then
            begin
              Inc(aRow);
              GetFromKod2(StrToInt(iRec.Data), iQ, iM, iT);
              if iT = 2 then
              begin
                if iM < 3 then
                  inc(iM)
                else
                begin
                  iM := 1;
                  inc(iQ);
                end
              end;
              if iQ = 5 then
                iQ := 1;
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1, 1]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 2], Sheet.Cells[aRow + 1, 3]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 4], Sheet.Cells[aRow + 1, 4]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 5], Sheet.Cells[aRow + 1, 5]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 6], Sheet.Cells[aRow, 8]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 9], Sheet.Cells[aRow + 1,
                21]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 22], Sheet.Cells[aRow + 1,
                22]].Merge;
              if bPrintShifr then
                Sheet.Range[Sheet.Cells[aRow, 23], Sheet.Cells[aRow + 1,
                  23]].Merge;
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]].HorizontalAlignment := -4108;
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]].VerticalAlignment := -4108;
              Sheet.Cells[aRow, 1] := csDocColumn_1;
              Sheet.Cells[aRow, 2] := csDocColumn_2;
              Sheet.Cells[aRow, 4] := csDocColumn_3;
              Sheet.Cells[aRow, 5] := csDocColumn_4;
              Sheet.Cells[aRow, 6] := csDocColumn_5;
              Sheet.Cells[aRow + 1, 6] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                1];
              Sheet.Cells[aRow + 1, 7] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                2];
              Sheet.Cells[aRow + 1, 8] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                3];
              Sheet.Cells[aRow, 9] := iRec.Marsh;
              Sheet.Cells[aRow, 22] := iRec.Prim;
              if bPrintShifr then
                Sheet.Cells[aRow, 23] := csDocColumn_16;
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]].Font.Bold := True;
              SetBorder(Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                ColumnCol]], 0);
              TableRow.DatabaseName := StartDir + WorkName + csSymb_BackSlash;
              TableRow.TableName := csNP01F + IntToStr(iRec.Digit);
              try
                TableRow.Open;
              except
                aRow := aRow + 2;
                Continue;
              end;
              CurIndex := iRec.Sort;
              TableRow.IndexDefs.Update;
              if (CurIndex < TableRow.IndexDefs.Count) then
                TableRow.IndexName := TableRow.IndexDefs.Items[CurIndex].Name;
              aRow := aRow + 2;
              TableBegin := aRow;
              Range := Sheet.Range[Sheet.Cells[TableBegin, 1],
                Sheet.Cells[TableBegin + TableRow.RecordCount - 1, ColumnCol]];
              SetBorder(Range, -1);
              Sheet.Range[Sheet.Cells[aRow, 10], Sheet.Cells[aRow +
                TableRow.RecordCount - 1, 21]].NumberFormat := '00';
              TableRow.First;
              I := 1;
              while not TableRow.Eof do
              begin
                Sheet.Cells[aRow, 1] := I;
                Sheet.Cells[aRow, 3].HorizontalAlignment := -4131;
                Sheet.Cells[aRow, 4].Font.Size := ChertFontSize;
                for aCol := 3 to 5 do
                  Sheet.Cells[aRow, aCol] := TableRow.Fields[aCol - 2].AsString;
                Sheet.Cells[aRow, 5 + iM] := TableRow.Fields[3 + iM].AsString;
                for aCol := 10 to 21 do
                  Sheet.Cells[aRow, aCol] := TableRow.Fields[aCol - 3].AsString;
                if bExchPrimech then
                begin
                  sPrimTek := TableRow.Fields[TableRow.FieldCount - 5].AsString;
                  if (sPrimTek <> '') and (sPrimTek = sPrevPrim) then
                    Sheet.Cells[aRow, 22] := sExchPrimech
                  else
                  begin
                    Sheet.Cells[aRow, 22] := sPrimTek;
                    sPrevPrim := sPrimTek;
                  end
                end
                else
                  Sheet.Cells[aRow, 22] := TableRow.Fields[TableRow.FieldCount -
                    5].AsString;
                if bPrintShifr then
                begin
                  if bExchTitle then
                  begin
                    sTitleTek :=
                      FormIndex.GetChertTitle(TableRow.FieldByName('Chert').AsString);
                    if (sTitleTek <> '') and (sTitleTek = sPrevTitle) then
                      Sheet.Cells[aRow, 23] := sExchTitle
                    else
                    begin
                      Sheet.Cells[aRow, 23] := sTitleTek;
                      sPrevTitle := sTitleTek;
                    end
                  end
                  else
                    Sheet.Cells[aRow, 23] :=
                      FormIndex.GetChertTitle(TableRow.FieldByName('Chert').AsString);
                end;
                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;
              TableRow.Close;
              // защита ячеек
              Sheet.Range[Sheet.Cells[TableBegin - 2, 1], Sheet.Cells[aRow - 1,
                21]].Locked := True;
            end;
          end;
      end;
      aRow := aRow + 2;
    end; // for iRow := 0 to Rowlist.Count-1
    if bPrintShifr then
      Sheet.PageSetup.PrintArea := 'A1:W' + IntToStr(aRow + 1)
    else
      Sheet.PageSetup.PrintArea := 'A1:V' + IntToStr(aRow + 1);
    Sheet.Protect(Password := csDocPasw, AllowFormattingColumns := True,
      AllowFormattingRows := True, AllowInsertingRows := True);
    DeleteFile(OutputFile);
    exc_start := Sysutils.Time - exc_start;
    ShowMessage('Время вывода: ' + TimeToStr(exc_start));
    if mso2003 = False then
      Workbook.SaveAs(FileName := OutputFile, ReadOnlyRecommended := False,
        CreateBackup := False, FileFormat := 56)
    else
      Workbook.SaveAs(FileName := OutputFile, ReadOnlyRecommended := False,
        CreateBackup := False);
    ExcelApp.Visible := True;
  except
    on E: Exception do
    begin
      MessageBox(0, PChar(E.Message), nil, MB_ICONERROR);
    end;
  end;
  ExcelApp := UnAssigned;
  FreeAndNil(TableRow);
  ButtonExcel.Enabled := True;
end;

{
Для кодов 6,7,8 выбираем из Код2 либо квартал (по умолч), либо месяц
}

procedure TFormIndex.GetFromKod2Str(const Kod_02: string; var k2Quartal:
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

procedure TFormIndex.GetFromKod2(const Kod_02: integer; var k2Quartal: Integer;
  var k2Month: Integer; var k2Type: Integer);
begin
  GetFromKod2Str(IntToStr(Kod_02), k2Quartal, k2Month, k2Type);
end;

{
Двойной клик по таблице
}

procedure TFormIndex.DBGridIndexDblClick(Sender: TObject);
var
  CurInd: Integer;

begin
  if TableIndex.IsEmpty then
    Exit;
  //получаем номер записи по которой клик
  CurInd := DBGridIndex.Fields[0].AsInteger;
  WorkName_2 := WorkName;
  if lbl1.Visible then
  begin //есть в журнале, только просмотр
    if TableIndex.FieldByName(csField_Kod).AsInteger <> 2 then
    begin
      kod := TableIndex.FieldByName(csField_Kod).AsInteger;
      kod2 := StrToInt(TableIndex.FieldByName(csField_Data).AsString);
    end;
    case TableIndex.FieldByName(csField_Kod).AsInteger of
      1, 6, 7, 8: // таблица, показываем форму редактирования таблицы
        begin
          CurRec := RowList.Items[CurInd - 1];
          FormEdit := TFormEdit.Create(Application);
          FormEdit.Caption := Label1.Caption + ' : ' + FormEdit.Caption;
          FormEdit.ShowModal();
          FreeAndNil(FormEdit);
        end;
      3: // корректировка лимита, месяц
        begin
          CurRec := RowList.Items[CurInd - 1];
          frm42 := Tfrm42.Create(Application); //Tfrm42 описан в Ost.pas
          frm42.ShowModal;
          FreeAndNil(frm42);
        end;
      4: // корректировка лимита, квартал
        begin
          CurRec := RowList.Items[CurInd - 1];
          frm42 := Tfrm42.Create(Application); //Tfrm42 описан в Ost.pas
          frm42.ShowModal;
          FreeAndNil(frm42);
        end;
      5: // корректировка остатков, месяц
        begin
          CurRec := RowList.Items[CurInd - 1];
          frm42 := Tfrm42.Create(Application); //Tfrm42 описан в Ost.pas
          frm42.ShowModal;
          FreeAndNil(frm42);
        end;
    end;
  end
  else
  begin //нет в журнале, можно редактировать
    TableIndex.FlushBuffers;
    case TableIndex.FieldByName(csField_Kod).AsInteger of
      2: // строка
        begin
          Kod := 2;
          NewStr := TableIndex.FieldByName(csField_Title).AsString;
          if (FormNewString.ShowModal() = mrOK) and
            (NewStr <> '') then
          begin // если отредактировали и нажали сохранить то сохраняем
            TRecord(RowList.Items[CurInd - 1]).Title := NewStr;
            UpdateTable();
          end;
        end;
      1, 6, 7, 8: // таблица, показываем форму редактирования таблицы
        begin
          CurRec := RowList.Items[CurInd - 1];
          kod := TableIndex.FieldByName(csField_Kod).AsInteger;
          kod2 := StrToInt(TableIndex.FieldByName(csField_Data).AsString);
          FormEdit := TFormEdit.Create(Application);
          FormEdit.Caption := Label1.Caption + ' : ' + FormEdit.Caption;
          FormEdit.ShowModal();
          FreeAndNil(FormEdit);
          RowList.Items[CurInd - 1] := CurRec;
          UpdateTable;
        end;
      3: // корректировка лимита, месяц
        begin
          kod := 3;
          kod2 := StrToInt(TableIndex.FieldByName(csField_Data).AsString);
          CurRec := RowList.Items[CurInd - 1];
          frm42 := Tfrm42.Create(Application); //Tfrm42 описан в Ost.pas
          frm42.ShowModal;
          FreeAndNil(frm42);
          RowList.Items[CurInd - 1] := CurRec;
          UpdateTable;
        end;
      4: // корректировка лимита, квартал
        begin
          Kod := 4;
          kod2 := StrToInt(TableIndex.FieldByName(csField_Data).AsString);
          CurRec := RowList.Items[pred(CurInd)];
          frm42 := Tfrm42.Create(Application); //Tfrm42 описан в Ost.pas
          frm42.ShowModal;
          FreeAndNil(frm42);
          RowList.Items[Pred(CurInd)] := CurRec;
          UpdateTable;
        end;
      5: // корректировка остатков, месяц
        begin
          kod := 5;
          kod2 := StrToInt(TableIndex.FieldByName(csField_Data).AsString);
          CurRec := RowList.Items[CurInd - 1];
          frm42 := Tfrm42.Create(Application); //Tfrm42 описан в Ost.pas
          frm42.ShowModal;
          FreeAndNil(frm42);
          RowList.Items[CurInd - 1] := CurRec;
          UpdateTable;
        end;
    end;
  end;
end;

procedure TFormIndex.CodesChert;
var
  WorkBook: IXLSWorkbook;
  Sheet: IXLSWorksheet;
  Range: IXLSRange;
  aRow: Integer;
  CurIndex: Integer;
  iRow, n: Integer;
  iRec: TRecord;
  t1: TTable;
  TableName: string[100];
  CodesFile: string;
  CurKod: integer;
  CurPr: string;
  csPrimPrev: string;
begin
  Codes.Enabled := False;
  t1 := TTable.Create(self);
  try
    Workbook := TXLSWorkbook.Create;
    Sheet := WorkBook.Sheets.Add;
    Sheet.Name := csDocSheetName_2;
    Sheet.Cells.Font.Name := csDocFont_1;
    Sheet.Cells.Font.Size := 11;
    Sheet.PageSetup.LeftMargin := 0.5;
    Sheet.PageSetup.RightMargin := 0.5;
    Sheet.PageSetup.PaperSize := xlPaperA4;
    Sheet.PageSetup.Zoom := False;
    Sheet.PageSetup.FitToPagesWide := 1;
    Sheet.PageSetup.FitToPagesTall := False;
    Sheet.Cells.Columns[1].Font.Bold := True;
    Sheet.Cells.Columns[1].ColumnWidth := 8;
    Sheet.Cells.Columns[2].ColumnWidth := 30;
    Sheet.Cells.Columns[3].ColumnWidth := 30;
    aRow := 1;
    Inc(aRow);
    n := RowList.Count - 1;
    for iRow := 0 to n do
    begin
      iRec := RowList.Items[iRow];
      if (iRec.Kod = 1) or (iRec.Kod = 6) or (iRec.Kod = 7) or (iRec.Kod = 8)
        then
      begin
        Sheet.Cells.Item[aRow, 1].Font.Bold := True;
        Range := Sheet.RCRange[aRow, 1, aRow, 3];
        Range.Merge;
        Range.HorizontalAlignment := xlHAlignCenter;
        Range.VerticalAlignment := xlVAlignCenter;
        Range.WrapText := True;
        Sheet.Cells.Rows[aRow].RowHeight := 32;
        Sheet.Cells.Item[aRow, 1].Value := DelCR(iRec.Title);
        Inc(aRow); // шапка
        Sheet.RCRange[aRow, 1, aRow, 3].HorizontalAlignment := xlHAlignCenter;
        Sheet.RCRange[aRow, 1, aRow, 3].VerticalAlignment := xlVAlignTop;
        Sheet.RCRange[aRow, 1, aRow, 3].WrapText := True;
        Sheet.Cells.Item[aRow, 1].Value := csDocColumn_2;
        Sheet.Cells.Item[aRow, 2].Value := csDocColumn_9;
        Sheet.Cells.Item[aRow, 3].Value := csDocColumn_10;
        Sheet.RCRange[aRow, 1, aRow, 3].Font.Bold := True;
        SetBorderNative(Sheet.RCRange[aRow, 1, aRow, 3], 0);
        t1.DatabaseName := StartDir + WorkName + '\';
        TableName := csNP01F + IntToStr(iRec.Digit);
        CurIndex := iRec.Sort;
        t1.TableName := TableName;
        if t1.Exists then
        begin
          t1.Open;
          t1.IndexName := t1.IndexDefs.Items[CurIndex].Name;
          t1.First;
          aRow := aRow + 1; // данные таблицы
          CurKod := t1.fieldbyname(csField_Kod).AsInteger;
          CurPr := t1[csField_Primech];
          Sheet.Cells.Item[aRow, 1].Value := CurKod;
          Sheet.Cells.Item[aRow, 2].Value := CurPr;
          SetBorderNative(Sheet.RCRange[aRow, 1, aRow, 3], 0);
          Inc(aRow);
          t1.Next;
          csPrimPrev := CurPr;
          while not t1.Eof do
          begin
            if t1[csField_Primech] <> csPrimPrev then
            begin
              csPrimPrev := t1[csField_Primech];
              CurPr := t1[csField_Primech];
              CurKod := t1.fieldbyname(csField_Kod).AsInteger;
              Sheet.Cells.Item[aRow, 1].Value := CurKod;
              Sheet.Cells.Item[aRow, 2].Value := CurPr;
              SetBorderNative(Sheet.RCRange[aRow, 1, aRow, 3], 0);
              Sheet.RCRange[aRow, 1, aRow, 3].wraptext := True;
              Sheet.RCRange[aRow, 1, aRow, 3].VerticalAlignment := xlVAlignTop;
              Inc(aRow);
            end
            else if t1[csField_Kod] <> Null then
            begin
              if t1[csField_Kod] <> CurKod then
              begin
                CurKod := t1.fieldbyname(csField_Kod).AsInteger;
                Sheet.Cells.Item[aRow, 1].Value := CurKod;
                Sheet.Cells.Item[aRow, 2].Value := CurPr;
                SetBorderNative(Sheet.RCRange[aRow, 1, aRow, 3], 0);
                Inc(aRow);
              end;
            end;
            t1.Next;
          end;
          t1.Close;
        end;
        aRow := aRow + 2;
      end;
    end; // for iRow := 0 to Rowlist.Count-1
    CodesFile := ExtractFilePath(OutputFile) + WorkName + csDocFileName_2;
    DeleteFile(CodesFile);
    try
      Workbook.SaveAs(CodesFile);
      if ShowExcel then
        ShellExecute(Handle, 'open', PAnsiChar(CodesFile), nil, nil,
          SW_RESTORE);
    except
      ShowMessage('Невозможно сохранить файл Excel в автоматическом режиме. Сохраните файл вручную.');
    end;
  except
    ShowMessage(csErrorMsg_RunError + csField_Kod + csSymb_Equal +
      t1.FieldByName(csField_Kod).AsString + ' ' + csField_Primech + '=' +
      t1.FieldByName(csField_Primech).AsString + ' ' + csField_Num + '=' +
      t1.FieldByName(csField_Num).AsString);
  end;
  t1.Close;
  FreeAndNil(t1);
  iRec := nil;
  Codes.Enabled := True;
end;

procedure TFormIndex.CodesMaterial;
var
  WorkBook: IXLSWorkbook;
  Sheet: IXLSWorksheet;
  Range: IXLSRange;
  aRow: Integer;
  iRow, n: Integer;
  iRec: TRecord;
  t1: TTable;
  TableName: string[100];
  CodesFile: string;
  CurKod: integer;
  CurPr: string;
  csPrimPrev: string;
  IndexNames1: TStringList;
begin
  Codes.Enabled := False;
  t1 := TTable.Create(self);
  IndexNames1 := TStringList.Create;
  try
    Workbook := TXLSWorkbook.Create;
    Sheet := WorkBook.Sheets.Add;
    Sheet.Name := csDocSheetName_3;
    Sheet.Cells.Font.Name := csDocFont_1;
    Sheet.Cells.Font.Size := 11;
    Sheet.PageSetup.LeftMargin := 0.5;
    Sheet.PageSetup.RightMargin := 0.5;
    Sheet.PageSetup.PaperSize := xlPaperA4;
    Sheet.PageSetup.Zoom := False;
    Sheet.PageSetup.FitToPagesWide := 1;
    Sheet.PageSetup.FitToPagesTall := False;
    Sheet.Cells.Columns[1].Font.Bold := True;
    Sheet.Cells.Columns[1].ColumnWidth := 8;
    Sheet.Cells.Columns[2].ColumnWidth := 30;
    Sheet.Cells.Columns[3].ColumnWidth := 30;
    aRow := 1;
    Inc(aRow);
    n := RowList.Count - 1;
    for iRow := 0 to n do
    begin
      iRec := RowList.Items[iRow];
      if (iRec.Kod = 3) or (iRec.Kod = 4) or (iRec.Kod = 5) then
      begin
        Sheet.Cells.Item[aRow, 1].Font.Bold := True;
        Range := Sheet.RCRange[aRow, 1, aRow, 3];
        Range.Merge;
        Range.HorizontalAlignment := xlHAlignCenter;
        Range.VerticalAlignment := xlVAlignCenter;
        Range.WrapText := True;
        Sheet.Cells.Rows[aRow].RowHeight := 32;
        Sheet.Cells.Item[aRow, 1].Value := DelCR(iRec.Title);
        Inc(aRow); // шапка
        Sheet.RCRange[aRow, 1, aRow, 3].HorizontalAlignment := xlHAlignCenter;
        Sheet.RCRange[aRow, 1, aRow, 3].VerticalAlignment := xlVAlignTop;
        Sheet.RCRange[aRow, 1, aRow, 3].WrapText := True;
        Sheet.Cells.Item[aRow, 1].Value := csDocColumn_2;
        Sheet.Cells.Item[aRow, 2].Value := csDocColumn_9;
        Sheet.Cells.Item[aRow, 3].Value := csDocColumn_10;
        Sheet.RCRange[aRow, 1, aRow, 3].Font.Bold := True;
        SetBorderNative(Sheet.RCRange[aRow, 1, aRow, 3], 0);
        t1.DatabaseName := StartDir + WorkName + '\';
        TableName := csNP01F + IntToStr(iRec.Digit);
        t1.TableName := TableName;
        if t1.Exists then
        begin
          t1.Open;
          t1.GetIndexNames(IndexNames1);
          if IndexNames1.Count = 0 then
            t1.IndexName := ''
          else
            t1.IndexName := 'TMS_Ki';
          t1.First;
          aRow := aRow + 1; // данные таблицы
          CurKod := t1.FieldByName(csField_Ki).AsInteger;
          CurPr := t1.FieldByName(csField_Primech).AsString;
          Sheet.Cells.Item[aRow, 1].Value := CurKod;
          Sheet.Cells.Item[aRow, 2].Value := CurPr;
          SetBorderNative(Sheet.RCRange[aRow, 1, aRow, 3], 0);
          Inc(aRow);
          t1.Next;
          csPrimPrev := CurPr;
          while not t1.Eof do
          begin
            if t1.FieldByName(csField_Primech).AsString <> csPrimPrev then
            begin
              csPrimPrev := t1.FieldByName(csField_Primech).AsString;
              CurPr := t1.FieldByName(csField_Primech).AsString;
              CurKod := t1.FieldByName(csField_Ki).AsInteger;
              Sheet.Cells.Item[aRow, 1].Value := CurKod;
              Sheet.Cells.Item[aRow, 2].Value := CurPr;
              SetBorderNative(Sheet.RCRange[aRow, 1, aRow, 3], 0);
              Sheet.RCRange[aRow, 1, aRow, 3].wraptext := True;
              Sheet.RCRange[aRow, 1, aRow, 3].VerticalAlignment := xlVAlignTop;
              Inc(aRow);
            end
            else if t1.FieldByName(csField_Ki).Value <> Null then
            begin
              if t1.FieldByName(csField_Ki).AsInteger <> CurKod then
              begin
                CurKod := t1.FieldByName(csField_Ki).AsInteger;
                Sheet.Cells.Item[aRow, 1].Value := CurKod;
                Sheet.Cells.Item[aRow, 2].Value := CurPr;
                SetBorderNative(Sheet.RCRange[aRow, 1, aRow, 3], 0);
                Inc(aRow);
              end;
            end;
            t1.Next;
          end;
          t1.Close;
        end;
        aRow := aRow + 2;
      end;
    end; // for iRow := 0 to Rowlist.Count-1
    CodesFile := ExtractFilePath(OutputFile) + WorkName + csDocFileName_3;
    DeleteFile(CodesFile);
    try
      Workbook.SaveAs(CodesFile);
      if ShowExcel then
        ShellExecute(Handle, 'open', PAnsiChar(CodesFile), nil, nil,
          SW_RESTORE);
    except
      ShowMessage('Невозможно сохранить файл Excel в автоматическом режиме. Сохраните файл вручную.');
    end;
  except
    ShowMessage(csErrorMsg_RunError + 'KI' + csSymb_Equal +
      t1.FieldByName('KI').AsString + ' ' + csField_Primech + '=' +
      t1.FieldByName(csField_Primech).AsString + ' ' + csField_Shifr + '=' +
      t1.FieldByName(csField_Shifr).AsString);
  end;
  t1.Close;
  FreeAndNil(t1);
  FreeAndNil(IndexNames1);
  Codes.Enabled := True;
  iRec := nil;
end;

procedure ErrorMessage();
var
  MesBuf: PChar;
begin
  FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_ALLOCATE_BUFFER,
    nil, GetLastError(), 0, @MesBuf, 511, nil);
  ShowMessage(MesBuf);
  LocalFree(Cardinal(MesBuf));
end;

procedure TFormIndex.ButtonCopyClick(Sender: TObject);
var
  s: string;

  function CheckOPiUMCDate: Boolean;
  var
    i, n, j: Integer;
  begin
    Result := True;
    if UsrAcs.MonthCheck then
    begin
      i := 0;
      j := MonthOf(Now);
      n := RowList.Count;
      while (i < n) and Result do
      begin
        if ((TRecord(RowList.Items[i]).Kod = 3) or (TRecord(RowList.Items[i]).Kod
          = 5)) and (j <> StrToInt(TRecord(RowList.Items[i]).Data)) then
        begin
          Result := False;
          s := ' Имеется информация по прошедшим месяцам: ' +
            TRecord(RowList.Items[i]).Title
        end;
        Inc(i);
      end;
    end;
  end;

begin
  if sDocName = '' then
  begin
    bDocNameClick(nil);
    SysUtils.Abort;
  end;
  s := '';
  SendOASUPDate := 0;
  SendOASUP := TSendOASUP.Create(Application);
  SendOASUP.ShowModal();
  FreeAndNil(SendOASUP);
  if (SendOASUPDate > 0) and ArhivTMSCheck(ArhivTMSDir) and
    ArhivChertCheck(ArhivChertDir) and CheckOPiUMCDate then
  begin
    ButtonNet.Tag := 0;
    FmJournal := TFmJournal.Create(Application);
    FmJournal.ShowModal();
    FreeAndNil(FmJournal);
  end
  else
    ShowMessage('Передача данных невозможна!' + s);
end;

procedure TFormIndex.bDocNameClick(Sender: TObject);
var
  F: System.Text;
  sDate: string;
begin
  if sDocName > '' then
  begin
    frmDocName.meNDoc.Text := Copy(sDocName, 7, 4);
    frmDocName.dtpDateDoc.Date := sDocNameToDate;
  end
  else
  begin
    frmDocName.meNDoc.Text := '';
    frmDocName.dtpDateDoc.Date := Date;
  end;
  frmDocName.ShowModal;
  if frmDocName.ModalResult = mrOk then
  begin
    DateTimeToString(sDate, csDdmmyy, frmDocName.dtpDateDoc.Date);
    CurYear := YearOf(frmDocName.dtpDateDoc.Date);
    sDocName := '№ ' + UsrAcs.DivisionStr + '-' + Format('%.4u',
      [StrToInt(Trim(frmDocName.meNDoc.Text))]) +
    csDocName_2 + sDate;
    AssignFile(F, StartDir + WorkName + '\' + csNameDoc);
    Rewrite(F);
    Writeln(F, sDocName);
    CloseFile(F);
    lDocName.Caption := sDocName;
  end;
end;

procedure TFormIndex.ShowPopupOnClick(Sender: TObject; PopupMnu: TPopupMenu);
var
  P: TPoint;
  R: TRect;
  X, Y: Integer;
begin
  P := GetClientOrigin();
  R := TControl(Sender).BoundsRect;
  with R do
  begin
    X := Left + (Right - Left) div 2;
    Y := Top + (Bottom - Top) div 2;
  end;
  PopupMnu.Popup(P.X + X, P.Y + Y);
end;

procedure TFormIndex.btn1Click(Sender: TObject);
begin
  ShowPopupOnClick(Sender, PopupMenu2);
end;

procedure TFormIndex.MenuCheck(const aKod, aKod2: Integer);
begin
  Kod := aKod;
  Kod2 := aKod2;
  NewString;
end;

procedure TFormIndex.Nm01Click(Sender: TObject);
begin
  MenuCheck(3, 1);
end;

procedure TFormIndex.Nm02Click(Sender: TObject);
begin
  MenuCheck(3, 2);
end;

procedure TFormIndex.Nm03Click(Sender: TObject);
begin
  MenuCheck(3, 3);
end;

procedure TFormIndex.Nm04Click(Sender: TObject);
begin
  MenuCheck(3, 4);
end;

procedure TFormIndex.Nm05Click(Sender: TObject);
begin
  MenuCheck(3, 5);
end;

procedure TFormIndex.Nm06Click(Sender: TObject);
begin
  MenuCheck(3, 6);
end;

procedure TFormIndex.Nm07Click(Sender: TObject);
begin
  MenuCheck(3, 7);
end;

procedure TFormIndex.Nm08Click(Sender: TObject);
begin
  MenuCheck(3, 8);
end;

procedure TFormIndex.Nm09Click(Sender: TObject);
begin
  MenuCheck(3, 9);
end;

procedure TFormIndex.Nm010Click(Sender: TObject);
begin
  MenuCheck(3, 10);
end;

procedure TFormIndex.Nm011Click(Sender: TObject);
begin
  MenuCheck(3, 11);
end;

procedure TFormIndex.Nm012Click(Sender: TObject);
begin
  MenuCheck(3, 12);
end;

procedure TFormIndex.Nk01Click(Sender: TObject);
begin
  MenuCheck(4, 1);
end;

procedure TFormIndex.Nk02Click(Sender: TObject);
begin
  MenuCheck(4, 2);
end;

procedure TFormIndex.Nk03Click(Sender: TObject);
begin
  MenuCheck(4, 3);
end;

procedure TFormIndex.Nk04Click(Sender: TObject);
begin
  MenuCheck(4, 4);
end;

procedure TFormIndex.NOst01Click(Sender: TObject);
begin
  MenuCheck(5, 1);
end;

procedure TFormIndex.NOst02Click(Sender: TObject);
begin
  MenuCheck(5, 2);
end;

procedure TFormIndex.NOst03Click(Sender: TObject);
begin
  MenuCheck(5, 3);
end;

procedure TFormIndex.NOst04Click(Sender: TObject);
begin
  MenuCheck(5, 4);
end;

procedure TFormIndex.NOst05Click(Sender: TObject);
begin
  MenuCheck(5, 5);
end;

procedure TFormIndex.NOst06Click(Sender: TObject);
begin
  MenuCheck(5, 6);
end;

procedure TFormIndex.NOst07Click(Sender: TObject);
begin
  MenuCheck(5, 7);
end;

procedure TFormIndex.NOst08Click(Sender: TObject);
begin
  MenuCheck(5, 8);
end;

procedure TFormIndex.NOst09Click(Sender: TObject);
begin
  MenuCheck(5, 9);
end;

procedure TFormIndex.NOst011Click(Sender: TObject);
begin
  MenuCheck(5, 11);
end;

procedure TFormIndex.NOst010Click(Sender: TObject);
begin
  MenuCheck(5, 10);
end;

procedure TFormIndex.NOst012Click(Sender: TObject);
begin
  MenuCheck(5, 12);
end;

procedure TFormIndex.NQuartClick(Sender: TObject);
begin
  MenuCheck(4,
    StrToInt(IntToStr(Main.Form1.GetNextQuartal(Main.Form1.GetQuartal()))
    + inttostr(Main.Form1.GetMonthOfQuartal(MonthOf(Date))) + '2'));
end;

procedure TFormIndex.ButtonNetClick(Sender: TObject);
begin
  ButtonNet.Tag := 1;
  FmJournal := TFmJournal.Create(Application);
  FmJournal.ShowModal();
  FmJournal.Free;
end;

procedure TFormIndex.FormResize(Sender: TObject);
begin
  FormBorderRange(Self, 400, 520);
  if Self.Width > 641 then
    DBGridIndex.Columns.Items[2].Width := FormIndex.Width - 261
  else
    DBGridIndex.Columns.Items[2].Width := 380;
end;

procedure TFormIndex.BitbtnCreateClick(Sender: TObject);
begin
  ShowPopupOnClick(Sender, pm1);
end;

procedure TFormIndex.N5Click(Sender: TObject);
begin
  Kod := 2;
  NewString;
end;

procedure TFormIndex.N7Click(Sender: TObject);
begin
  MenuCheck(1, MonthOf(Date));
end;

procedure TFormIndex.N8Click(Sender: TObject);
begin
  MenuCheck(6, MonthOf(Date));
end;

procedure TFormIndex.N9Click(Sender: TObject);
begin
  MenuCheck(7, MonthOf(Date));
end;

procedure TFormIndex.N10Click(Sender: TObject);
begin
  MenuCheck(8, MonthOf(Date));
end;

procedure TFormIndex.DataSourceIndexDataChange(Sender: TObject;
  Field: TField);
var
  k2Q, k2M, k2T, lKod: Integer;
  sk2Q, sk2M, sk2T: string;
begin
  if (TableIndex.RecordCount > 0) and
    (TableIndex.FieldByName(csField_Data).AsString <> '') then
  begin
    if UsrAcs.Snyatie then
      N14.Enabled := False;
    sk2T := '';
    sk2M := '';
    sk2Q := '';
    lKod := TableIndex.FieldByName(csField_Kod).AsInteger;
    case lKod of
      1, 6, 7:
        begin
          stat1.SimpleText := KodCaption[lkod] + ' в ';
          GetFromKod2Str(TableIndex.FieldByName(csField_Data).AsString, k2Q,
            k2M, k2T);
          case k2Q of
            1: sk2Q := ' I ';
            2: sk2Q := ' II ';
            3: sk2Q := ' III ';
            4: sk2Q := ' IV ';
          end;
          sk2M := IntToStr(k2M);
          case k2T of
            0: sk2T := ' предыдущий ';
            1: sk2T := ' текущий ';
            2: sk2T := ' будущий ';
          end;
          stat1.SimpleText := stat1.SimpleText + sk2M + ' мес. квартала на' +
            sk2T + sk2Q + 'квартал';
        end;
      3:
        begin
          if UsrAcs.Snyatie then
            N14.Enabled := True;
          stat1.SimpleText := KodCaption[lkod];
        end;
      2, 4, 5: stat1.SimpleText := KodCaption[lkod];
      8:
        begin
          stat1.SimpleText := KodCaption[lkod] + ' в ';
          GetFromKod2Str(TableIndex.FieldByName(csField_Data).AsString, k2Q,
            k2M, k2T);
          sk2M := IntToStr(k2M);
          case k2T of
            1: sk2T := 'текущий';
            2: sk2T := 'будущий';
          end;
          stat1.SimpleText := stat1.SimpleText + sk2M + ' месяце квартала на ' +
            sk2T + ' месяц';
        end;

    end;
  end;
end;

procedure TFormIndex.N11Click(Sender: TObject);
begin
  MenuCheck(4, StrToInt(IntToStr(Main.Form1.GetQuartal()) +
    inttostr(Main.Form1.GetMonthOfQuartal(MonthOf(Date))) + '1'));
end;

procedure AddToStream(Source, Dest: TStream);
var
  Size: Integer;
begin
  Source.position := 0; //Сохраняем размер, помещая его в первый байт
  Size := Source.Size;
  Dest.Write(Size, SizeOf(Integer));
  Dest.CopyFrom(Source, Source.size);
end;

procedure GetFromStream(Source, Dest: TStream; Index: Integer);
var
  Size, I, n: Integer;
begin
  Source.Position := 0;
  n := pred(index);
  for i := 0 to n do
  begin
    Source.Read(Size, SizeOf(Integer));
    Source.Position := Source.Position + Size;
  end; // Если маркёр в файле равен размеру, то что-то пошло не так :(
  if Source.position = Source.Size then
    raise EAccessViolation.Create('Index Out Of Bounds');
  // Получаем желаемый размер файла
  Source.Read(Size, SizeOf(Integer));
  // Очищаем буфер у Dest
  Dest.Position := 0;
  Dest.Size := 0;
  Dest.CopyFrom(Source, Size);
end;

procedure TFormIndex.btn2Click(Sender: TObject);
var
  CurInd: Integer;
  iRec: TRecord;
  i: Byte;
  s1, s2, s3: string;
  t1: TStringList;
  ABigFileStream, SomeSmallFiles: TMemoryStream;
begin
  CurInd := DBGridIndex.Fields[0].AsInteger - 1;
  if (CurInd >= 0) and (dlgSave1.Execute) then
  begin
    s1 := GetTempDir + 'NP01VN_EI';
    if DirectoryExists(s1) then
      RemoveAll(s1);
    if ForceDirectories(s1) = True then
    begin
      iRec := RowList.Items[CurInd];
      t1 := TStringList.Create;
      t1.Add('Не изменяйте этот файл вручную!');
      t1.Add(WorkName);
      t1.Add(DateTimeToStr(now));
      t1.Add(IntToStr(iRec.Kod));
      t1.Add(iRec.Title);
      t1.Add(iRec.Marsh);
      t1.Add(iRec.Prim);
      t1.Add(iRec.Data);
      t1.SaveToFile(s1 + '\info.txt');
      t1.Clear;
      s2 := StartDir + Workname + '\';
      s3 := 'np01f' + inttostr(iRec.Digit) + '.';
      for i := 1 to 10 do
      begin
        if FileExists(s2 + s3 + ExpImpExt[i]) then
        begin
          t1.Add(ExpImpExt[i]);
          fCopyFile(s2 + s3 + ExpImpExt[i], s1 + '\_.' + ExpImpExt[i]);
        end;
      end;
      t1.SaveToFile(s1 + '\list.txt');
      ABigFileStream := TMemoryStream.Create;
      try
        SomeSmallFiles := TMemoryStream.Create;
        try
          SomeSmallFiles.LoadFromFile(s1 + '\info.txt');
          AddToStream(SomeSmallFiles, ABigFileStream);
          SomeSmallFiles.LoadFromFile(s1 + '\list.txt');
          AddToStream(SomeSmallFiles, ABigFileStream);
          for i := 0 to t1.Count - 1 do
          begin
            SomeSmallFiles.LoadFromFile(s1 + '\_.' + t1[i]);
            AddToStream(SomeSmallFiles, ABigFileStream);
          end;
        finally
          FreeAndNil(SomeSmallFiles);
        end;
        ABigFileStream.SaveToFile(dlgSave1.FileName);
      finally
        FreeAndNil(ABigFileStream);
      end;
      FreeAndNil(t1);
    end
    else
      ShowMessage('Ошибка создания временного каталога ' + s1);
  end;
end;

procedure TFormIndex.btn3Click(Sender: TObject);
var
  ABigFileStream, SomeSmallFiles: TMemoryStream;
  NewInd: Integer;
  i: Byte;
  s1, s2, s3: string;
  t1: TStringList;
begin
  if dlgOpen1.Execute = True then
  begin
    s1 := GetTempDir + 'NP01VN_EI';
    if DirectoryExists(s1) then
      RemoveAll(s1);
    ForceDirectories(s1);
    t1 := TStringList.Create;
    ABigFileStream := TMemoryStream.Create;
    try
      ABigFileStream.LoadFromFile(dlgOpen1.FileName);
      SomeSmallFiles := TMemoryStream.Create;
      try
        GetFromStream(ABigFileStream, SomeSmallFiles, 0);
        SomeSmallFiles.SaveToFile(s1 + '\info.txt');
        GetFromStream(ABigFileStream, SomeSmallFiles, 1);
        SomeSmallFiles.SaveToFile(s1 + '\list.txt');
        t1.LoadFromFile(s1 + '\info.txt');
        if Application.MessageBox(PAnsiChar('Импортировать таблицу: ' + t1[4] +
          #13#10 +
          'Исходный документ: ' + t1[1] + #13#10 +
          'Дата создания файла передачи: ' + t1[2]),
          'Импорт таблицы', MB_YESNOCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2)
          = IDYES then
        begin
          s2 := StartDir + Workname + '\';
          if (RowList.Count > 0) then
          begin
            NewInd := DBGridIndex.Fields[0].AsInteger;
            if (NewInd < 0) then
              NewInd := 0;
          end
          else
            NewInd := 0;
          {   // новая запись должна иметь номер CurInd + 1 }
          Inc(MaxDigit);
          RowList.Insert(NewInd, TRecord.Create(MaxDigit, StrToInt(t1[3]),
            t1[4], 0,
            t1[5],
            t1[6], t1[7]));
          Inc(NumRows);
          UpdateTable();
          t1.LoadFromFile(s1 + '\list.txt');
          s3 := 'NP01F' + inttostr(MaxDigit) + '.';
          for i := 0 to t1.Count - 1 do
          begin
            GetFromStream(ABigFileStream, SomeSmallFiles, i + 2);
            SomeSmallFiles.SaveToFile(s1 + '\_.' + t1[i]);
            fCopyFile(s1 + '\_.' + t1[i], s2 + s3 + t1[i]);
          end;
        end;
      finally FreeAndNil(SomeSmallFiles);
      end;
    finally FreeAndNil(ABigFileStream);
    end;
  end;
end;

procedure TFormIndex.CodesClick(Sender: TObject);
begin
  ShowPopupOnClick(Sender, pmKods);
end;

procedure TFormIndex.N1Click(Sender: TObject);
begin
  CodesChert
end;

procedure TFormIndex.N2Click(Sender: TObject);
begin
  CodesMaterial
end;

procedure TFormIndex.btnOPiUTMCClick(Sender: TObject);
begin
  ShowPopupOnClick(Sender, pmOPiUTMC);
end;

procedure TFormIndex.N12Click(Sender: TObject);
begin
  MenuCheck(3, MonthOfTheYear(Now));
end;

procedure TFormIndex.N13Click(Sender: TObject);
begin
  MenuCheck(5, MonthOfTheYear(Now));
end;

procedure TFormIndex.N14Click(Sender: TObject);
var
  t_old, t_new: TTable;
  CurRow: TRecord;
begin
  Inc(MaxDigit);
  CurRow := RowList.Items[Pred(DBGridIndex.Fields[0].AsInteger)];
  t_old := TTable.Create(Self);
  t_old.TableType := ttParadox;
  t_old.DatabaseName := StartDir + WorkName + '\';
  t_old.TableName := 'NP01F' + IntToStr(CurRow.Digit) + '.db';
  t_new := TTable.Create(Self);
  t_new.TableType := ttParadox;
  t_new.DatabaseName := t_old.DatabaseName;
  t_new.TableName := 'NP01F' + IntToStr(MaxDigit) + '.db';
  try
    RowList.Insert(DBGridIndex.Fields[0].AsInteger, TRecord.Create(MaxDigit,
      CurRow.Kod, 'СНЯТИЕ ' + CurRow.Title, CurRow.Sort, CurRow.Marsh,
      CurRow.Prim, CurRow.Data));
    Inc(NumRows);
    UpdateTable();
    if FileExists(t_old.DatabaseName + t_old.TableName) then
    begin
      t_new.BatchMove(t_old, batCopy);
      t_new.AddIndex('', 'Num', [ixPrimary]);
      t_new.AddIndex('TMS_Ki', 'KI', [ixCaseInsensitive]);
      t_new.AddIndex('TMS_Shi', 'Shifr', [ixCaseInsensitive]);
      t_new.AddIndex('TMS_KiShi', 'Ki;Shifr', [ixCaseInsensitive]);
      t_new.Active := True;
      t_new.First;
      while not t_new.Eof do
      begin
        t_new.Edit;
        t_new.FieldByName('Znak').AsString := '1';
        t_new.Next;
      end;
      t_new.Active := False;
    end;
  finally
    FreeAndNil(t_old);
    FreeAndNil(t_new);
  end;
end;

procedure TFormIndex.btnNativeExcelClick(Sender: TObject);
var
  WorkBook: IXLSWorkbook;
  Sheet: IXLSWorksheet;
  Range: IXLSRange;
  aRow, aRow_old, aCol, I, j: Integer;
  TableRow: TTable;
  CurIndex: Integer;
  num_i: Integer;
  iRow: Integer;
  iRec: TRecord;
  TableBegin: integer;
  iQ, iM, iT, iKol: Integer;
  TMSKolAr: array[1..3] of Integer;
  isTMC, isFirst, isTM48: Boolean;
  TitleWidth: Real;
  ColumnCol: Integer;
  exc_start: TTime;
  sPrevPrim, sPrimTek: string; //хранит примечание из предыдущ записи
  sPrevTitle, sTitleTek: string;

  function GetHAlign(const aParam1: integer): Cardinal;
  begin
    case aParam1 of
      1: Result := xlHAlignJustify;
      2: Result := xlHAlignLeft;
      3: Result := xlHAlignCenter;
      4: Result := xlHAlignRight;
    else
      Result := xlHAlignGeneral;
    end;

  end;

  procedure SetCollAllign(const aTableStart, aRecCount: integer);
  var
    ii: integer;
    jj: cardinal;
  begin
    for ii := 1 to 9 do
    begin
      if ExcelColumnHAlign[ii] > 0 then
        Sheet.RCRange[aTableStart, ii, aTableStart + aRecCount,
          ii].HorizontalAlignment := GetHAlign(ExcelColumnHAlign[ii]);
    end;
    if ExcelColumnHAlign[10] > 0 then
    begin
      jj := GetHAlign(ExcelColumnHAlign[10]);
      for ii := 10 to 23 do
      begin
        Sheet.RCRange[aTableStart, ii, aTableStart + aRecCount,
          ii].HorizontalAlignment := jj;
      end;
    end;
    if ExcelColumnHAlign[11] > 0 then
      Sheet.RCRange[aTableStart, 24, aTableStart + aRecCount,
        24].HorizontalAlignment := GetHAlign(ExcelColumnHAlign[11]);
    if ExcelColumnHAlign[12] > 0 then
      Sheet.RCRange[aTableStart, 25, aTableStart + aRecCount,
        25].HorizontalAlignment := GetHAlign(ExcelColumnHAlign[12]);
  end;

begin
  if isTest then
    exc_start := Sysutils.Time;
  isTMC := False; // если будет ТМЦ надо будет вставлять разрыв строк
  isFirst := True; // первая ли это таблица
  if sDocName = '' then
  begin
    bDocNameClick(nil);
  end;
  btnNativeExcel.Enabled := False;
  TMSKolAr[1] := 14;
  TMSKolAr[2] := 8;
  TMSKolAr[3] := 4;
  TableRow := TTable.Create(self);
  try
    Workbook := TXLSWorkbook.Create;
    Sheet := WorkBook.Sheets.Add;
    Sheet.Name := csDocSheetName_1;
    Sheet.Cells.Font.Name := csDocFont_1;
    Sheet.Cells.Font.Size := FontSize;
    // снять защиту
    Sheet.Cells.Locked := False;
    if bPrintShifr then
      ColumnCol := 25
    else
      ColumnCol := 24;
    Sheet.Cells.Columns[1].Font.Bold := True;
    Sheet.Cells.Columns[2].Font.Bold := True;
    Sheet.Cells.Columns[1].ColumnWidth := 5 + ExcelColumnWidth[1];
    Sheet.Cells.Columns[2].ColumnWidth := 1.55 + ExcelColumnWidth[2];
    Sheet.Cells.Columns[3].ColumnWidth := 6.14 + ExcelColumnWidth[3];
    Sheet.Cells.Columns[4].ColumnWidth := 16 + ExcelColumnWidth[4];
    Sheet.Cells.Columns[5].ColumnWidth := 6 + ExcelColumnWidth[5];
    Sheet.Cells.Columns[6].ColumnWidth := 10 + ExcelColumnWidth[6];
    Sheet.Cells.Columns[7].ColumnWidth := 10 + ExcelColumnWidth[7];
    Sheet.Cells.Columns[8].ColumnWidth := 10 + ExcelColumnWidth[8];
    Sheet.Cells.Columns[9].ColumnWidth := 1 + ExcelColumnWidth[9];
    for i := 10 to 23 do
      Sheet.Cells.Columns[i].ColumnWidth := 2.29 + ExcelColumnWidth[10];
    Sheet.Cells.Columns[24].ColumnWidth := 25 + ExcelColumnWidth[11];
    if bPrintShifr then
      Sheet.Cells.Columns[25].ColumnWidth := 30 + ExcelColumnWidth[12]
    else
      Sheet.Cells.Columns[25].ColumnWidth := 0;
    TitleWidth := 0;
    //подсчет суммы ширин столбцов
    for I := 1 to 25 do
      TitleWidth := TitleWidth + Sheet.Cells.Columns[i].ColumnWidth;
    Sheet.Cells.Columns[27].ColumnWidth := TitleWidth;
    Sheet.Cells.Columns[27].WrapText := True;
    Sheet.Cells.Columns[27].Hidden := True;
    for i := 1 to 3 do
      Sheet.Cells.Rows[i].Font.Size := 11;
    //Sheet.Cells.Item[2, 22].Value := sDocHead_1;
    Sheet.Cells.Item[2, 24].Value := sDocHead_1;
    Sheet.Cells.Item[3, 24].Value := sDocHead_2;
    Sheet.Cells.Item[2, 1].Value := csDocHead_3 + Copy(sDocName, 1, 10);
    Sheet.Cells.Item[3, 1].Value := Copy(sDocName, 12, 255);
    Sheet.RCRange[2, 1, 3, 24].Font.Name := csDocFont_1;
    Sheet.RCRange[2, 1, 3, 24].Font.Size := FontSize;
    Sheet.RCRange[2, 1, 3, 24].Font.Bold := True;
    aRow := 6;
    Inc(aRow);
    for iRow := 0 to RowList.Count - 1 do
    begin
      iRec := RowList.Items[iRow];
      Sheet.Cells.Item[aRow, 1].Font.Bold := True;
      Range := Sheet.RCRange[aRow, 1, aRow, ColumnCol];
      Range.Merge;
      Range.HorizontalAlignment := xlHAlignCenter; // сентер -4108;
      Range.VerticalAlignment := xlVAlignCenter;
      Range.WrapText := True;
      Sheet.Cells.Item[aRow, 27].Value := DelCR(iRec.Title);
      Sheet.Cells.Item[aRow, 1].Value := DelCR(iRec.Title);
      if PageBreakTMC = True then
      begin
        // разбивка страниц
        if isFirst = True then
          isFirst := False
        else
        begin
          if (iRec.Kod = 3) or (iRec.Kod = 4) or (iRec.Kod = 5) then
          begin
            if isTMC = False then
            begin
              Sheet.HPageBreaks.Add(Sheet.RCRange[aRow, 1, aRow, 1]);
              isTMC := True
            end;
          end
          else
          begin
            if isTMC = True then
            begin
              Sheet.HPageBreaks.Add(Sheet.RCRange[aRow, 1, aRow, 1]);
              isTMC := False
            end;
          end;
        end;
        // -- разбивка страниц
      end;
      sPrevPrim := '';
      sPrevTitle := '';
      case iRec.Kod of
        1: //таблица плана
          begin
            if FileExists(StartDir + WorkName + csSymb_BackSlash + csNP01F +
              IntToStr(iRec.Digit) + csDBExt) = True then
            begin
              Inc(aRow);
              GetFromKod2(StrToInt(iRec.Data), iQ, iM, iT);
              Sheet.RCRange[aRow, 1, aRow + 1, 1].Merge;
              Sheet.RCRange[aRow, 2, aRow + 1, 3].Merge;
              Sheet.RCRange[aRow, 4, aRow + 1, 4].Merge;
              Sheet.RCRange[aRow, 5, aRow + 1, 5].Merge;
              Sheet.RCRange[aRow, 6, aRow, 8].Merge;
              Sheet.RCRange[aRow, 9, aRow + 1, 23].Merge;
              Sheet.RCRange[aRow, 24, aRow + 1, 24].Merge;
              if bPrintShifr then
                Sheet.RCRange[aRow, 25, aRow + 1, 25].Merge;
              Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].HorizontalAlignment :=
                xlHAlignCenter;
              Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].VerticalAlignment :=
                xlVAlignCenter;
              Sheet.Cells.Item[aRow, 1].Value := csDocColumn_1;
              Sheet.Cells.Item[aRow, 2].Value := csDocColumn_2;
              Sheet.Cells.Item[aRow, 4].Value := csDocColumn_3;
              Sheet.Cells.Item[aRow, 5].Value := csDocColumn_4;
              Sheet.Cells.Item[aRow, 6].Value := csDocColumn_5;
              Sheet.Cells.Item[aRow + 1, 6].Value := SysUtils.LongMonthNames[(iQ
                - 1) * 3 + 1];
              Sheet.Cells.Item[aRow + 1, 7].Value := SysUtils.LongMonthNames[(iQ
                - 1) * 3 + 2];
              Sheet.Cells.Item[aRow + 1, 8].Value := SysUtils.LongMonthNames[(iQ
                - 1) * 3 + 3];
              Sheet.Cells.Item[aRow, 9].Value := csRoute;
              Sheet.Cells.Item[aRow, 24].Value := csDocColumn_9;
              if bPrintShifr then
                Sheet.Cells.Item[aRow, 25].Value := csDocColumn_16;
              Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].Font.Bold := True;
              SetBorderNative(Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol], 0);
              TableRow.DatabaseName := StartDir + WorkName + csSymb_BackSlash;
              TableRow.TableName := csNP01F + IntToStr(iRec.Digit);
              isTM48 := Form1.TableFieldTest(TableRow, 'TM13');
              try
                TableRow.Open;
              except
                aRow := aRow + 2;
                Continue;
              end;
              CurIndex := iRec.Sort;
              TableRow.IndexDefs.Update;
              if CurIndex < TableRow.IndexDefs.Count then
                TableRow.IndexName := TableRow.IndexDefs.Items[CurIndex].Name;
              aRow := aRow + 2;
              TableBegin := aRow;
              Range := Sheet.RCRange[TableBegin, 1, TableBegin +
                TableRow.RecordCount, ColumnCol];
              SetBorderNative(Range, -1);
              Sheet.RCRange[aRow, 10, aRow + TableRow.RecordCount - 1,
                21].NumberFormat := '00';
              aRow_old := aRow;
              {Sheet.RCRange[aRow, 10, aRow + TableRow.RecordCount - 1,
                21].HorizontalAlignment}
              TableRow.First;
              I := 1;
              while not TableRow.Eof do
              begin
                Sheet.Cells.Item[aRow, 1].Value := I;
                Sheet.Cells.Item[aRow, 3].HorizontalAlignment := xlHAlignRight;
                Sheet.Cells.Item[aRow, 4].HorizontalAlignment := xlHAlignRight;
                Sheet.Cells.Item[aRow, 4].Font.Size := ChertFontSize;
                for aCol := 3 to 8 do
                  Sheet.Cells.Item[aRow, aCol].Value := TableRow.Fields[aCol -
                    2].AsString;
                for aCol := 10 to 21 do
                  Sheet.Cells.Item[aRow, aCol].Value := TableRow.Fields[aCol -
                    3].AsString;
                if isTM48 then
                begin
                  Sheet.Cells.Item[aRow, 22].Value :=
                    TableRow.fieldbyname('TM13').AsString;
                  Sheet.Cells.Item[aRow, 23].Value :=
                    TableRow.fieldbyname('TM14').AsString;
                end;
                if bExchPrimech then
                begin
                  sPrimTek := TableRow.fieldbyname('Primech').AsString;
                  if (sPrimTek <> '') and (sPrimTek = sPrevPrim) then
                    Sheet.Cells.Item[aRow, 24].Value := sExchPrimech
                  else
                  begin
                    Sheet.Cells.Item[aRow, 24].Value := sPrimTek;
                    sPrevPrim := sPrimTek;
                  end
                end
                else
                  Sheet.Cells.Item[aRow, 24].Value :=
                    TableRow.fieldbyname('Primech').AsString;
                if bPrintShifr then
                begin
                  if bExchTitle then
                  begin
                    sTitleTek :=
                      FormIndex.GetChertTitle(TableRow.FieldByName('Chert').AsString);
                    if (sTitleTek <> '') and (sTitleTek = sPrevTitle) then
                      Sheet.Cells.Item[aRow, 25].Value := sExchTitle
                    else
                    begin
                      Sheet.Cells.Item[aRow, 25].Value := sTitleTek;
                      sPrevTitle := sTitleTek;
                    end
                  end
                  else
                    Sheet.Cells.Item[aRow, 25].Value :=
                      FormIndex.GetChertTitle(TableRow.FieldByName('Chert').AsString);
                end;

                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;
              SetCollAllign(aRow_old, TableRow.RecordCount);
              TableRow.Close;
              // защита ячеек
              Sheet.RCRange[TableBegin - 2, 1, aRow - 1, 23].Locked := True;
            end;
          end;
        2: //строка
          begin
            Range.HorizontalAlignment := xlHAlignCenter;
          end;
        3, 5: //таблица корректировки лимита и остатка лимита ТМЦ месяц
          begin
            if FileExists(StartDir + WorkName + csSymb_BackSlash + csNP01F +
              IntToStr(iRec.Digit) + csDBExt) = True then
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
              Sheet.RCRange[aRow, 16, aRow + 1, 21].Merge;
              Sheet.RCRange[aRow, 22, aRow + 1, 24].Merge;
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
              Sheet.Cells.Item[aRow, 22].Value := csDocColumn_9;
              if bPrintShifr then
              begin
                Sheet.RCRange[aRow, 25, aRow + 1, 25].Merge;
                Sheet.Cells.Item[aRow, 25].Value := csDocColumn_16;
              end;
              Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].Font.Bold := True;
              SetBorderNative(Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol], 0);
              Sheet.Cells.Rows[aRow].RowHeight := 27;
              TableRow.DatabaseName := StartDir + WorkName + csSymb_BackSlash;
              TableRow.TableName := csNP01F + IntToStr(iRec.Digit);
              CurIndex := iRec.Sort;
              TableRow.IndexDefs.Update;
              if CurIndex = 0 then
                TableRow.IndexName := ''
              else if (CurIndex < TableRow.IndexDefs.Count) then
                TableRow.IndexName := TableRow.IndexDefs.Items[CurIndex].Name;
              try
                TableRow.Open;
              except
                aRow := aRow + 2;
                Continue;
              end;
              aRow := aRow + 2;
              TableBegin := aRow;
              Range := Sheet.RCRange[TableBegin, 1, TableBegin +
                TableRow.RecordCount - 1, ColumnCol];
              aRow_old := aRow;
              SetBorderNative(Range, -1);
              num_i := Ord(TableRow.Fields.FindField('Num') = nil);
              TableRow.First;
              I := 1;
              while not TableRow.Eof do
              begin
                Sheet.Cells.Item[aRow, 1].Value := I;
                Sheet.Cells.Item[aRow, 3].HorizontalAlignment := xlHAlignLeft;
                Sheet.Cells.Item[aRow, 4].HorizontalAlignment := xlHAlignRight;
                Sheet.Cells[aRow, 4].Font.Size := ChertFontSize;
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
                Sheet.RCRange[aRow, 16, aRow, 21].Merge;
                Sheet.Cells.Item[aRow, 16].HorizontalAlignment :=
                  xlHAlignCenter;
                Sheet.Cells.Item[aRow, 16].Value := TableRow.Fields[7 -
                  num_i].AsString;
                Sheet.RCRange[aRow, 22, aRow, 24].Merge;
                if bExchPrimech then
                begin
                  sPrimTek := TableRow.Fields[10 - num_i].AsString;
                  if (sPrimTek <> '') and (sPrimTek = sPrevPrim) then
                    Sheet.Cells.Item[aRow, 22].Value := sExchPrimech
                  else
                  begin
                    Sheet.Cells.Item[aRow, 22].Value := sPrimTek;
                    sPrevPrim := sPrimTek;
                  end;
                end
                else
                  Sheet.Cells.Item[aRow, 22].Value := TableRow.Fields[10 -
                    num_i].AsString;
                if bPrintShifr then
                begin
                  if bExchTitle then
                  begin
                    sTitleTek :=
                      FormIndex.GetShifrTitle(TableRow.FieldByName('Shifr').AsString);
                    if (sTitleTek <> '') and (sTitleTek = sPrevTitle) then
                      Sheet.Cells.Item[aRow, 25].Value := sExchTitle
                    else
                    begin
                      Sheet.Cells.Item[aRow, 25].Value := sTitleTek;
                      sPrevTitle := sTitleTek;
                    end
                  end
                  else
                    Sheet.Cells.Item[aRow, 25].Value :=
                      FormIndex.GetShifrTitle(TableRow.FieldByName('Shifr').AsString);
                end;
                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;
              SetCollAllign(aRow_old, TableRow.RecordCount);
              TableRow.Close;
              // защита ячеек
              Sheet.RCRange[TableBegin - 2, 1, aRow - 1, ColumnCol].Locked :=
                True;
            end;
          end;
        4: //таблица корректировки лимита ТМЦ квартал
          begin
            if FileExists(StartDir + WorkName + csSymb_BackSlash + csNP01F +
              IntToStr(iRec.Digit) + csDBExt) = True then
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
              Sheet.RCRange[aRow, 17, aRow + 1, 24].Merge;
              if bPrintShifr then
                Sheet.RCRange[aRow, 25, aRow + 1, 25].Merge;
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
              if bPrintShifr then
                Sheet.Cells.Item[aRow, 25].Value := csDocColumn_16;
              case iT of
                1: iKol := 4 - iM; //текущий квартал, анализируем месяца
                2: iKol := 3; //буд квартал, все мес
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
              TableRow.DatabaseName := StartDir + WorkName + csSymb_BackSlash;
              TableRow.TableName := csNP01F + IntToStr(iRec.Digit);
              CurIndex := iRec.Sort;
              TableRow.IndexDefs.Update;
              if CurIndex = 0 then
                TableRow.IndexName := ''
              else if (CurIndex < TableRow.IndexDefs.Count) then
                TableRow.IndexName := TableRow.IndexDefs.Items[CurIndex].Name;
              try
                TableRow.Open;
              except
                aRow := aRow + 2;
                Continue;
              end;
              aRow := aRow + 2;
              TableBegin := aRow;
              Range := Sheet.RCRange[TableBegin, 1, TableBegin +
                TableRow.RecordCount - 1, ColumnCol];
              aRow_old := aRow;
              SetBorderNative(Range, -1);
              num_i := Ord(TableRow.Fields.FindField('Num') <> nil);
              TableRow.First;
              I := 1;
              while not TableRow.Eof do
              begin
                Sheet.Cells.Item[aRow, 1].Value := I;
                Sheet.Cells.Item[aRow, 3].HorizontalAlignment := xlHAlignLeft;
                Sheet.Cells.Item[aRow, 4].HorizontalAlignment := xlHAlignRight;
                Sheet.Cells.Item[aRow, 4].Font.Size := ChertFontSize;
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
                Sheet.RCRange[aRow, 17, aRow, 24].Merge;
                if bExchPrimech then
                begin
                  sPrimTek := TableRow.Fields[9 + num_i].AsString;
                  if (sPrimTek <> '') and (sPrimTek = sPrevPrim) then
                    Sheet.Cells.Item[aRow, 17].Value := sExchPrimech
                  else
                  begin
                    Sheet.Cells.Item[aRow, 17].Value := sPrimTek;
                    sPrevPrim := sPrimTek;
                  end
                end
                else
                  Sheet.Cells.Item[aRow, 17].Value :=
                    TableRow.Fields[9 + num_i].AsString;
                if bPrintShifr then
                begin
                  if bExchTitle then
                  begin
                    sTitleTek :=
                      FormIndex.GetShifrTitle(TableRow.FieldByName('Shifr').AsString);
                    if (sTitleTek <> '') and (sTitleTek = sPrevTitle) then
                      Sheet.Cells.Item[aRow, 25].Value := sExchTitle
                    else
                    begin
                      Sheet.Cells.Item[aRow, 25].Value := sTitleTek;
                      sPrevTitle := sTitleTek;
                    end
                  end
                  else
                    Sheet.Cells.Item[aRow, 25].Value :=
                      FormIndex.GetShifrTitle(TableRow.FieldByName('Shifr').AsString);
                end;
                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;
              SetCollAllign(aRow_old, TableRow.RecordCount);
              TableRow.Close;
              // защита ячеек
              Sheet.RCRange[TableBegin - 2, 1, aRow - 1, 25].Locked := True;
            end;
          end;
        6, 7: //Корректировка плана и лимита, корректировка лимита
          begin
            if FileExists(StartDir + WorkName + csSymb_BackSlash + csNP01F +
              IntToStr(iRec.Digit) + csDBExt) = True then
            begin
              Inc(aRow);
              GetFromKod2(StrToInt(iRec.Data), iQ, iM, iT);
              Sheet.RCRange[aRow, 1, aRow + 1, 1].Merge;
              Sheet.RCRange[aRow, 2, aRow + 1, 3].Merge;
              Sheet.RCRange[aRow, 4, aRow + 1, 4].Merge;
              Sheet.RCRange[aRow, 5, aRow + 1, 5].Merge;
              Sheet.RCRange[aRow, 6, aRow, 8].Merge;
              Sheet.RCRange[aRow, 9, aRow + 1, 23].Merge;
              Sheet.RCRange[aRow, 24, aRow + 1, 24].Merge;
              if bPrintShifr then
                Sheet.RCRange[aRow, 25, aRow + 1, 25].Merge;
              Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].HorizontalAlignment :=
                xlHAlignCenter;
              Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].VerticalAlignment :=
                xlVAlignCenter;
              Sheet.Cells.Item[aRow, 1].Value := csDocColumn_1;
              Sheet.Cells.Item[aRow, 2].Value := csDocColumn_2;
              Sheet.Cells.Item[aRow, 4].Value := csDocColumn_3;
              Sheet.Cells.Item[aRow, 5].Value := csDocColumn_4;
              Sheet.Cells.Item[aRow, 6].Value := csDocColumn_5;
              // название месяцев
              case iT of
                1: iKol := 4 - iM; //текущий квартал, анализируем месяца
                2: iKol := 3; //буд квартал, все мес
              end;
              Sheet.Cells.Item[aRow + 1, 6].Value := SysUtils.LongMonthNames[(iQ
                - 1) * 3 + 1];
              Sheet.Cells.Item[aRow + 1, 7].Value := SysUtils.LongMonthNames[(iQ
                - 1) * 3 + 2];
              Sheet.Cells.Item[aRow + 1, 8].Value := SysUtils.LongMonthNames[(iQ
                - 1) * 3 + 3];
              Sheet.Cells.Item[aRow, 9].Value := iRec.Marsh;
              Sheet.Cells.Item[aRow, 24].Value := iRec.Prim;
              if bPrintShifr then
                Sheet.Cells.Item[aRow, 25].Value := csDocColumn_16;
              Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].Font.Bold := True;
              SetBorderNative(Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol], 0);
              TableRow.DatabaseName := StartDir + WorkName + csSymb_BackSlash;
              TableRow.TableName := csNP01F + IntToStr(iRec.Digit);
              isTM48 := Form1.TableFieldTest(TableRow, 'TM13');
              try
                TableRow.Open;
              except
                aRow := aRow + 2;
                Continue;
              end;
              CurIndex := iRec.Sort;
              TableRow.IndexDefs.Update;
              if (CurIndex < TableRow.IndexDefs.Count) then
                TableRow.IndexName := TableRow.IndexDefs.Items[CurIndex].Name;
              aRow := aRow + 2;
              TableBegin := aRow;
              Range := Sheet.RCRange[TableBegin, 1, TableBegin +
                TableRow.RecordCount - 1, ColumnCol];
              SetBorderNative(Range, -1);
              Sheet.RCRange[aRow, 10, aRow + TableRow.RecordCount - 1,
                23].NumberFormat := '00';
              aRow_old := aRow;
              TableRow.First;
              I := 1;
              while not TableRow.Eof do
              begin
                Sheet.Cells.Item[aRow, 1].Value := I;
                Sheet.Cells.Item[aRow, 3].HorizontalAlignment := xlHAlignCenter;
                Sheet.Cells.Item[aRow, 4].HorizontalAlignment := xlHAlignRight;
                Sheet.Cells.Item[aRow, 4].Font.Size := ChertFontSize;
                for aCol := 3 to 5 do
                  Sheet.Cells.Item[aRow, aCol].Value := TableRow.Fields[aCol -
                    2].AsString;
                if iKol = 3 then
                  Sheet.Cells.Item[aRow, 6].Value :=
                    TableRow.Fields[4].AsString;
                if iKol > 1 then
                  Sheet.Cells.Item[aRow, 7].Value :=
                    TableRow.Fields[5].AsString;
                Sheet.Cells.Item[aRow, 8].Value := TableRow.Fields[6].AsString;
                for aCol := 10 to 21 do
                  Sheet.Cells.Item[aRow, aCol].Value := TableRow.Fields[aCol -
                    3].AsString;
                if isTM48 then
                begin
                  Sheet.Cells.Item[aRow, 22].Value :=
                    TableRow.fieldbyname('TM13').AsString;
                  Sheet.Cells.Item[aRow, 23].Value :=
                    TableRow.fieldbyname('TM14').AsString;
                end;
                if bExchPrimech then
                begin
                  sPrimTek := TableRow.fieldbyname('Primech').AsString;
                  if (sPrimTek <> '') and (sPrimTek = sPrevPrim) then
                    Sheet.Cells.Item[aRow, 24].Value := sExchPrimech
                  else
                  begin
                    Sheet.Cells.Item[aRow, 24].Value := sPrimTek;
                    sPrevPrim := sPrimTek;
                  end
                end
                else
                  Sheet.Cells.Item[aRow, 24].Value :=
                    TableRow.fieldbyname('Primech').AsString;
                if bPrintShifr then
                begin
                  if bExchTitle then
                  begin
                    sTitleTek :=
                      FormIndex.GetChertTitle(TableRow.FieldByName('Chert').AsString);
                    if (sTitleTek <> '') and (sTitleTek = sPrevTitle) then
                      Sheet.Cells.Item[aRow, 25].Value := sExchTitle
                    else
                    begin
                      Sheet.Cells.Item[aRow, 25].Value := sTitleTek;
                      sPrevTitle := sTitleTek;
                    end
                  end
                  else
                    Sheet.Cells.Item[aRow, 25].Value :=
                      FormIndex.GetChertTitle(TableRow.FieldByName('Chert').AsString);
                end;
                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;
              SetCollAllign(aRow_old, TableRow.RecordCount);
              TableRow.Close;
              Sheet.RCRange[TableBegin - 2, 1, aRow - 1, 23].Locked := True;
            end;
          end;
        8: //Корректировка плана и лимита, корректировка лимита
          begin
            if FileExists(StartDir + WorkName + csSymb_BackSlash + csNP01F +
              IntToStr(iRec.Digit) + csDBExt) = True then
            begin
              Inc(aRow);
              GetFromKod2(StrToInt(iRec.Data), iQ, iM, iT);
              if iT = 2 then
              begin
                if iM < 3 then
                  inc(iM)
                else
                begin
                  iM := 1;
                  inc(iQ);
                end
              end;
              if iQ = 5 then
                iQ := 1;
              Sheet.RCRange[aRow, 1, aRow + 1, 1].Merge;
              Sheet.RCRange[aRow, 2, aRow + 1, 3].Merge;
              Sheet.RCRange[aRow, 4, aRow + 1, 4].Merge;
              Sheet.RCRange[aRow, 5, aRow + 1, 5].Merge;
              Sheet.RCRange[aRow, 6, aRow, 8].Merge;
              Sheet.RCRange[aRow, 9, aRow + 1, 23].Merge;
              Sheet.RCRange[aRow, 24, aRow + 1, 24].Merge;
              if bPrintShifr then
                Sheet.RCRange[aRow, 25, aRow + 1, 25].Merge;
              Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].HorizontalAlignment :=
                xlHAlignCenter;
              Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].VerticalAlignment :=
                xlVAlignCenter;
              Sheet.Cells.Item[aRow, 1].Value := csDocColumn_1;
              Sheet.Cells.Item[aRow, 2].Value := csDocColumn_2;
              Sheet.Cells.Item[aRow, 4].Value := csDocColumn_3;
              Sheet.Cells.Item[aRow, 5].Value := csDocColumn_4;
              Sheet.Cells.Item[aRow, 6].Value := csDocColumn_5;
              Sheet.Cells.Item[aRow + 1, 6].Value := SysUtils.LongMonthNames[(iQ
                - 1) * 3 + 1];
              Sheet.Cells.Item[aRow + 1, 7].Value := SysUtils.LongMonthNames[(iQ
                - 1) * 3 + 2];
              Sheet.Cells.Item[aRow + 1, 8].Value := SysUtils.LongMonthNames[(iQ
                - 1) * 3 + 3];
              Sheet.Cells.Item[aRow, 9].Value := iRec.Marsh;
              Sheet.Cells.Item[aRow, 24].Value := iRec.Prim;
              if bPrintShifr then
                Sheet.Cells.Item[aRow, 25].Value := csDocColumn_16;
              Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol].Font.Bold := True;
              SetBorderNative(Sheet.RCRange[aRow, 1, aRow + 1, ColumnCol], 0);
              TableRow.DatabaseName := StartDir + WorkName + csSymb_BackSlash;
              TableRow.TableName := csNP01F + IntToStr(iRec.Digit);
              isTM48 := Form1.TableFieldTest(TableRow, 'TM13');
              try
                TableRow.Open;
              except
                aRow := aRow + 2;
                Continue;
              end;
              CurIndex := iRec.Sort;
              TableRow.IndexDefs.Update;
              if (CurIndex < TableRow.IndexDefs.Count) then
                TableRow.IndexName := TableRow.IndexDefs.Items[CurIndex].Name;
              aRow := aRow + 2;
              TableBegin := aRow;
              Range := Sheet.RCRange[TableBegin, 1, TableBegin +
                TableRow.RecordCount - 1, ColumnCol];
              SetBorderNative(Range, -1);
              Sheet.RCRange[aRow, 10, aRow + TableRow.RecordCount - 1,
                23].NumberFormat := '00';
              aRow_old := aRow;
              TableRow.First;
              I := 1;
              while not TableRow.Eof do
              begin
                Sheet.Cells.Item[aRow, 1].Value := I;
                Sheet.Cells.Item[aRow, 3].HorizontalAlignment := xlHAlignLeft;
                Sheet.Cells.Item[aRow, 4].HorizontalAlignment := xlHAlignRight;
                Sheet.Cells.Item[aRow, 4].Font.Size := ChertFontSize;
                for aCol := 3 to 5 do
                  Sheet.Cells.Item[aRow, aCol].Value := TableRow.Fields[aCol -
                    2].AsString;
                Sheet.Cells.Item[aRow, 5 + iM].Value := TableRow.Fields[3 +
                  iM].AsString;
                for aCol := 10 to 21 do
                  Sheet.Cells.Item[aRow, aCol].Value := TableRow.Fields[aCol -
                    3].AsString;
                if isTM48 then
                begin
                  Sheet.Cells.Item[aRow, 22].Value :=
                    TableRow.fieldbyname('TM13').AsString;
                  Sheet.Cells.Item[aRow, 23].Value :=
                    TableRow.fieldbyname('TM14').AsString;
                end;
                if bExchPrimech then
                begin
                  sPrimTek := TableRow.fieldbyname('Primech').AsString;
                  if (sPrimTek <> '') and (sPrimTek = sPrevPrim) then
                    Sheet.Cells.Item[aRow, 24].Value := sExchPrimech
                  else
                  begin
                    Sheet.Cells.Item[aRow, 24].Value := sPrimTek;
                    sPrevPrim := sPrimTek;
                  end
                end
                else
                  Sheet.Cells.Item[aRow, 24].Value :=
                    TableRow.fieldbyname('Primech').AsString;
                if bPrintShifr then
                begin
                  if bExchTitle then
                  begin
                    sTitleTek :=
                      FormIndex.GetChertTitle(TableRow.FieldByName('Chert').AsString);
                    if (sTitleTek <> '') and (sTitleTek = sPrevTitle) then
                      Sheet.Cells.Item[aRow, 25].Value := sExchTitle
                    else
                    begin
                      Sheet.Cells.Item[aRow, 25].Value := sTitleTek;
                      sPrevTitle := sTitleTek;
                    end
                  end
                  else
                    Sheet.Cells.Item[aRow, 25].Value :=
                      FormIndex.GetChertTitle(TableRow.FieldByName('Chert').AsString);
                end;
                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;
              SetCollAllign(aRow_old, TableRow.RecordCount);
              TableRow.Close;
              // защита ячеек
              Sheet.RCRange[TableBegin - 2, 1, aRow - 1, 23].Locked := True;
            end;
          end;

      end;
      aRow := aRow + 2;
    end;
    if bPrintShifr then
      Workbook.Worksheets[1].PageSetup.PrintArea := 'A1:Y' + IntToStr(aRow + 1)
    else
      Workbook.Worksheets[1].PageSetup.PrintArea := 'A1:X' + IntToStr(aRow + 1);
    Workbook.Worksheets[1].PageSetup.LeftMargin := 0.3;
    Workbook.Worksheets[1].PageSetup.TopMargin := 0.3;
    Workbook.Worksheets[1].PageSetup.RightMargin := 0.3;
    Workbook.Worksheets[1].PageSetup.BottomMargin := 0.45;
    Workbook.Worksheets[1].PageSetup.FooterMargin := 0.2;
    Workbook.Worksheets[1].PageSetup.CenterFooter := csDocPageFooter;
    //Sheet.PageSetup.Orientation := PaperOrientation;
    //Sheet.PageSetup.PaperSize := PaperSize;
    Workbook.Worksheets[1].PageSetup.PaperSize := PaperSize;
    Workbook.Worksheets[1].PageSetup.Orientation := PaperOrientation;
    Workbook.Worksheets[1].PageSetup.Zoom := False;
    Workbook.Worksheets[1].PageSetup.FitToPagesTall := False;
    Workbook.Worksheets[1].PageSetup.FitToPagesWide := 1;
    Sheet.Protect(csDocPasw);
    DeleteFile(OutputFile);
    if isTest then
    begin
      exc_start := Sysutils.Time - exc_start;
      ShowMessage('Время вывода: ' + TimeToStr(exc_start));
    end;
    WorkBook.SaveAs(OutputFile);
    if ShowExcel then
      ShellExecute(Handle, 'open', PAnsiChar(Outputfile), nil, nil, SW_RESTORE);
  except
    //ExcelApp.Quit;
    on E: Exception do
    begin
      MessageBox(0, PChar(E.Message), nil, MB_ICONERROR);
    end;
  end;
  FreeAndNil(TableRow);
  btnNativeExcel.Enabled := True;
end;

procedure TFormIndex.FormCreate(Sender: TObject);
begin
  ShowOld := False;
end;

procedure TFormIndex.BitBtn1Click(Sender: TObject);
begin
  Self.Close;
end;

end.

