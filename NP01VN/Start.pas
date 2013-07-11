unit Start;
{ TODO : Сделать показ данных в столбцах по месяцам в хинтах если много символов? }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls,
  TMClass, ComCtrls, Buttons, Index, Mask, Spin, Menus, StdActns, ActnList,
  ExtCtrls;

type
  TFormEdit = class(TForm)
    ListBoxTM: TListBox;
    Label1: TLabel;
    QueryTM: TQuery;
    EditZeh: TEdit;
    Label2: TLabel;
    ButtonTM: TButton;
    Table1: TTable;
    DBGrid1: TDBGrid;
    MemoTitle: TMemo;
    BitBtn1: TBitBtn;
    Table1Num: TAutoIncField;
    Table1Kod: TIntegerField;
    Table1Chert: TStringField;
    Table1Kol: TIntegerField;
    Table1Kol1: TIntegerField;
    Table1Kol2: TIntegerField;
    Table1Kol3: TIntegerField;
    Table1TM1: TStringField;
    Table1TM2: TStringField;
    Table1TM3: TStringField;
    Table1TM4: TStringField;
    Table1TM5: TStringField;
    Table1TM6: TStringField;
    Table1TM7: TStringField;
    Table1TM8: TStringField;
    Table1TM9: TStringField;
    Table1TM10: TStringField;
    Table1Primech: TStringField;
    ComboBoxName: TComboBox;
    ComboBoxQuarter: TComboBox;
    ComboBoxPrim: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LabelWait: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    ButtonSortNum: TButton;
    ButtonSortKod: TButton;
    EditMarsh: TEdit;
    EditPrim: TEdit;
    BitBtnUndo: TBitBtn;
    DataSource1: TDataSource;
    ButtonCopy: TButton;
    ButtonPaste: TButton;
    Table1TM11: TStringField;
    Table1TM12: TStringField;
    intgrfldTable1Kol1_v: TIntegerField;
    intgrfldTable1Kol2_v: TIntegerField;
    intgrfldTable1Kol3_v: TIntegerField;
    txt1: TStaticText;
    txt2: TStaticText;
    txt3: TStaticText;
    intgrfldTable1Kol_1: TIntegerField;
    txt4: TStaticText;
    txt5: TStaticText;
    txt6: TStaticText;
    txt7: TStaticText;
    txt8: TStaticText;
    txt9: TStaticText;
    txt10: TStaticText;
    txt11: TStaticText;
    txt12: TStaticText;
    txt13: TStaticText;
    txt14: TStaticText;
    grp1: TGroupBox;
    strngrd1: TStringGrid;
    lbl1: TLabel;
    btn1: TButton;
    lbl2: TLabel;
    btn2: TButton;
    medt1: TMaskEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    btn3: TSpeedButton;
    se1: TSpinEdit;
    txt15: TStaticText;
    lblRecCount: TLabel;
    btn4: TButton;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    lblChertTitle: TLabel;
    N10: TMenuItem;
    N11: TMenuItem;
    actlst1: TActionList;
    edtcpy1: TEditCopy;
    edtct1: TEditCut;
    edtpst1: TEditPaste;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    btnSave: TBitBtn;
    tmr1: TTimer;
    strngfldTable1TM13: TStringField;
    strngfldTable1TM14: TStringField;
    strngfldTable1TM15: TStringField;
    strngfldTable1TM16: TStringField;
    strngfldTable1TM17: TStringField;
    strngfldTable1TM18: TStringField;
    strngfldTable1TM19: TStringField;
    strngfldTable1TM20: TStringField;
    strngfldTable1TM21: TStringField;
    strngfldTable1TM22: TStringField;
    strngfldTable1TM23: TStringField;
    strngfldTable1TM24: TStringField;
    btn5: TButton;
    btn6: TBitBtn;
    procedure ListBoxTMDblClick(Sender: TObject);
    procedure ButtonTMClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditZehKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBoxTMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ComboBoxNameSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxQuarterSelect(Sender: TObject);
    procedure ComboBoxPrimSelect(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function OpenTable(_Rec: TRecord): boolean;
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure ButtonSortClick(Sender: TObject);
    procedure ButtonCopyClick(Sender: TObject);
    procedure ButtonPasteClick(Sender: TObject);
    procedure Table1ChertSetText(Sender: TField; const Text: string);
    procedure btn1Click(Sender: TObject);
    procedure SetMonthCaption(const iii: Integer);
    function CreateNewTable(NewTable: TTable): Boolean;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure se1Exit(Sender: TObject);
    procedure Table1BeforeInsert(DataSet: TDataSet);
    procedure btn4Click(Sender: TObject);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1AfterDelete(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
  private
    procedure DoQuery(TM1: string; Chert: string);
    procedure EnableListBox;
    procedure SetIndex(_Sort: Integer);
    procedure CreateIndex;
    procedure TableSave;

  public
    { Public declarations }
  end;

var
  FormEdit: TFormEdit;
  StrZeh: string;
  CurName, CurQuarter: Integer;
  CurPrim: Integer = -1;
  TMTableName: string;
  // хранит полный путь до pl01, из pl01 выбираются уникальные маршруты
  Quarters: array[1..4] of string[20] = ('1 кв.', '2 кв.', '3 кв.', '4 кв.');
  Sort: Integer;
  bMask: Boolean = True;
  kod2Quart, kod2Month, kod2Type: Integer;
procedure FillPrim(Table1: TTable);

implementation

uses Main, ClipB, KoaUtils, NewString, Math, Constants, PasteFromMSO, SAVLib,
  SAVLib_DB, ShellAPI;

{$R *.dfm}

var
  TMAr: TMArray;
  sPrevPrim, FormCapt: string; //примечание предыдущ записи

procedure TFormEdit.SetMonthCaption(const iii: Integer);
begin
  txt1.Caption := SysUtils.LongMonthNames[(iii - 1) * 3 + 1];
  txt2.Caption := SysUtils.LongMonthNames[(iii - 1) * 3 + 2];
  txt3.Caption := SysUtils.LongMonthNames[(iii - 1) * 3 + 3];
end;

function TFormEdit.CreateNewTable(NewTable: TTable): Boolean;
var
  i: Integer;
begin
  if FileExists(NewTable.DatabaseName + '\' + NewTable.TableName) then
    fDeleteFile(NewTable.DatabaseName + '\' + NewTable.TableName);
  with NewTable do
    try
      with FieldDefs do
      begin
        Clear;
        with AddFieldDef do
        begin
          Name := 'Num';
          DataType := ftAutoInc;
          Required := True;
        end;
        with AddFieldDef do
        begin
          Name := 'Kod';
          DataType := ftInteger;
        end;
        with AddFieldDef do
        begin
          Name := 'Chert';
          DataType := ftString;
          Size := 13;
        end;
        with AddFieldDef do
        begin
          Name := 'Kol';
          DataType := ftInteger;
        end;
        with AddFieldDef do
        begin
          Name := 'Kol1';
          DataType := ftInteger;
        end;
        with AddFieldDef do
        begin
          Name := 'Kol2';
          DataType := ftInteger;
        end;
        with AddFieldDef do
        begin
          Name := 'Kol3';
          DataType := ftInteger;
        end;
        for i := 1 to 24 do //24 тех маршр
          with AddFieldDef do
          begin
            Name := 'TM' + inttostr(i);
            DataType := ftString;
            Size := 2;
          end;
        with AddFieldDef do
        begin
          Name := 'Primech';
          DataType := ftString;
          Size := 255;
        end;
        // поля для кол-ва машин
        with AddFieldDef do
        begin
          Name := 'Kol1_v';
          DataType := ftInteger;
        end;
        with AddFieldDef do
        begin
          Name := 'Kol2_v';
          DataType := ftInteger;
        end;
        with AddFieldDef do
        begin
          Name := 'Kol3_v';
          DataType := ftInteger;
        end;
        // поля для кол-ва на 1 машину
        with AddFieldDef do
        begin
          Name := 'Kol_1';
          DataType := ftInteger;
        end;
      end;
      with IndexDefs do
      begin
        Clear;
        with AddIndexDef do
        begin
          Name := '';
          Fields := 'Num';
          Options := [ixPrimary];
        end;
        //////////////////////////////////////////////////
        with AddIndexDef do
        begin
          Name := 'NP01VN_Kod';
          Fields := 'Kod';
          Options := [ixCaseInsensitive];
        end;
        //////////////////////////////////////////////////
      end;
      CreateTable;
      Result := True;
    except
      Close;
      DeleteTable;
      Result := False;
    end;
end;

{
Заполнение пустых примечаний строкой: "-
}

procedure FillPrim(Table1: TTable);
begin
  with Table1 do
  begin
    if (not Active) then
      Open;
    First;
    while not Eof do
    begin
      Edit;
      if (FieldByName('Primech').Value = Null) then
        FieldByName('Primech').Value := '"-';
      Post;
      Next;
    end;
  end;
end;

function TFormEdit.OpenTable(_Rec: TRecord): boolean;
var
  quer_1: TQuery;
begin

  try
    with Table1 do
    begin
      Active := False;
      TableType := ttParadox;
      TableName := 'NP01F' + IntToStr(_Rec.Digit) + '.db';
      DatabaseName := StartDir + Workname_2 + '\';

      if not FileExists(Table1.DatabaseName + Table1.TableName)
        or (Form1.TableFieldTest(Table1, csField_Chert) =
        False) then
      begin
        // может быть тут напутал... :-(   ???
        if Table1.ReadOnly or not CreateNewTable(Table1) then
        begin
          Result := False;
          Exit;
        end
      end
      else
      begin // создание индексов
        if Form1.TableFieldTest(Table1, 'TM13') = False then
        begin
          // добавление полей
          quer_1 := TQuery.Create(Self);
          quer_1.SQL.Text :=
            'alter table "' + Table1.DatabaseName + Table1.TableName
            + '" add TM13 char(2), add TM14 char(2), add TM15 char(2),'
            + ' add TM16 char(2), add TM17 char(2), add TM18 char(2), add TM19 char(2),'
            + ' add TM20 char(2), add TM21 char(2), add TM22 char(2), add TM23 char(2),'
            + ' add TM24 char(2)';
          quer_1.ExecSQL;
          FreeAndNil(quer_1);
        end;
        if not Table1.ReadOnly then
          CreateIndex;
      end;
      if not Table1.ReadOnly then
      begin
        Sort := _Rec.Sort;
        SetIndex(Sort);
        FillPrim(Table1);
      end
      else
        Table1.Active := True;
    end;
    Result := True;
  except
    if Table1.Active = True then
      Table1.Close;
    Table1.Exclusive := False;
    Result := False;
  end;
end;

procedure TFormEdit.CreateIndex();
var
  NumIndex: Integer;
begin
  with Table1 do
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

      AddIndex('NP01VN_Kod', 'Kod', [ixCaseInsensitive]);

      Close;
      Exclusive := False;
    end;
  end;
end;

procedure TFormEdit.SetIndex(_Sort: Integer);
var
  bActive: Boolean;
  IndexNames1: TStringList;
  iKod, iNum: Integer;
begin
  IndexNames1 := TStringList.Create;
  { DONE : Добавить поиск по индексам }
  if (Table1.Active) then
  begin
    if (Table1.State <> dsBrowse) then
      Table1.Post;
    iNum := Table1.FieldByName('Num').AsInteger;
    iKod := Table1.FieldByName('Kod').AsInteger;
  end;
  bActive := Table1.Active;
  if bActive then
    Table1.Active := False;
  Table1.Exclusive := True;
  Table1.Active := True;
  Sort := _Sort;
  Table1.GetIndexNames(IndexNames1);
  if (Sort = 0) then
  begin
    Table1.IndexName := '';
    ButtonSortNum.Enabled := False;
    ButtonSortKod.Enabled := True;
  end
  else
  begin
    Table1.IndexName := IndexNames1[Sort - 1];
    ButtonSortNum.Enabled := True;
    ButtonSortKod.Enabled := False;
  end;
  Table1.Active := False;
  Table1.Exclusive := False;
  if (bActive) then
  begin
    Table1.Open;
    if (Sort = 0) then
      Table1.Locate('Num', iNum, [])
    else
      Table1.Locate('Kod', iKod, []);
  end;
  FreeAndNil(IndexNames1);
end;

procedure TFormEdit.FormShow(Sender: TObject);
var
  I, J: Integer;
begin
  if OpenTable(CurRec) then
  begin
    { DONE : Установить при открытии на последнюю позицию }
    if Table1.Active = False then
      Table1.Active := True;
    bMask := True;
    if (Index.FormIndex.lbl1.Visible = False) or (index.ShowOld) then
    begin
      DBGrid1.Fields[2].EditMask := '000\ 000000\ 00;1; ';
      DBGrid1.Columns.Items[2].Title.Caption := 'Чертеж';
    end;
    EditMarsh.Text := CurRec.Marsh;
    EditPrim.Text := CurRec.Prim;
    QueryTM.DatabaseName := StartDir + Workname_2 + '\';
    LabelWait.Caption := '';
    EditZeh.Clear;
    ListBoxTM.Clear;
    txt4.Caption := 'Кол-во'#13'на 1'#13'машину';
    txt11.Caption := 'Все-'#13'го';
    with ComboBoxQuarter do
    begin
      Clear;
      for I := 1 to Quarter do
        Items.Add(Quarters[I]);
    end;
    Index.FormIndex.GetFromKod2(kod2, kod2Quart, kod2Month, kod2Type);
    case NewString.Kod of
      1:
        begin

          SetMonthCaption(kod2Quart);
        end;
      6:
        begin
          case kod2Type of
            1:
              begin // тек квартал
                case kod2Month of
                  2:
                    begin
                      DBGrid1.Columns[4].ReadOnly := True;
                      DBGrid1.Columns[5].ReadOnly := True;
                    end;
                  3:
                    begin
                      DBGrid1.Columns[4].ReadOnly := True;
                      DBGrid1.Columns[5].ReadOnly := True;
                      DBGrid1.Columns[6].ReadOnly := True;
                      DBGrid1.Columns[7].ReadOnly := True;
                    end;
                end;
              end;
            2:
              begin // будущий квартал
                if kod2Month <> 3 then
                begin
                  DBGrid1.Columns[4].ReadOnly := True;
                  DBGrid1.Columns[5].ReadOnly := True;
                  DBGrid1.Columns[6].ReadOnly := True;
                  DBGrid1.Columns[7].ReadOnly := True;
                  DBGrid1.Columns[8].ReadOnly := True;
                  DBGrid1.Columns[9].ReadOnly := True;
                  ShowMessage('Планировать будущий квартал можно только в последнем месяце текущего!');
                end;
              end;
          end;
          SetMonthCaption(kod2Quart);
        end;
      7:
        begin
          case kod2Type of
            1:
              begin // тек квартал
                case kod2Month of
                  2:
                    begin
                      DBGrid1.Columns[4].ReadOnly := True;
                      DBGrid1.Columns[5].ReadOnly := True;
                    end;
                  3:
                    begin
                      DBGrid1.Columns[4].ReadOnly := True;
                      DBGrid1.Columns[5].ReadOnly := True;
                      DBGrid1.Columns[6].ReadOnly := True;
                      DBGrid1.Columns[7].ReadOnly := True;
                    end;
                end;
              end;
            2:
              begin // будущий квартал
                if kod2Month <> 3 then
                begin
                  DBGrid1.Columns[4].ReadOnly := True;
                  DBGrid1.Columns[5].ReadOnly := True;
                  DBGrid1.Columns[6].ReadOnly := True;
                  DBGrid1.Columns[7].ReadOnly := True;
                  DBGrid1.Columns[8].ReadOnly := True;
                  DBGrid1.Columns[9].ReadOnly := True;
                  ShowMessage('Планировать будущий квартал можно только в последнем месяце текущего!');
                end;
              end;
          end;
          SetMonthCaption(kod2Quart);
        end;
      8:
        begin
          j := kod2Month;
          if kod2Type = 2 then
          begin
            if j < 3 then
              Inc(j)
            else
            begin
              j := 1;
              if kod2Quart = 4 then
                kod2Quart := 1
              else
                Inc(kod2Quart);
            end
          end;
          i := 4;
          while i < 9 do
          begin
            DBGrid1.Columns[i].ReadOnly := True;
            DBGrid1.Columns[i + 1].ReadOnly := True;
            inc(i, 2);
          end;
          i := j * 2;
          DBGrid1.Columns[i + 2].ReadOnly := False;
          DBGrid1.Columns[i + 3].ReadOnly := False;
          SetMonthCaption(kod2Quart);
        end;
    end;
    strngrd1.Cells[0, 0] := 'Код';
    strngrd1.Cells[1, 0] := 'Кол-во на изд.';
    strngrd1.Cells[5, 0] := 'Всего';
    Table1.Last;
    lblRecCount.Caption := IntToStr(DataSource1.DataSet.RecordCount);
    FormCapt := FormEdit.Caption;
    tmr1.Interval := 1000 * iAutoSaveSec;
    tmr1.Enabled := (not (Table1.ReadOnly)) and (bAutoSave);
    FormEdit.Caption := FormCapt + '     Открыто в ' + TimeToStr(Time);
  end
  else
    ShowMessage('Таблица не обнаружена в сетевом хранилище!');
  MemoTitle.Text := CurRec.Title;
end;

{
Поиск уникальных маршрутов по чертежу [и цеху]
и заполнение им ListBox
}

procedure TFormEdit.DoQuery(TM1: string; Chert: string);
var
  I: Integer;
begin
  LabelWait.Caption := 'Подождите...';
  LabelWait.Update;

  QueryTM.SQL.Text := 'select distinct tm from "' + TMTableName + '"';
  case CurName of
    0: QueryTM.SQL.Add('where (chert="' + Chert + '")');
    1: QueryTM.SQL.Add('where (chertd="' + Chert + '")');
  end;
  if (TM1 <> '') then
    QueryTM.SQL.Add('and (tm like ''%' + TM1 + '%'')');
  QueryTM.Open;
  ListBoxTM.Clear;
  if (not QueryTM.IsEmpty) then
  begin
    TM.ClearTM(TMAr);
    with QueryTM do
    begin
      SetLength(TMAr, RecordCount);
      I := 0;
      First;
      while not EOF do
      begin // заполнение массива маршрутов
        TMAr[I] := TM.Create(FieldByName('TM').AsString);
        Next;
        I := I + 1;
      end;
    end;
    for I := 0 to Length(TMAr) - 1 do
    begin // из массива маршрутов заполнение ListBox
      if (TM1 = '') then
        ListBoxTM.AddItem(TMAr[I].Text, TMAr[I])
      else if TMAr[I].IsIn(TM1) > 0 then
        ListBoxTM.AddItem(TMAr[I].Text, TMAr[I]);
    end;
  end;
  LabelWait.Caption := 'Готово';
  LabelWait.Update;
end;

{
Заполнение полей TMn на основе анализа связанных с ListBox объектов маршрутов
}

procedure TFormEdit.ListBoxTMDblClick(Sender: TObject);
var
  SelInd, I: Integer;
  MyTM: TM;
  FieldName: string[20];
  SubTM: string;
begin
  with ListBoxTM do
  begin
    SelInd := ItemIndex;
    if (SelInd = -1) then
      exit;
    MyTM := TM(Items.Objects[SelInd]);
    if (StrZeh <> '') then
      SubTM := MyTM.SubTM(StrZeh)
    else
      SubTM := MyTM.Text;
    if (Table1.State <> dsEdit) then
      Table1.Edit;
    for I := 1 to 24 do
      Table1.FieldByName('TM' + IntToStr(I)).Clear;
    for I := 0 to ((Length(SubTM) + 1) div 3) - 1 do
    begin
      FieldName := 'TM' + IntToStr(I + 1);
      Table1.FieldByName(FieldName).AsString := Copy(SubTM, I * 3 + 1, 2);
    end;
    Table1.Post;
  end;
  // FreeAndNil(MyTM);
end;

{
Кнопка "Найти маршруты"
}

procedure TFormEdit.ButtonTMClick(Sender: TObject);
begin
  ButtonTM.Enabled := False;
  StrZeh := EditZeh.Text;
  try
    if (StrZeh <> '') then
    begin
      StrZeh := TM.FormZeh(StrZeh);
    end
  except
    StrZeh := '';
  end;
  DoQuery(StrZeh, Table1.FieldByName('chert').AsString);
  ButtonTM.Enabled := True;
end;

procedure TFormEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Table1.ReadOnly = False then
  begin
    tmr1.Enabled := False;
    if (Table1.State <> dsBrowse) then
      Table1.Post;

    if MemoTitle.Text = '' then
    begin
      ShowMessage('Введите название таблицы');
      MemoTitle.SetFocus();
      Action := caNone;
      Exit;
    end;
    CurRec.Title := MemoTitle.Text;
    CurRec.Sort := Sort;
    CurRec.Marsh := EditMarsh.Text;
    CurRec.Prim := EditPrim.Text;
  end;
  TM.ClearTM(TMAr);
  Table1.Close;
  QueryTM.Active := False;

end;

procedure TFormEdit.EditZehKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    ButtonTM.Click;
end;

procedure TFormEdit.ListBoxTMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    ListBoxTMDblClick(Sender);
end;

procedure TFormEdit.DataSource1DataChange(Sender: TObject; Field: TField);
var
  FieldName, sI: string;
  Sum: Integer;
  i: Integer;
begin
  lblChertTitle.Caption :=
    FormIndex.GetChertTitle(DBGrid1.DataSource.DataSet.FieldByName('Chert').AsString);
  if (Field = nil) then
    exit;
  FieldName := Field.FieldName;
  if ((FieldName = 'Kol1') or (FieldName = 'Kol2') or (FieldName = 'Kol3'))
    and (Table1.State <> dsBrowse) then
  begin
    Sum := Table1.FieldByName('Kol1').AsInteger +
      Table1.FieldByName('Kol2').AsInteger +
      Table1.FieldByName('Kol3').AsInteger;
    if (Sum = 0) then
      Table1.FieldByName('Kol').AsString := ''
    else
      Table1.FieldByName('Kol').AsInteger := Sum;
  end;
  if ((FieldName = 'Kol1_v') or (FieldName = 'Kol2_v') or (FieldName = 'Kol3_v')
    or (FieldName = 'Kol_1')) then
  begin
    if (DBGrid1.DataSource.DataSet.FieldByName('Kol_1').AsInteger <> null) and
      (DBGrid1.DataSource.DataSet.FieldByName('Kol_1').AsInteger <> 0) then
      for i := 1 to 3 do
      begin
        sI := IntToStr(i);
        if DBGrid1.Columns[2 + i * 2].ReadOnly = False then
        begin
          if (DBGrid1.DataSource.DataSet.FieldByName('Kol' + sI + '_v').AsInteger
            = 0) or (DBGrid1.DataSource.DataSet.FieldByName('Kol' + sI +
            '_v').AsInteger = null) then
            DBGrid1.DataSource.DataSet.FieldByName('Kol' + sI).AsString := ''
          else
            DBGrid1.DataSource.DataSet.FieldByName('Kol' + sI).AsInteger :=
              DBGrid1.DataSource.DataSet.FieldByName('Kol' + sI + '_v').AsInteger
              * DBGrid1.DataSource.DataSet.FieldByName('Kol_1').AsInteger;
        end;
      end;
  end;
  lblRecCount.Caption := IntToStr(DataSource1.DataSet.RecordCount);
end;

procedure TFormEdit.EnableListBox;
begin
  case CurName of
    0:
      begin // подетальный план на квартал
        ComboBoxPrim.ItemIndex := -1;
        ComboBoxPrim.Enabled := False;
        ComboBoxQuarter.ItemIndex := Quarter - 1;
        ComboBoxQuarter.Enabled := True;
        btn1.Enabled := True;
        CurQuarter := Quarter - 1;
        TMTableName := PLTables[Quarter - 1];
      end;
    1:
      begin
        ComboBoxQuarter.ItemIndex := -1;
        ComboBoxQuarter.Enabled := False;
        btn1.Enabled := False;
        ComboBoxPrim.Enabled := True;
        ComboBoxPrim.ItemIndex := 0;
        TMTableName := NSTables[1];
      end;
  end;
end;

procedure TFormEdit.ComboBoxNameSelect(Sender: TObject);
var
  Index: Integer;
begin
  ButtonTM.Enabled := True;
  Index := TComboBox(Sender).ItemIndex;
  if (Index <> CurName) then
  begin
    CurName := Index;
    EnableListBox;
  end;
end;

procedure TFormEdit.ComboBoxQuarterSelect(Sender: TObject);
begin
  if (CurQuarter <> ComboBoxQuarter.ItemIndex) then
  begin
    CurQuarter := ComboBoxQuarter.ItemIndex;
    TMTableName := PLTables[CurQuarter];
  end;
end;

procedure TFormEdit.ComboBoxPrimSelect(Sender: TObject);
begin
  if (CurPrim <> ComboBoxPrim.ItemIndex) then
  begin
    CurPrim := ComboBoxPrim.ItemIndex;
    TMTableName := NSTables[CurPrim];
  end;
end;

procedure TFormEdit.FormCreate(Sender: TObject);
begin
  CurName := -1;
  CurQuarter := -1;
  CurPrim := -1;
  TMTableName := '';
  ButtonTM.Enabled := False;
  Table1.ReadOnly := Index.FormIndex.lbl1.Visible or Index.ShowOld;
  ButtonPaste.Enabled := not (Table1.ReadOnly);
  btn2.Enabled := not (Table1.ReadOnly);
  btn4.Enabled := not (Table1.ReadOnly);
  btnSave.Enabled := not (Table1.ReadOnly);
  ListBoxTM.Enabled := not (Table1.ReadOnly);
  MemoTitle.Enabled := not (Table1.ReadOnly);
  N5.Enabled := not (Table1.ReadOnly);
  N6.Enabled := not (Table1.ReadOnly);
  N7.Enabled := not (Table1.ReadOnly);
  N11.Enabled := not (Table1.ReadOnly);
  N13.Enabled := not (Table1.ReadOnly);
  N14.Enabled := not (Table1.ReadOnly);
  sPrevPrim := '';
end;

procedure TFormEdit.ButtonSortClick(Sender: TObject);
begin
  if (TButton(Sender).Name = 'ButtonSortKod') then
  begin
    SetIndex(1);
  end
  else
  begin
    SetIndex(0);
  end;
end;

procedure TFormEdit.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  b: integer;
begin
  if (Key = VK_F4) and (DBGrid1.SelectedField.Name = 'Table1Chert') then
  begin
    if (bMask) then
    begin
      DBGrid1.SelectedField.EditMask := '';
      DBGrid1.Columns.Items[2].Title.Caption := 'Чертеж/Текст';
      txt15.Visible := True;
      if ShowTips = True then
        ShowMessage('Обязательно заполните поле Итого для соответствующего месяца по строке Без позиции, чтобы система знала к какому месяц(у|ам) относится изделие(узел) Без позиций');
    end
    else
    begin
      DBGrid1.SelectedField.EditMask := '000\ 000000\ 00;1; ';
      DBGrid1.Columns.Items[2].Title.Caption := 'Чертеж';
      txt15.Visible := False;
    end;
    txt12.Caption := DBGrid1.Columns.Items[2].Title.Caption;
    bMask := not bMask;
  end
  else if Key = VK_RETURN then
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
  end
  else if key = VK_LEFT then
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

procedure TFormEdit.Table1ChertSetText(Sender: TField; const Text: string);
var
  Chert: string;
  i: integer;
begin
  Chert := Trim(Text);
  if (IsDigit(Chert[1])) then
  begin
    Chert := ExcludeSymbol(Chert, ' ');
    for i := Length(Chert) + 1 to 11 do
    begin
      Chert := Chert + '0';
    end;
    Insert(' ', Chert, 4);
    Insert(' ', Chert, 11);
  end;
  TField(Sender).AsString := Chert;
end;

procedure TFormEdit.Table1BeforePost(DataSet: TDataSet);
begin
  if Dataset.FieldByName('Primech').Value = Null then
  begin
    Dataset.FieldByName('Primech').Value := sPrevPrim;
  end;
end;

procedure TFormEdit.ButtonCopyClick(Sender: TObject);
var
  i, j: integer;
  Rows: TRows;
begin
  if DBGrid1.SelectedRows.Count > 0 then
  begin
    SetLength(Rows.DBRecAr, DBGrid1.SelectedRows.Count);
    with DBGrid1.DataSource.DataSet do
      for i := 0 to DBGrid1.SelectedRows.Count - 1 do
      begin
        GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
        Rows.DBRecAr[i].Kod := FieldByName('kod').AsInteger;
        Rows.DBRecAr[i].Chert := FieldByName('chert').AsString;
        Rows.DBRecAr[i].Kol_1 := FieldByName('Kol_1').AsInteger;
        for j := 1 to 3 do
        begin
          Rows.DBRecAr[i].Kol[j] := FieldByName('kol' + IntToStr(j)).AsInteger;
          Rows.DBRecAr[i].Kol_v[j] := FieldByName('kol' + IntToStr(j) +
            '_v').AsInteger;
        end;
        for j := 1 to 24 do
          Rows.DBRecAr[i].TM[j] := FieldByName('TM' + IntToStr(j)).AsString;
        Rows.DBRecAr[i].Primech := FieldByName('primech').AsString;
      end;
    CopyToClipboard(Rows);
  end;
end;

procedure TFormEdit.ButtonPasteClick(Sender: TObject);
var
  i, j: integer;
  Rows: TRows;
begin
  try
    Rows := LoadFromClipboard;
    if Rows.Num = 0 then
      Exit;
    with DBGrid1.DataSource.Dataset do
    begin
      for i := 0 to Rows.Num - 1 do
      begin
        Append;
        if (Rows.DBRecAr[i].Kod = 0) then
          FieldByName('kod').Value := Null
        else
          FieldByName('kod').AsInteger := Rows.DBRecAr[i].Kod;
        FieldByName('chert').AsString := Rows.DBRecAr[i].Chert;
        for j := 1 to 3 do
        begin
          if (Rows.DBRecAr[i].Kol[j] = 0) or (DBGrid1.Columns[3 + 2 *
            j].ReadOnly) then
            FieldByName('kol' + IntToStr(j)).Value := Null
          else
            FieldByName('kol' + IntToStr(j)).AsInteger :=
              Rows.DBRecAr[i].Kol[j];
          if (Rows.DBRecAr[i].Kol_v[j] = 0) or (DBGrid1.Columns[3 + 2 *
            j].ReadOnly) then
            FieldByName('kol' + IntToStr(j) + '_v').Value := Null
          else
            FieldByName('kol' + IntToStr(j) + '_v').AsInteger :=
              Rows.DBRecAr[i].Kol_v[j];
        end;
        for j := 1 to 24 do
          FieldByName('TM' + IntToStr(j)).AsString := Rows.DBRecAr[i].TM[j];
        FieldByName('primech').AsString := Rows.DBRecAr[i].Primech;
        if (Rows.DBRecAr[i].Kol_1 = 0) then
          FieldByName('kol_1').Value := Null
        else
          FieldByName('kol_1').AsInteger :=
            Rows.DBRecAr[i].Kol_1;
      end;
      Post;
    end;
  except
    ShowMessage('Исключение!');
  end;
end;

procedure TFormEdit.btn1Click(Sender: TObject);
var
  Query: TQuery;
  i, j: Integer;
  stm, skod, ssi: string;
  ssi2: TStringList;

  procedure NotFoundInPlan();
  var
    x: Byte;
  begin
    lbl2.Visible := True;
    stm := '';
    for x := 0 to 5 do
      strngrd1.Cells[x, 1] := '';
  end;
begin
  btn1.Enabled := False;
  if Table1.RecordCount > 0 then
  begin
    if (DBGrid1.DataSource.Dataset.FieldByName('Kod').AsString <> '') and
      (DBGrid1.DataSource.Dataset.FieldByName('Chert').AsString <> '') and
      (DBGrid1.DataSource.Dataset.FieldByName('tm1').AsString <> '') then
    begin
      if CurQuarter > -1 then
      begin
        lbl2.Visible := False;
        Query := TQuery.Create(nil);
        skod :=
          Index.FormIndex.Padl(DBGrid1.DataSource.Dataset.FieldByName('Kod').AsString, 4,
          '0');
        i := 2;
        stm := DBGrid1.DataSource.Dataset.FieldByName('tm1').AsString;
        while (i < 25) and (DBGrid1.DataSource.Dataset.FieldByName('tm' +
          inttostr(i)).AsString
          <> '') do
        begin
          stm := stm + DBGrid1.DataSource.Dataset.FieldByName('tm' +
            inttostr(i)).AsString;
          Inc(i);
        end;
        grp1.Caption := '';
        ssi := ChangeFileExt(TMTableName, '.si');
        if FileExists(ssi) = True then
        begin
          ssi2 := TStringList.Create;
          ssi2.LoadFromFile(ssi);
          grp1.Caption := ' План ' + ssi2.Text[24] + ' квартала 20' +
            ssi2.Text[26]
            + ssi2.Text[27];
          FreeAndNil(ssi2);
        end
        else
          grp1.Caption := ' План ' + inttostr(CurQuarter + 1) + ' квартала ' +
            inttostr(CurYear);
        strngrd1.Cells[2, 0] := SysUtils.LongMonthNames[CurQuarter * 3 + 1];
        strngrd1.Cells[3, 0] := SysUtils.LongMonthNames[CurQuarter * 3 + 2];
        strngrd1.Cells[4, 0] := SysUtils.LongMonthNames[CurQuarter * 3 + 3];
        grp1.Caption := grp1.Caption + ' Чертеж: ' +
          DBGrid1.DataSource.Dataset.FieldByName('Chert').AsString + '   ТМ: ' +
          stm + ' ';
        strngrd1.Cells[2, 1] := '0';
        strngrd1.Cells[3, 1] := '0';
        strngrd1.Cells[4, 1] := '0';
        Query.ParamCheck := False;
        Query.SQL.Text := 'select period, kol from "' + TMTableName +
          '" where (chert="' +
          DBGrid1.DataSource.Dataset.FieldByName('Chert').AsString +
          '") and (ki="'
          + skod + '") and (tm="' + stm + '")';
        try
          Query.Open;
          if Query.RecordCount = 0 then
            NotFoundInPlan
          else
          begin
            Query.First;
            while not (Query.Eof) do
            begin
              strngrd1.Cells[Query.FieldByName('Period').AsInteger + 1, 1] :=
                Query.FieldByName('Kol').AsString;
              Query.Next;
            end;
            Query.Close;
            Query.SQL.Text := 'select ki, period, kol from "' +
              PLTablesIZ[CurQuarter] + '" where ki="' + skod + '"';
            Query.Open;
            j := 0;
            stm := 'Количество изделий: ';
            if Query.RecordCount > 0 then
            begin
              if (Query.RecordCount = 1) and
                (Query.FieldByName('Period').AsString
                = '0') then
              begin
                stm := stm + ' Нет (не машина)';
                j := 1;
              end
              else
              begin
                i := 1;
                Query.First;
                while not (Query.Eof) do
                begin
                  stm := stm + inttostr(i) + 'мес=' +
                    Query.FieldByName('Kol').AsString + '  ';
                  Inc(i);
                  j := j + Query.FieldByName('Kol').AsInteger;
                  Query.Next;
                end;
              end;
              i := StrToInt(strngrd1.Cells[2, 1]) + StrToInt(strngrd1.Cells[3,
                1]) + StrToInt(strngrd1.Cells[4, 1]);
              strngrd1.Cells[5, 1] := IntToStr(i);
              if j > 0 then
                strngrd1.Cells[1, 1] := FloatToStr(RoundTo(i / j, -3));
              strngrd1.Cells[0, 1] := skod;
              lbl2.Visible := False;
            end
            else
              NotFoundInPlan;
          end;
          lbl1.Caption := stm;
        finally
          Query.Close;
          FreeAndNil(Query);
        end;
      end;
    end
    else
    begin
      stm := '';
      if DBGrid1.DataSource.Dataset.FieldByName('Kod').AsString = '' then
        stm := 'Код ';
      if DBGrid1.DataSource.Dataset.FieldByName('Chert').AsString = '' then
        stm := stm + 'Чертеж ';
      if DBGrid1.DataSource.Dataset.FieldByName('tm1').AsString = '' then
        stm := stm + 'Техмаршрут ';
      ShowMessage(stm + 'отсутствует в плане');
    end;
  end;
  btn1.Enabled := True;
end;

procedure TFormEdit.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Column.FieldName = 'Kol1') or (Column.FieldName = 'Kol2') or
    (Column.FieldName = 'Kol3') then
    //Удалите эту линию, если хотете закрасить целую линию
    if (gdFocused in State) {//имеет ли ячейка фокус? } then
      dbgrid1.canvas.brush.color := clWhite //имеет фокус
    else
      dbgrid1.canvas.brush.color := clMoneyGreen; //не имеет фокуса
  dbgrid1.DefaultDrawColumnCell(rect, DataCol, Column, State)
end;

procedure TFormEdit.btn2Click(Sender: TObject);
var
  i, j: integer;
  Rows: TRows;
begin
  try
    Rows := LoadFromClipboard();
    if Rows.Num = 0 then
      Exit;
    with DBGrid1.DataSource.Dataset do
    begin
      for i := 0 to Rows.Num - 1 do
      begin
        Append;
        if (Rows.DBRecAr[i].Kod = 0) then
          FieldByName('kod').Value := Null
        else
          FieldByName('kod').AsInteger := Rows.DBRecAr[i].Kod;
        FieldByName('chert').AsString := Rows.DBRecAr[i].Chert;
        for j := 1 to 24 do
          FieldByName('TM' + IntToStr(j)).AsString := Rows.DBRecAr[i].TM[j];
        FieldByName('primech').AsString := Rows.DBRecAr[i].Primech;
      end;
      Post;
    end;
  except
    ShowMessage('Исключение!');
  end;
end;

procedure TFormEdit.btn3Click(Sender: TObject);
var
  s, s1: string;
begin
  if btn3.Down = true then
  begin
    s := '';
    s1 := Trim(medt1.Text);
    if (se1.Text <> '') and (se1.Value > 0) then
    begin
      s := '(Kod=' + se1.Text + ')';
      if s1 <> '' then
        s := s + ' AND ';
    end;
    if s1 <> '' then
      s := s + '(Chert=''' + s1 + ''')';
    if s <> '' then
    begin
      Table1.Filtered := False;
      Table1.Filter := s;
      Table1.Filtered := True;
      btn3.Font.Color := clBlue;
    end
    else
      btn3.Down := False;
  end
  else
  begin
    Table1.Filtered := False;
    btn3.Font.Color := clWindowText;
  end;
end;

procedure TFormEdit.se1Exit(Sender: TObject);
begin
  if se1.Text = '' then
    se1.Value := 0;
end;

procedure TFormEdit.Table1BeforeInsert(DataSet: TDataSet);
begin
  if (Table1.RecordCount > 0) and (Table1.RecNo > 0) then
    sPrevPrim := Table1.FieldByName('Primech').AsString;
end;

function CheckKod(var source: string): Boolean;
begin
  Result := not (StrToIntDef(source, 0) = 0);
end;

function CheckChert(var source: string): Boolean;
begin
  source := Trim(source);
  Result := (Length(source) = 13) and (pos(copy(source, 1, 1), '0123456789') <>
    0) and (pos(' ', source) = 4) and (pos(' ', copy(source, 5, 13)) = 7);
end;

// Вставка из буфера обмена MSO

procedure TFormEdit.btn4Click(Sender: TObject);
var
  IgnList, ImpList: TStringList;
  TestList: TList;
  i: integer;
  s: string;
begin
  TestList := TList.Create;
  TestList.Add(TTestElement.Create('Chert', CheckChert));
  TestList.Add(TTestElement.Create('Kod', CheckKod));
  IgnList := TStringList.Create;
  ImpList := TStringList.Create;
  ImpList.Add('Chert');
  for i := 1 to 3 do
    if DBGrid1.Columns[3 + 2 * i].ReadOnly then
    begin
      s := 'Kol' + inttostr(i);
      IgnList.Add(s);
      IgnList.Add(s + '_v');
    end;
  PasteMSO.Indication := IntToStr(NewString.Kod);
  PasteMSO.FillCheckList(Table1, ImpList, IgnList);
  FreeAndNil(IgnList);
  FreeAndNil(ImpList);
  PasteFromMSO.TestMethods := TestList;
  StringGridClear(PasteMSO.strngrd1);
  PasteMSO.ChecklistIniFileName := LocalStorage + 'np01vn_chklst1.ini';
  if PasteMSO.ShowModal = mrOk then
    PasteMSO.PasteToGrid(Table1, DBGrid1);
  FreeAndNil(TestList);
  lblRecCount.Caption := IntToStr(DataSource1.DataSet.RecordCount);
end;

procedure TFormEdit.Table1AfterInsert(DataSet: TDataSet);
begin
  lblRecCount.Caption := IntToStr(DataSource1.DataSet.RecordCount);
  if DBGrid1.SelectedRows.Count > 1 then
    Table1.Cancel
  else
    DBGrid1.SelectedIndex := 1;
end;

procedure TFormEdit.Table1AfterDelete(DataSet: TDataSet);
begin
  lblRecCount.Caption := IntToStr(DataSource1.DataSet.RecordCount);
end;

procedure TFormEdit.N2Click(Sender: TObject);
begin
  SAVLib_DB.CopyDBGridToClipboardAsText(DBGrid1, True);
end;

procedure TFormEdit.N3Click(Sender: TObject);
begin
  SAVLib_DB.CopyDBGridToClipboardAsText(DBGrid1);
end;

procedure TFormEdit.N9Click(Sender: TObject);
begin
  SAVLib_DB.GridSelectAll(DBGrid1);
end;

procedure TFormEdit.N11Click(Sender: TObject);
begin
  FormIndex.FieldFill(DBGrid1);
end;

procedure TFormEdit.btnSaveClick(Sender: TObject);
begin
  TableSave
end;

procedure TFormEdit.tmr1Timer(Sender: TObject);
begin
  if not (Table1.State in dsEditModes) then
    TableSave;
end;

procedure TFormEdit.TableSave;
begin
  Table1.FlushBuffers;
  FormEdit.Caption := FormCapt + '     Сохранено в ' + TimeToStr(Time);
end;

procedure TFormEdit.BitBtn1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormEdit.btn5Click(Sender: TObject);
begin
  sPrevPrim := '';
end;

procedure TFormEdit.btn6Click(Sender: TObject);
const
  //cs1 = '\\nevz\nevz\ASUP_Data1\LWS\prg_dlph\NP01VN02.exe';
 // cs1 ='d:\ProjectsD\NP01VN\NP01VN02\NP01VN02.exe';
  cs2 = 'Модуль NP01VN02 недоступен!';
  // cs3 = 'C:\lws';

  function GetTM: string;
  var
    i: integer;
  begin
    Result := Table1.FieldByName('TM1').AsString;
    for i := 2 to 24 do
      Result := Result + ' ' + Table1.FieldByName('TM' + inttostr(i)).AsString;
    Trim(Result);
    if Result <> '' then
      Result := ' /tm="' + Result + '"';
  end;

var
  s1, s2: string;
begin
  if isTest then
    s1 := cs2 + sNP01VN02exe
  else
    s1 := cs2;
  if FileExists(sNP01VN02exe) then
  begin
    s2 := '/ext /a /p=' + UsrAcs.DivisionStr;
    if Table1.RecordCount > 0 then
    begin
      if Table1.FieldByName(csField_Kod).Value <> null then
        s2 := s2 + ' /ki=' + Table1.FieldByName(csField_Kod).AsString;
      if Table1.FieldByName(csField_Chert).Value <> null then
        s2 := s2 + ' /chert="' + Table1.FieldByName(csField_Chert).AsString +
          '"';
      s2 := s2 + GetTM;
    end;
    ShellExecute(Handle, nil, PAnsiChar(sNP01VN02exe), PAnsiChar(s2),
      PAnsiChar(sNP01VN02dir),
      SW_RESTORE);
  end
  else
    ShowMessage(s1);
end;

end.

