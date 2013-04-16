{
Sample:
function CheckKi(var source: string): Boolean;
begin
  Result := not (StrToIntDef(source, 0) = 0);
  if Result and (Length(source) <= 4) then
    source := SAVLib.Padl(source, 4, '0')
  else
    Result := False;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  IgnList, ImpList: TStringList;
  TestList: TList;
begin
  IgnList := TStringList.Create; //ignored fields list
  ImpList := TStringList.Create; //important fields list
  TestList := TList.Create; // verification methods (objects)
  TestList.Add(TTestElement.Create('Ki', CheckKi));
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
  PasteMSO.FillCheckList(Table1, ImpList, IgnList);
  PasteMSO.Indication := IntToStr(NewString.Kod);
  FreeAndNil(IgnList);
  FreeAndNil(ImpList);
  PasteFromMSO.TestMethods := TestList;
  PasteMSO.ChecklistIniFileName:=LocalStorage+'np01vn_chklst1.ini';
  if PasteMSO.ShowModal = mrOk then
    PasteMSO.PasteToGrid(Table1, DBGrid1);
  FreeAndNil(TestList);
end;
}

unit PasteFromMSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ExtCtrls, Buttons, Grids, DBTables, DB, DBGrids,
  IniFiles;

resourcestring
  rsClearColumn = 'Пропускаемый столбец';
  rsClearSign = '-';

type
  TPasteMSO = class(TForm)
    rg1: TRadioGroup;
    grp1: TGroupBox;
    chklst1: TCheckListBox;
    btnUp: TBitBtn;
    btnDown: TBitBtn;
    lblHint: TLabel;
    btnTest: TButton;
    btnPaste: TButton;
    pnl1: TPanel;
    strngrd1: TStringGrid;
    spl1: TSplitter;
    mmo1: TMemo;
    btn1: TButton;
    edtDelimiter: TEdit;
    btnTab: TButton;
    btnLoad: TBitBtn;
    btnSave: TBitBtn;
    btnEmpty: TBitBtn;
    btnChkOpt: TBitBtn;
    lstFieldOpt: TListBox;
    edtFieldOpt: TEdit;
    btnAddOpt: TButton;
    btnDeleteOpt: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure chklst1ClickCheck(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTabClick(Sender: TObject);
    procedure btnEmptyClick(Sender: TObject);
    procedure mmo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklst1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnDeleteOptClick(Sender: TObject);
    procedure btnChkOptClick(Sender: TObject);
    procedure btnAddOptClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lstFieldOptMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure rg1Click(Sender: TObject);
    procedure chklst1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure chklst1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lstFieldOptDblClick(Sender: TObject);
  private
    FIndication: string;
    FOldindex: Integer;
    FChecklistIniFileName: string;
    procedure SetStrngrdHead;
  public
    property Indication: string read FIndication write FIndication;
    property ChecklistIniFileName: string read FChecklistIniFileName write
      FChecklistIniFileName;
    function FillCheckList(t: TTable; ImportantFields, IgnoredFields:
      TStringList): Boolean;
    procedure PasteToGrid(TargetTable: TDataSet; TargetGrid: TDBGrid);
    procedure FieldOptVisible(const Showing: Boolean = True);
    procedure FillListOpt;
    function GridVerification(const ShowStop: Boolean =
      False): Boolean;
    function CheckCell(const FieldLabel: string; var CellItem: string): Boolean;
    function GetTestNum(List: TList; const FieldName: string): integer;
  end;

  CheckElement = function(var source: string): Boolean;

  TTestElement = class
  protected
    FFieldName: string;
    FCheckItem: CheckElement;
  public
    property FieldName: string read FFieldName write FFieldName;
    property CheckItem: CheckElement read FCheckItem write FCheckItem;
    constructor Create(AFieldName: string; AFunc: CheckElement);
  end;

  {TCheckListElement = class

      FCaption : string;
      FChecked : Boolean;
    public
      property Caption:string  read FCaption write FCaption;
      property Checked:Boolean  read FChecked write FChecked;

  end;}

procedure List2StringGrid(SourceList: TStrings; TargetGrid: TStringGrid; const
  FromRow: integer = 0; const Delimiter: string = #9; const FillString: string =
  '');

function StringGrid2DbGridSelected(DBGrid: TDBGrid; FieldList: TStrings;
  StringGrid: TStringGrid; const FromRow: Integer = 0; const FromCol: Integer =
  0): integer;

procedure StringGrid2Table(Table: TDataSet; FieldList: TStrings; StringGrid:
  TStringGrid; const FromRow: Integer = 0; const FromCol: Integer = 0);

procedure GetValueListFromCheckList(Source: TCheckListBox; Dest: TStrings; const
  IgnoreString: string = '');

var
  PasteMSO: TPasteMSO;
  ShowFields: TStringList;
  TestMethods: TList;

implementation

uses Math, SAVLib;
var
  FieldOptIni: TMemIniFile;

{$R *.dfm}

constructor TTestElement.Create(AFieldName: string; AFunc: CheckElement);
begin
  FFieldName := AFieldName;
  FCheckItem := AFunc;
end;

procedure TPasteMSO.FormShow(Sender: TObject);
begin
  if Assigned(FieldOptIni) then
    FreeAndNil(FieldOptIni);
  FieldOptIni := TMemIniFile.Create(FChecklistIniFileName);
  mmo1.Clear;
  mmo1.PasteFromClipboard;
  FieldOptVisible(False);
  FOldindex := -1;
  ShowFields.Clear;
end;

function TPasteMSO.GetTestNum(List: TList; const FieldName: string): integer;
var
  i: Integer;
begin
  Result := -1;
  if Assigned(List) then
  begin
    i := 0;
    while (i < List.Count) and (Result = -1) do
    begin
      if TTestElement(TestMethods.Items[i]).FieldName = FieldName then
        Result := i;
      Inc(i);
    end;
  end;
end;

procedure DoMoveListItem(chklst1: TCustomListBox; const AKind: Boolean);
var
  lIndex: Integer;
begin
  lIndex := chklst1.ItemIndex;
  if (lIndex >= 0) and (lIndex < chklst1.Count) then
  begin
    case AKind of
      True:
        begin
          if lIndex > 0 then
            chklst1.Items.Exchange(lIndex, lIndex - 1)
          else
          begin
            if MessageDlg('Переместить на последнюю?', mtConfirmation, [mbYes,
              mbNO], 0) = mrYes then
            begin
              chklst1.Items.Move(lIndex, chklst1.Count - 1);
              chklst1.ItemIndex := chklst1.Count - 1;
            end;
          end;
        end;
      False:
        begin
          if lIndex < chklst1.Count - 1 then
            chklst1.Items.Exchange(lIndex, lIndex + 1)
          else
          begin
            if MessageDlg('Переместить на первую?', mtConfirmation, [mbYes,
              mbNO], 0) = mrYes then
            begin
              chklst1.Items.Move(lIndex, 0);
              chklst1.ItemIndex := 0;
            end;
          end;
        end;
    end;
  end;
end;

procedure TPasteMSO.btnUpClick(Sender: TObject);
begin
  DoMoveListItem(chklst1, True);
  SetStrngrdHead;
end;

//function Find

function TPasteMSO.GridVerification(const ShowStop: Boolean = False): Boolean;
var
  i, j, n: Integer;
  s: string;
begin
  Result := True;
  if TestMethods.Count > 0 then
  begin
    {   for i := 0 to TestMethods.Count do
         if TTestElement(TestMethods.Items[i]).FFieldName = chklst1.ite}
    i := 0;
    while (i < strngrd1.ColCount) and (Result = True) do
    begin
      n := GetTestNum(TestMethods, chklst1.Items.Values[strngrd1.Cells[i, 0]]);
      if n > -1 then
      begin
        j := 1;
        while (j < strngrd1.RowCount) and (Result = True) do
        begin
          s := strngrd1.Cells[i, j];
          Result := TTestElement(TestMethods.Items[n]).CheckItem(s);
          strngrd1.Cells[i, j] := s;
          inc(j);
        end;
      end;
      inc(i);
    end;
    if (Result = False) and (ShowStop = True) then
    begin
      dec(i);
      Dec(j);
      strngrd1.Selection := TGridRect(rect(i, j, i, j));
      ShowMessage('Неверное значение!'#10#13#10#13'Столбец: ' + inttostr(i + 1) +
        #10#13'Строка: ' + inttostr(j + 1) + #10#13'Значение: "' +
        strngrd1.Cells[i, j] + '"');
        
      SAVLib.MemoLineSelect(mmo1, j - 1);
    end;
  end;

end;

procedure TPasteMSO.btnDownClick(Sender: TObject);
begin
  DoMoveListItem(chklst1, False);
  SetStrngrdHead;
end;

procedure TPasteMSO.FieldOptVisible(const Showing: Boolean = True);
begin
  edtFieldOpt.Visible := Showing;
  lstFieldOpt.Visible := Showing;
  btnAddOpt.Visible := Showing;
  btnDeleteOpt.Visible := Showing;
  chklst1.Visible := not (Showing);
  btnUp.Visible := not (Showing);
  btnDown.Visible := not (Showing);
  btnEmpty.Visible := not (Showing);
  if Showing then
  begin
    lstFieldOpt.Clear;
    FieldOptIni.ReadSection(PasteMSO.Indication, lstFieldOpt.Items);
  end;
end;

function TPasteMSO.FillCheckList(t: TTable; ImportantFields, IgnoredFields:
  TStringList): Boolean;
var
  i: Integer;
  s: string;
begin
  Result := False;
  if t.Active then
  begin
    chklst1.Clear;
    for i := 0 to t.FieldList.Count - 1 do
      if (not (t.FieldList.Fields[i].ReadOnly)) and
        (t.FieldList.Fields[i].Visible) and
        (IgnoredFields.IndexOf(t.FieldList.Fields[i].FieldName) = -1) then
      begin
        if ImportantFields.IndexOf(t.FieldList.Fields[i].FieldName) > -1 then
          s := '*'
        else
          s := '';
        chklst1.Items.Add(s + t.FieldList.Fields[i].DisplayLabel + '=' +
          t.FieldList.Fields[i].FieldName);
      end;
    //  PasteMSO.TableName := t.TableName;
    Result := (chklst1.Count > 0);
  end;
end;

procedure TPasteMSO.SetStrngrdHead;
var
  i, j: Integer;
begin
  j := 0;
  ShowFields.Clear;
  strngrd1.FixedRows := 0;
  strngrd1.ColCount := 0;
  for i := 0 to chklst1.Count - 1 do
  begin
    if chklst1.Checked[i] then
    begin
      strngrd1.ColCount := j + 1;
      strngrd1.Cells[j, 0] := chklst1.Items.Names[i];
      Inc(j);
    end;
  end;
  // strngrd1.RowCount := 5;
  if strngrd1.RowCount > 1 then
    strngrd1.FixedRows := 1;

end;

procedure TPasteMSO.FillListOpt;
begin

end;

procedure GetValueListFromCheckList(Source: TCheckListBox; Dest: TStrings;
  const
  IgnoreString: string = '');
var
  i: Integer;
begin
  for i := 0 to Source.Count - 1 do
    if (Source.Checked[i]) and (Source.Items.ValueFromIndex[i] <> IgnoreString)
      then
      Dest.Add(Source.Items.ValueFromIndex[i]);
end;

procedure TPasteMSO.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TPasteMSO.chklst1ClickCheck(Sender: TObject);
begin
  SetStrngrdHead;
end;

procedure ClearSpaceFromList(list: TStrings);
var
  i, n: Integer;
begin
  n := list.Count;
  i := 0;
  while i < n do
  begin
    if Trim(list[i]) = '' then
    begin
      list.Delete(i);
      Dec(n);
    end
    else
      inc(i);
  end;
end;

procedure StringGrid2Table(Table: TDataSet; FieldList: TStrings; StringGrid:
  TStringGrid; const FromRow: Integer = 0; const FromCol: Integer = 0);
var
  i, j, jj, n: Integer;
begin
  n := StringGrid.ColCount - FromCol;
  for i := FromRow to StringGrid.RowCount - 1 do
  begin
    Table.Append;
    j := 0;
    jj := 0;
    while (j < n) and (jj < FieldList.Count) do
    begin
      if StringGrid.Cells[j + FromCol, 0] <> rsClearColumn then
        // !!! оптимизировать параметром сделать !!!
      begin
        Table.FieldByName(FieldList[jj]).AsString := StringGrid.Cells[j +
          FromCol, i];
        inc(jj);
      end;
      Inc(j);
    end;
    Table.Post;
  end;
end;

function StringGrid2DbGridSelected(DBGrid: TDBGrid; FieldList: TStrings;
  StringGrid: TStringGrid; const FromRow: Integer = 0; const FromCol: Integer
  =
  0): integer;
var
  i, j, jj, n, x: Integer;
begin
  //n := IfThen(FieldList.count>(StringGrid.ColCount - FromCol), StringGrid.ColCount - FromCol, FieldList.count) - 1;
  n := StringGrid.ColCount - FromCol;
  x := IfThen((StringGrid.RowCount - FromRow) > DBGrid.SelectedRows.Count,
    DBGrid.SelectedRows.Count, StringGrid.RowCount - FromRow) - 1;
  for i := 0 to x do
  begin
    DBGrid.DataSource.DataSet.GotoBookmark(pointer(DBGrid.SelectedRows.Items[i]));
    //
    DBGrid.DataSource.DataSet.Edit;
    j := 0;
    jj := 0;
    while (j < n) and (jj < FieldList.Count) do
    begin
      if StringGrid.Cells[j + FromCol, 0] <> rsClearColumn then
        // !!! оптимизировать параметром сделать !!!
      begin
        DBGrid.DataSource.DataSet.FieldByName(FieldList[jj]).AsString :=
          StringGrid.Cells[j + FromCol, i];
        inc(jj);
      end;
      Inc(j);
    end;
    DBGrid.DataSource.DataSet.Post;
    //
   { for j := 0 to n do
      DBGrid.DataSource.DataSet.FieldByName(FieldList[j]).AsString :=
        StringGrid.Cells[j + FromCol, i + FromRow];}
  end;
  Inc(x);
  Result := x;
end;

procedure List2StringGrid(SourceList: TStrings; TargetGrid: TStringGrid; const
  FromRow: integer = 0; const Delimiter: string = #9; const FillString: string
  =
  '');
var
  i, j: Integer;
  List, RowList: TStringList;

begin
  List := TStringList.Create;
  RowList := TStringList.Create;
  List.Assign(SourceList);
  ClearSpaceFromList(List);
  TargetGrid.RowCount := FromRow + List.Count;
  for i := 0 to List.Count - 1 do
  begin
    RowList.Clear;
    RowList.Text := stringReplace(List[i], Delimiter, #13#10, [rfReplaceAll]);
    for j := 0 to TargetGrid.ColCount - 1 do
    begin
      if j < RowList.Count then
        TargetGrid.Cells[j, i + FromRow] := RowList[j]
      else
        TargetGrid.Cells[j, i + FromRow] := FillString;
    end;
  end;
  FreeAndNil(List);
  FreeAndNil(RowList);
end;

procedure TPasteMSO.FormResize(Sender: TObject);
begin
  if Width < 350 then
    Width := 350;
  if Height < 450 then
    Height := 450;
end;

procedure TPasteMSO.PasteToGrid(TargetTable: TDataSet; TargetGrid: TDBGrid);
var
  list: TStringList;
begin
  list := TStringList.Create;
  GetValueListFromCheckList(PasteMSO.chklst1, list, rsClearSign);
  case PasteMSO.rg1.ItemIndex of
    0: PasteFromMSO.StringGrid2Table(TargetTable, list, PasteMSO.strngrd1, 1);
    1: PasteFromMSO.StringGrid2DbGridSelected(TargetGrid, list,
        PasteMSO.strngrd1, 1);
  end;
  FreeAndNil(list);
end;

procedure TPasteMSO.btnTestClick(Sender: TObject);
begin
  //  ClearSpaceFromList(mmo1.Lines);
  List2StringGrid(mmo1.Lines, strngrd1, 1, edtDelimiter.Text);
  if strngrd1.RowCount > 1 then
    strngrd1.FixedRows := 1;
  Application.ProcessMessages;
  btnPaste.Enabled := GridVerification(True);
end;

procedure TPasteMSO.FormCreate(Sender: TObject);
begin
  edtDelimiter.Text := #9;
  ShowFields := TStringList.Create;
end;

procedure TPasteMSO.btnTabClick(Sender: TObject);
begin
  edtDelimiter.Text := #9;
end;

procedure TPasteMSO.btnEmptyClick(Sender: TObject);
begin
  chklst1.Items.Add(rsClearColumn + '=' + rsClearSign);
end;

procedure TPasteMSO.mmo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = ord('A')) and (ssCtrl in Shift)) then
    mmo1.SelectAll;
end;

procedure TPasteMSO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  btnPaste.Enabled := False;
  try
    FieldOptIni.UpdateFile
  finally
    FreeAndNil(FieldOptIni);
  end;
end;

procedure TPasteMSO.chklst1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  (Control as TCheckListBox).Canvas.TextRect(Rect, Rect.Left, Rect.Top,
    (Control
    as TCheckListBox).Items.Names[index]);
end;

procedure TPasteMSO.btnDeleteOptClick(Sender: TObject);

begin
  if lstFieldOpt.ItemIndex > -1 then
  begin
    FieldOptIni.DeleteKey(Indication,
      lstFieldOpt.Items[lstFieldOpt.ItemIndex]);
    lstFieldOpt.Items.Delete(lstFieldOpt.ItemIndex);
  end;
end;

procedure TPasteMSO.btnChkOptClick(Sender: TObject);
begin
  FieldOptVisible(not (edtFieldOpt.Visible));
end;

procedure TPasteMSO.btnAddOptClick(Sender: TObject);
begin
  if edtFieldOpt.Text <> '' then
  begin
    lstFieldOpt.Items.Add(edtFieldOpt.Text);
    FieldOptIni.WriteString(PasteMSO.Indication, edtFieldOpt.Text,
      CheckList2String(chklst1));
  end;
end;

function TPasteMSO.CheckCell(const FieldLabel: string; var CellItem: string):
  Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 0 to TestMethods.Count - 1 do
    if TTestElement(TestMethods.Items[i]).FieldName =
      chklst1.Items.Values[FieldLabel] then
      Result := TTestElement(TestMethods.Items[i]).CheckItem(CellItem);
end;

procedure TPasteMSO.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ShowFields);
end;

procedure TPasteMSO.lstFieldOptMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  Index: Integer;
begin
  Index := lstFieldOpt.ItemAtPos(Point(X, Y), true);
  if (Index > -1) and (Index <> FOldIndex) then
  begin
    lstFieldOpt.Hint := lstFieldOpt.Items[Index];
    Application.ActivateHint(Mouse.CursorPos);
  end
  else
    lstFieldOpt.Hint := '';
  FOldIndex := Index;
end;

procedure TPasteMSO.rg1Click(Sender: TObject);
begin
  case rg1.ItemIndex of
    0: btnPaste.Caption := 'Добавить';
    1: btnPaste.Caption := 'Заменить';
  end;
end;

procedure TPasteMSO.chklst1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source = chklst1;
end;

procedure TPasteMSO.chklst1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  Value: Integer;
begin
  if Sender = chklst1 then
  begin
    Value := chklst1.ItemAtPos(Point(x, y), True);

    if Value = -1 then
    begin
      chklst1.Items.Add(chklst1.Items[chklst1.ItemIndex]);
      chklst1.Items.Delete(chklst1.ItemIndex);
    end
    else
    begin
      chklst1.Items.Insert(Value {+ 1}, chklst1.Items[chklst1.ItemIndex]);
      chklst1.Items.Delete(chklst1.ItemIndex);
    end;
  end;
end;

procedure TPasteMSO.lstFieldOptDblClick(Sender: TObject);
begin
  String2CheckList(FieldOptIni.ReadString(PasteMSO.Indication,
    lstFieldOpt.Items[lstFieldOpt.itemindex], ''), chklst1);
  SetStrngrdHead;
  FieldOptVisible(False);
end;

end.

