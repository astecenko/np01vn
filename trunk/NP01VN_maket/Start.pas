unit Start;
{ TODO : Сделать показ данных в столбцах по месяцам в хинтах если много символов? }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls,
  TMClass, ComCtrls, Buttons, Unit1, comobj,
  ExcelXP, office2000, Mask, Spin;

type
  { TRecord = class(TObject)
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
   }
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
    btnExcel2: TButton;
    lbl3: TLabel;
    lbl4: TLabel;
    se1: TSpinEdit;
    medt1: TMaskEdit;
    btn3: TSpeedButton;
    lbl5: TLabel;
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
    procedure OpenTable(_Rec: TRecord);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure ButtonSortClick(Sender: TObject);
    procedure ButtonCopyClick(Sender: TObject);
    procedure ButtonPasteClick(Sender: TObject);
    procedure Table1ChertSetText(Sender: TField; const Text: string);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure SetMonthCaption(const iii: Integer);
    function CreateNewTable(NewTable: TTable): Boolean;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcel2Click(Sender: TObject);
    procedure se1Exit(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    //    function CreateNewTable(NewTable: TTable): Boolean;
    procedure DoQuery(TM1: string; Chert: string);
    procedure EnableListBox;
    procedure SetIndex(_Sort: Integer);
    // procedure CreateIndex;

  public
    { Public declarations }
  end;

  PTRecord = ^TRecord;

var
  FormEdit: TFormEdit;
  StrZeh: string;
  CurName, CurQuarter: Integer;
  CurPrim: Integer = -1;
  TMTableName: string;
  // хранит полный путь до pl01, из pl01 выбираются уникальные маршруты
  Quarters: array[1..4] of string[20] = ('1 кв.', '2 кв.', '3 кв.', '4 кв.');
  Sort: Integer;
  sdocname: string;
  bMask: Boolean = True;
  kod2Quart, kod2Month, kod2Type: Integer;
  Quarter: Integer;
procedure FillPrim(Table1: TTable);

implementation

uses ClipB, KoaUtils, {NewString,} Math, Constants, Unit3, Journal, ASU_DBF,
  DateUtils;

{$R *.dfm}

var
  TMAr: TMArray;

  {constructor TRecord.Create(_Digit, _Kod: Integer; _Title: string;
    _Sort: Integer = 0;
    _Marsh: string = 'Маршрут'; _Prim: string = 'Примечание'; _Data: string =
    '');
  begin
    Digit := _Digit;
    Kod := _Kod;
    Title := _Title;
    Sort := _Sort;
    Marsh := _Marsh;
    Prim := _Prim;
    Data := _Data;
  end;
   }

function GetQuarter(): Integer;
var
  si: ASU_SI;
begin
  si := GetSI(GetPath(BasesPdo, 'pl01.dbf') + 'pl01.dbf');
  Result := StrToInt(si.si_text[1]);
end;

function Padl(expression: string; nLength: Integer; cFillChar: Char = ' '):
  string;
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

procedure TFormEdit.SetMonthCaption(const iii: Integer);
begin
  txt1.Caption := SysUtils.LongMonthNames[(iii - 1) * 3 + 1];
  txt2.Caption := SysUtils.LongMonthNames[(iii - 1) * 3 + 2];
  txt3.Caption := SysUtils.LongMonthNames[(iii - 1) * 3 + 3];
end;

function TFormEdit.CreateNewTable(NewTable: TTable): Boolean;
begin
  (* with NewTable do
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
         with AddFieldDef do
         begin
           Name := 'TM1';
           DataType := ftString;
           Size := 2;
         end;
         with AddFieldDef do
         begin
           Name := 'TM2';
           DataType := ftString;
           Size := 2;
         end;
         with AddFieldDef do
         begin
           Name := 'TM3';
           DataType := ftString;
           Size := 2;
         end;
         with AddFieldDef do
         begin
           Name := 'TM4';
           DataType := ftString;
           Size := 2;
         end;
         with AddFieldDef do
         begin
           Name := 'TM5';
           DataType := ftString;
           Size := 2;
         end;
         with AddFieldDef do
         begin
           Name := 'TM6';
           DataType := ftString;
           Size := 2;
         end;
         with AddFieldDef do
         begin
           Name := 'TM7';
           DataType := ftString;
           Size := 2;
         end;
         with AddFieldDef do
         begin
           Name := 'TM8';
           DataType := ftString;
           Size := 2;
         end;
         with AddFieldDef do
         begin
           Name := 'TM9';
           DataType := ftString;
           Size := 2;
         end;
         with AddFieldDef do
         begin
           Name := 'TM10';
           DataType := ftString;
           Size := 2;
         end;
         with AddFieldDef do
         begin
           Name := 'TM11';
           DataType := ftString;
           Size := 2;
         end;
         with AddFieldDef do
         begin
           Name := 'TM12';
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
    *)
  Result := True;
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

procedure TFormEdit.OpenTable(_Rec: TRecord);
begin
  try
    with Table1 do
    begin
      Active := False;
      TableType := ttParadox;
      TableName := 'NP01F' + IntToStr(_Rec.Digit) + '.db';
      DatabaseName := Journal.ExtractShortPathName(NetDir + Workname_2 + '\');

      if (not Table1.Exists) then
      begin
        ShowMessage('Таблица ненайдена!!!');
        Exit;
      end;
      (*else
      begin // создание индексов
        if Index.FormIndex.lbl1.Visible = False then
          CreateIndex;
      end;*)
      (*if Index.FormIndex.lbl1.Visible = False then
      begin
        Sort := _Rec.Sort;
        SetIndex(Sort);
        FillPrim(Table1);
      end
      else*)
//      Table1.Active := True;
    end;
  except
    if Table1.Active = True then
      Table1.Close;
    Table1.Exclusive := False;
  end;
end;

(* procedure TFormEdit.CreateIndex();
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
 *)

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
  IndexNames1.Free;
end;

procedure TFormEdit.FormShow(Sender: TObject);
var
  I, J: Integer;
begin
  OpenTable(CurRec);
  //  Table1.Open;
    { DONE : Установить при открытии на последнюю позицию }
  //  Table1.Last;
  if Table1.Active = False then
    Table1.Active := True;
  bMask := True;
  { if Index.FormIndex.lbl1.Visible = False then
   begin}
  DBGrid1.Fields[2].EditMask := '000\ 000000\ 00;1; ';
  DBGrid1.Columns.Items[2].Title.Caption := 'Чертеж';
  {  end;}
  MemoTitle.Text := CurRec.Title;
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
  Journal.FmJournal.GetFromKod2(kod2, kod2Quart, kod2Month, kod2Type);
  //ShowMessage('|' + inttostr(kod2Quart) + '|' + inttostr(kod2Month) + '|' + inttostr(kod2Type) + '|');
  case Kod of
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
  lbl5.Caption := IntToStr(DataSource1.DataSet.RecordCount);
  strngrd1.Cells[0, 0] := 'Код';
  strngrd1.Cells[1, 0] := 'Кол-во на изд.';
  strngrd1.Cells[5, 0] := 'Всего';
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
        //ListBoxTM.AddItem(FieldByName('TM').AsString, nil);
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
    for I := 1 to 12 do
      Table1.FieldByName('TM' + IntToStr(I)).Clear;

    for I := 0 to ((Length(SubTM) + 1) div 3) - 1 do
    begin
      FieldName := 'TM' + IntToStr(I + 1);
      Table1.FieldByName(FieldName).AsString := Copy(SubTM, I * 3 + 1, 2);
    end;
    Table1.Post;
    //Table1.FieldByName('TM').Value := MyTM.SubTM(Zeh);
  end;
end;

{
Кнопка "Найти маршруты"
}

procedure TFormEdit.ButtonTMClick(Sender: TObject);
begin
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
end;

procedure TFormEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Table1.Active) and (Table1.ReadOnly = False) then
  begin
    if (Table1.State = dsEdit) or (Table1.State = dsInsert) then
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
  FieldName: string;
  Sum: Integer;
begin
  if (Field = nil) then
    exit;
  //  SelInd := DBGrid1.SelectedIndex;
  FieldName := Field.DisplayName;
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
    //  sum := 0;
    if (DBGrid1.DataSource.DataSet.FieldByName('Kol1_v').AsInteger <> 0) and
      (DBGrid1.DataSource.DataSet.FieldByName('Kol1_v').AsInteger <> null) and
      (DBGrid1.Columns[4].ReadOnly = False) then
    begin
      DBGrid1.DataSource.DataSet.FieldByName('Kol1').AsInteger :=
        DBGrid1.DataSource.DataSet.FieldByName('Kol1_v').AsInteger *
        DBGrid1.DataSource.DataSet.FieldByName('Kol_1').AsInteger;
      //  sum := DBGrid1.DataSource.DataSet.FieldByName('Kol1').AsInteger;
    end;
    if (DBGrid1.DataSource.DataSet.FieldByName('Kol2_v').AsInteger <> 0) and
      (DBGrid1.DataSource.DataSet.FieldByName('Kol2_v').AsInteger <> null) and
      (DBGrid1.Columns[6].ReadOnly = False) then
    begin
      DBGrid1.DataSource.DataSet.FieldByName('Kol2').AsInteger :=
        DBGrid1.DataSource.DataSet.FieldByName('Kol2_v').AsInteger *
        DBGrid1.DataSource.DataSet.FieldByName('Kol_1').AsInteger;
      // sum := sum + DBGrid1.DataSource.DataSet.FieldByName('Kol2').AsInteger;
    end;
    if (DBGrid1.DataSource.DataSet.FieldByName('Kol3_v').AsInteger <> 0) and
      (DBGrid1.DataSource.DataSet.FieldByName('Kol3_v').AsInteger <> null) and
      (DBGrid1.Columns[8].ReadOnly = False) then
    begin
      DBGrid1.DataSource.DataSet.FieldByName('Kol3').AsInteger :=
        DBGrid1.DataSource.DataSet.FieldByName('Kol3_v').AsInteger *
        DBGrid1.DataSource.DataSet.FieldByName('Kol_1').AsInteger;
      // sum := sum + DBGrid1.DataSource.DataSet.FieldByName('Kol3').AsInteger;
    end;
    //DBGrid1.DataSource.DataSet.FieldByName('Kol').AsInteger :=Sum;
  end;
  lbl5.Caption := IntToStr(DataSource1.DataSet.RecordCount);
end;

procedure TFormEdit.EnableListBox;
begin
  if (CurName = 0) then
  begin // подетальный план на квартал
    ComboBoxPrim.ItemIndex := -1;
    ComboBoxPrim.Enabled := False;
    ComboBoxQuarter.ItemIndex := Quarter - 1;
    ComboBoxQuarter.Enabled := True;
    TMTableName := PLTables[Quarter - 1];
  end
  else if (CurName = 1) then
  begin
    ComboBoxQuarter.ItemIndex := -1;
    ComboBoxQuarter.Enabled := False;
    ComboBoxPrim.Enabled := True;
    ComboBoxPrim.ItemIndex := 0;
    TMTableName := NSTables[1];
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
  // Table1.ReadOnly := Index.FormIndex.lbl1.Visible;
   //  ButtonCopy.Enabled := not (Table1.ReadOnly);
  ButtonPaste.Enabled := not (Table1.ReadOnly);
  ListBoxTM.Enabled := not (Table1.ReadOnly);
  MemoTitle.Enabled := not (Table1.ReadOnly);
  Quarter := GetQuarter();

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
begin
  if (Key = VK_F4) and (DBGrid1.SelectedField.Name = 'Table1Chert') then
  begin
    if (bMask) then
    begin
      DBGrid1.SelectedField.EditMask := '';
      DBGrid1.Columns.Items[2].Title.Caption := 'Чертеж/Текст';
    end
    else
    begin
      DBGrid1.SelectedField.EditMask := '000\ 000000\ 00;1; ';
      DBGrid1.Columns.Items[2].Title.Caption := 'Чертеж';
    end;
    bMask := not bMask;
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
    Dataset.FieldByName('Primech').Value := '"-';
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
        for j := 1 to 12 do
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
    Rows := LoadFromClipboard();
    if Rows.Num = 0 then
      Exit;

    with DBGrid1.DataSource.Dataset do
    begin
      for i := 0 to Rows.Num - 1 do
      begin
        //Append;
        Insert();
        if (Rows.DBRecAr[i].Kod = 0) then
          FieldByName('kod').Value := Null
        else
          FieldByName('kod').AsInteger := Rows.DBRecAr[i].Kod;

        FieldByName('chert').AsString := Rows.DBRecAr[i].Chert;
        for j := 1 to 3 do
        begin
          if (Rows.DBRecAr[i].Kol[j] = 0) then
            FieldByName('kol' + IntToStr(j)).Value := Null
          else
            FieldByName('kol' + IntToStr(j)).AsInteger :=
              Rows.DBRecAr[i].Kol[j];
          if (Rows.DBRecAr[i].Kol_v[j] = 0) then
            FieldByName('kol' + IntToStr(j) + '_v').Value := Null
          else
            FieldByName('kol' + IntToStr(j) + '_v').AsInteger :=
              Rows.DBRecAr[i].Kol_v[j];
        end;
        for j := 1 to 12 do
          FieldByName('TM' + IntToStr(j)).AsString := Rows.DBRecAr[i].TM[j];
        FieldByName('primech').AsString := Rows.DBRecAr[i].Primech;
        if (Rows.DBRecAr[i].Kol_1 = 0) then
          FieldByName('kol_1').Value := Null
        else
          FieldByName('kol_1').AsInteger :=
            Rows.DBRecAr[i].Kol_1;
        //Next;
      end;
      Post;
    end;
  except
    ShowMessage('Исключение!');
  end;
end;

procedure TFormEdit.DBGrid1ColExit(Sender: TObject);
begin
  { if ((DBGrid1.DataSource.DataSet.State = dsEdit) or
     (DBGrid1.DataSource.DataSet.State = dsInsert)) and ((DBGrid1.SelectedIndex =
     3) or (DBGrid1.SelectedIndex = 4) or (DBGrid1.SelectedIndex = 6) or
     (DBGrid1.SelectedIndex = 8)) and
     (DBGrid1.DataSource.DataSet.FieldByName('Kol_1').AsInteger <> null) then
   begin
     if (DBGrid1.DataSource.DataSet.FieldByName('Kol1_v').AsInteger <> 0 and
       DBGrid1.DataSource.DataSet.FieldByName('Kol1_v').AsInteger <> null) then
       DBGrid1.DataSource.DataSet.FieldByName('Kol1').AsInteger :=
         DBGrid1.DataSource.DataSet.FieldByName('Kol1_v').AsInteger *
         DBGrid1.DataSource.DataSet.FieldByName('Kol_1').AsInteger;
     if (DBGrid1.DataSource.DataSet.FieldByName('Kol2_v').AsInteger <> 0 and
       DBGrid1.DataSource.DataSet.FieldByName('Kol2_v').AsInteger <> null) then
       DBGrid1.DataSource.DataSet.FieldByName('Kol2').AsInteger :=
         DBGrid1.DataSource.DataSet.FieldByName('Kol2_v').AsInteger *
         DBGrid1.DataSource.DataSet.FieldByName('Kol_1').AsInteger;
     if (DBGrid1.DataSource.DataSet.FieldByName('Kol3_v').AsInteger <> 0 and
       DBGrid1.DataSource.DataSet.FieldByName('Kol3_v').AsInteger <> null) then
       DBGrid1.DataSource.DataSet.FieldByName('Kol3').AsInteger :=
         DBGrid1.DataSource.DataSet.FieldByName('Kol3_v').AsInteger *
         DBGrid1.DataSource.DataSet.FieldByName('Kol_1').AsInteger;

   end; }
end;

procedure TFormEdit.btn1Click(Sender: TObject);
var
  Query: TQuery;
  i, j: Integer;
  stm, skod, ssi: string;
  ssi2: TStringList;
begin
  btn1.Enabled := False;
  if Table1.RecordCount > 0 then
  begin
    if (DBGrid1.DataSource.Dataset.FieldByName('Kod').AsString <> '') and
      (DBGrid1.DataSource.Dataset.FieldByName('Chert').AsString <> '') and
      (DBGrid1.DataSource.Dataset.FieldByName('tm1').AsString <> '') then
    begin
      Query := TQuery.Create(nil);
      skod :=
        Padl(DBGrid1.DataSource.Dataset.FieldByName('Kod').AsString, 4, '0');
      i := 2;
      stm := DBGrid1.DataSource.Dataset.FieldByName('tm1').AsString;
      while (DBGrid1.DataSource.Dataset.FieldByName('tm' + inttostr(i)).AsString
        <> '') and (i < 13) do
      begin
        stm := stm + DBGrid1.DataSource.Dataset.FieldByName('tm' +
          inttostr(i)).AsString;
        Inc(i);
      end;
      grp1.Caption := '';
      //      j := 0;
      ssi := ChangeFileExt(sPL01PS, '.si');
      if FileExists(ssi) = True then
      begin
        ssi2 := TStringList.Create;
        ssi2.LoadFromFile(ssi);
        grp1.Caption := ' План ' + ssi2.Text[24] + ' квартала 20' + ssi2.Text[26]
          + ssi2.Text[27];
        try
          j := strtoint(ssi2.Text[24]);
          Dec(j);
          strngrd1.Cells[2, 0] := SysUtils.LongMonthNames[j * 3 + 1];
          strngrd1.Cells[3, 0] := SysUtils.LongMonthNames[j * 3 + 2];
          strngrd1.Cells[4, 0] := SysUtils.LongMonthNames[j * 3 + 3];
        except
        end;

        FreeAndNil(ssi2);
      end;
      grp1.Caption := grp1.Caption + ' Чертеж: ' +
        DBGrid1.DataSource.Dataset.FieldByName('Chert').AsString + '   ТМ: ' +
        stm + ' ';
      strngrd1.Cells[2, 1] := '0';
      strngrd1.Cells[3, 1] := '0';
      strngrd1.Cells[4, 1] := '0';
      Query.SQL.Text := 'select * from "' + sPL01PS + '" where (chert="' +
        DBGrid1.DataSource.Dataset.FieldByName('Chert').AsString +
        '") and (ki="' + skod + '") and (tm like "' + stm + '")';
      try
        Query.Open;
        for i := 1 to Query.RecordCount do
        begin
          Query.RecNo := i;
          strngrd1.Cells[Query.FieldByName('Period').AsInteger + 1, 1] :=
            Query.FieldByName('Kol').AsString;
        end;
        Query.Close;
        Query.SQL.Text := 'select ki, kol from "' + sPL01IZ + '" where ki="' +
          skod + '"';
        Query.Open;
        j := 0;
        stm := 'План: ';
        for i := 1 to Query.RecordCount do
        begin
          Query.RecNo := i;
          stm := stm + inttostr(i) + 'мес=' + Query.FieldByName('Kol').AsString
            + '  ';
          j := j + Query.FieldByName('Kol').AsInteger;
        end;
        i := StrToInt(strngrd1.Cells[2, 1]) + StrToInt(strngrd1.Cells[3, 1]) +
          StrToInt(strngrd1.Cells[4, 1]);
        strngrd1.Cells[5, 1] := IntToStr(i);
        if j > 0 then
          strngrd1.Cells[1, 1] := FloatToStr(RoundTo(i / j, -3));
        strngrd1.Cells[0, 1] := skod;
        lbl1.Caption := stm;
      finally
        Query.Close;
        FreeAndNil(Query);
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

procedure TFormEdit.Table1BeforeEdit(DataSet: TDataSet);
begin
  //  showmessage(Dataset.FieldByName('Kod').AsString);
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

function Head(Sheet: Variant): Integer;
begin
  Sheet.Rows['1:3'].Font.Bold := True;
  Sheet.Rows['1:3'].Font.Size := 11;
  Sheet.Cells[2, 22] := csDocHead_1;
  Sheet.Cells[3, 22] := csDocHead_2;
  Sheet.Cells[2, 1] := csDocHead_3 + Copy(sDocName, 1, 10);
  Sheet.Cells[3, 1] := Copy(sDocName, 12, 255);
  Result := 5;
end;

{
????? ????????
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
{ DONE -oKoa : ???????? ??????? ????? }

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
??? ????? 6,7,8 ???????? ?? ???2 ???? ??????? (?? ?????), ???? ?????
}

procedure GetFromKod2(const Kod_02: integer; var k2Quartal: Integer;
  var k2Month: Integer; var k2Type: Integer);

begin
  GetFromKod2Str(IntToStr(Kod_02), k2Quartal, k2Month, k2Type);
end;

procedure TFormEdit.btnExcel2Click(Sender: TObject);
var
  ExcelApp, WorkBook, Sheet, Range: OleVariant;
  aRow, aCol, I: Integer;
  //  TableRow: TTable;
//  CurIndex: Integer;
  F: System.Text;
  NameFile: string;
  //  iRow: Integer;
  iRec: TRecord;
  TableBegin: integer;
  iQ, iM, iT: Integer;
  TMSKolAr: array[1..3] of Integer;
  // FExcelLanguageID: integer;
  mso2003: Boolean;
  mso2003s: string;
  i5, j: Integer;

begin
  { if sDocName = '' then
   begin
     bDocNameClick(nil);
   end;}
  btnExcel2.Enabled := False;
  iRec := TRecord.Create(CurRec.Digit, CurRec.Kod, CurRec.Title, CurRec.Sort,
    CurRec.Marsh, CurRec.Prim, CurRec.Data);
  i5 := Table1.RecNo;
  Table1.DisableControls;
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
  // TableRow := TTable.Create(self);

  ExcelApp := CreateOleObject(csDocExcel);
  mso2003s := Copy(ExcelApp.Version, 1, 2);
  if strtoint(mso2003s) > 11 then
    mso2003 := False
  else
    mso2003 := True;

  //  FExcelLanguageID := ExcelApp.LanguageSettings.LanguageID[msoLanguageIDUI];
  try
    ExcelApp.Visible := False;
    Workbook := ExcelApp.WorkBooks.Add;

    for I := 1 to WorkBook.Sheets.Count - 1 do
      WorkBook.Sheets.Item[I].Delete;
    Sheet := WorkBook.Sheets.Item[1];

    Sheet.Name := csDocSheetName_1;
    Sheet.Cells.Font.Name := csDocFont_1;
    Sheet.Cells.Font.Size := 12; //FontSize;
    // ????? ??????
    Sheet.Cells.Locked := False;
    Sheet.PageSetup.LeftMargin := 72 / 25.4 * 8;
    Sheet.PageSetup.TopMargin := 72 / 25.4 * 10;
    Sheet.PageSetup.RightMargin := 72 / 25.4 * 4;
    Sheet.PageSetup.BottomMargin := 72 / 25.4 * 12;
    Sheet.PageSetup.FooterMargin := 72 / 25.4 * 5;

    Sheet.PageSetup.CenterFooter := csDocPageFooter;
    // "&""Arial Cyr,??????????""&12&F - &D"
  ///////////////////////////////////////////////////
    Sheet.PageSetup.Orientation := 1; //PaperOrientation;
    Sheet.PageSetup.PaperSize := 9; //PaperSize;
    Sheet.PageSetup.Zoom := False;
    Sheet.PageSetup.FitToPagesWide := 1;
    Sheet.PageSetup.FitToPagesTall := False;
    ///////////////////////////////////////////////////
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
    j := 0;
    aRow := Head(Sheet);
    //   Inc(aRow);

       //    for iRow := 0 to RowList.Count - 1 do
       //    begin
    //   iRec := RowList.Items[iRow];

    Sheet.Cells[aRow, 1].Font.Bold := True;
    Range := Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow, 22]];
    Range.Merge;
    Range.HorizontalAlignment := -4108;
    Range.VerticalAlignment := -4108;
    Sheet.Rows[aRow].RowHeight := 27;
    Sheet.Cells[aRow, 1] := DelCR(iRec.Title);

    {  if FileExists(StartDir + WorkName + csSymb_BackSlash + csNP01F +
        IntToStr(iRec.Digit) + csDBExt) = True then
      begin    }
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

    Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
      22]].HorizontalAlignment :=
      -4108;
    Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
      22]].VerticalAlignment :=
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

    Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
      22]].Font.Bold
      := True;
    SetBorder(Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
      22]],
        0);

    //       TableRow.DatabaseName := StartDir + WorkName + csSymb_BackSlash;
    //       Table1.TableName := csNP01F + IntToStr(iRec.Digit);

   { CurIndex := iRec.Sort;

    Table1.IndexDefs.Update;
    if (CurIndex < Table1.IndexDefs.Count) then
      Table1.IndexName := Table1.IndexDefs.Items[CurIndex].Name;
    }
    aRow := aRow + 2;
    TableBegin := aRow;

    Range := Sheet.Range[Sheet.Cells[TableBegin, 1],
      Sheet.Cells[TableBegin + Table1.RecordCount, 22]];
    // + TableRow.RecordCount - 1, 22]];

    SetBorder(Range, -1);
    Sheet.Range[Sheet.Cells[aRow, 10], Sheet.Cells[aRow +
      Table1.RecordCount - 1, 21]].NumberFormat := '00';

    Table1.First;
    I := 1;
    while not Table1.Eof do
    begin
      Inc(j);
      if j > 100 then
      begin
        Application.ProcessMessages;
        j := 0;
      end;
      Sheet.Cells[aRow, 1] := I;
      Sheet.Cells[aRow, 3].HorizontalAlignment := -4131;
      Sheet.Cells[aRow, 4].Font.Size := 14; //ChertFontSize;
      for aCol := 3 to 8 do
        Sheet.Cells[aRow, aCol] := Table1.Fields[aCol - 2].AsString;
      for aCol := 10 to 21 do
        Sheet.Cells[aRow, aCol] := Table1.Fields[aCol - 3].AsString;
      Sheet.Cells[aRow, 22] := Table1.FieldByName('Primech').AsString;
      Inc(aRow);
      Inc(I);
      Table1.Next;
    end;

    //        TableRow.Close;

            // ?????? ?????
      {      Sheet.Range[Sheet.Cells[TableBegin - 2, 1], Sheet.Cells[aRow - 1,
              21]].Locked := True;}
 // end;

    aRow := aRow + 2;
    //   end; // for iRow := 0 to Rowlist.Count-1

       //    Foot(Sheet, aRow+2);

   // Sheet.PageSetup.PrintArea := 'A1:V' + IntToStr(aRow + 1);

    // ?????? ?????
   { Sheet.Protect(Password := csDocPasw, AllowFormattingColumns := True,
      AllowFormattingRows := True, AllowInsertingRows := True);
    }
  {  DeleteFile(OutputFile);
    if mso2003 = False then
      Workbook.SaveAs(FileName := OutputFile, ReadOnlyRecommended := False,
        CreateBackup := False, FileFormat := 56)
    else
      Workbook.SaveAs(FileName := OutputFile, ReadOnlyRecommended := False,
        CreateBackup := False);
    //Workbook.Close(SaveChanges := True, FileName := OutputFule);}
    ExcelApp.Visible := True;

  finally
    //ExcelApp.Quit;
        ExcelApp.Visible := True;
    ExcelApp := UnAssigned;
    Table1.RecNo := i5;
    Table1.EnableControls;
    //TableRow.Free;
  end;
  btnExcel2.Enabled := True;
end;

procedure TFormEdit.se1Exit(Sender: TObject);
begin
  if se1.Text = '' then
    se1.Value := 0;

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

end.

