unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, DBTables, StdCtrls, Buttons, ExcelXP, ComObj;

type
  TForm1 = class(TForm)
    Table_NP01F0: TTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    ButtonExcel: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonExcelClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TRecord = class(TObject)
    Digit, Kod: Integer;
    Title: string;
    Sort: Integer;
    Marsh, Prim,Data: string;
  public
    constructor Create(_Digit, _Kod: Integer; _Title: string;
      _Sort: Integer = 0;
      _Marsh: string = 'Маршрут'; _Prim: string = 'Примечание'; _Data: string ='');
  end;
  
var
  Num_tNP01FN: integer;
  Name_tNP01F: string;
  RowList: TList;
  Form1: TForm1;

implementation

uses Unit2, Unit3;

{$R *.dfm}

constructor TRecord.Create(_Digit, _Kod: Integer; _Title: string;
  _Sort: Integer = 0;
  _Marsh: string = 'Маршрут'; _Prim: string = 'Примечание'; _Data : string ='');
begin
  Digit := _Digit;
  Kod := _Kod;
  Title := _Title;
  Sort := _Sort;
  Marsh := _Marsh;
  Prim := _Prim;
  Data := _Data;
end;

function Foot(Sheet: Variant; aRow: Integer): Integer;
var
  Range: Variant;
begin
  Range := Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 5, 20]];
  Range.Font.Size := 11;
  Range.Font.Bold := True;
  Range.Columns['R'].HorizontalAlignment := -4131;
  Range.Cells[1, 1] := 'Директор по производству';
  Range.Cells[1, 20] := 'С.А. Пудов';
  Range.Cells[3, 1] := 'Начальник ПДО';
  Range.Cells[3, 20] := 'В.С. Муравьев';
  Range.Cells[5, 1] := 'Начальник ОПиАПД';
  Range.Cells[5, 20] := 'А.И. Паскевич';
  Result := aRow;
end;

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

function Head(Sheet: Variant): Integer;
begin
  Sheet.Rows['1:2'].Font.Bold := True;
  Sheet.Rows['1:2'].Font.Size := 11;
 // Sheet.Cells[1, 1] := 'Сл. з. ' + copy(Form3.Label2.Caption, 1, 10);
 // Sheet.Cells[2, 1] := copy(Form3.Label2.Caption, 11, 12);
  Sheet.Cells[1, 20] := 'И.О. начальника ОАСУП';
  Sheet.Cells[2, 20] := 'Цапу Ю.Г.';

  Result := 5;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  //with Table_NP01F0 do
  //begin
  //Filter:='Kod=1';
  //Filtered:=True;
  //end;
  //Table_NP01F0.Active:=True;
  //Table_NP01F0.Filter:='Kod=1';
  //Table_NP01F0.Filtered:=True;

end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
  //Form2:=TForm2.Create(Self);
  if Table_NP01F0.FieldByName('kod').AsInteger = 1 then
  begin
    Num_tNP01FN := Table_NP01F0.Fields[1].AsInteger;
    Name_tNP01F := 'NP01F' + IntToStr(Num_tNP01FN) + '.db';
    Form2.Table_NP01FN.TableName := Name_tNP01F;
    Form2.Table_NP01FN.Active := True;
    if Table_NP01F0.FieldByName('filename').AsInteger = 0 then
      Form2.Table_NP01FN.IndexName := '';
    if Table_NP01F0.FieldByName('filename').AsInteger = 1 then
      Form2.Table_NP01FN.IndexName := 'NP01VN_Kod';
    Form2.Label2.Caption := Table_NP01F0.FieldByName('title').AsString;
    if Form2.Table_NP01FN.RecordCount <> 0 then
      form2.ShowModal
    else
    begin
      MessageDlg('В выбранном вами файле нет информации!!!', mtInformation,
        [mbOK], 0);
      //Table_NP01F0.Active:=False;
      //Table_NP01F0.TableName:='';
      //Table_NP01F0.DatabaseName:='';
      Form2.Table_NP01FN.Active := False;
      Form2.Table_NP01FN.TableName := '';
      //form2.Table_NP01FN.DatabaseName:='';
    end;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Table_NP01F0.Active := False;
  Table_NP01F0.DatabaseName := '';
  Form1.Table_NP01F0.TableName := '';
  form2.Table_NP01FN.DatabaseName := '';
  //form3.Query_add_field_NP01F0.CloseDatabase(Table_NP01F0.Database);
  Form3.Query_add_field_NP01F0.UnPrepare;
  form3.Query_add_field_NP01F0.DatabaseName := '';
end;

procedure TForm1.ButtonExcelClick(Sender: TObject);
var
  ExcelApp, WorkBook, Sheet, Range: OleVariant;
  aRow, aCol, I: Integer;
  TableRow: TTable;
  CurIndex: Integer;
//  iRow: Integer;
 // iRec: TRecord;
  TableBegin: integer;
begin
  TableRow := TTable.Create(self);

  ExcelApp := CreateOleObject('Excel.Application');
  try
    ExcelApp.Visible := True;
    Workbook := ExcelApp.WorkBooks.Add;

    for I := 1 to WorkBook.Sheets.Count - 1 do
      WorkBook.Sheets.Item[I].Delete;
    Sheet := WorkBook.Sheets.Item[1];

    Sheet.Name := 'Отчет';
    Sheet.Cells.Font.Name := 'Times New Roman';
    Sheet.Cells.Font.Size := 12;
    // снять защиту
    Sheet.Cells.Locked := False;
    Sheet.PageSetup.LeftMargin := 72 / 25.4 * 8;
    Sheet.PageSetup.TopMargin := 72 / 25.4 * 10;
    Sheet.PageSetup.RightMargin := 72 / 25.4 * 4;
    Sheet.PageSetup.BottomMargin := 72 / 25.4 * 12;
    Sheet.PageSetup.FooterMargin := 72 / 25.4 * 5;

    Sheet.PageSetup.CenterFooter := '&"Arial Cyr,полужирный"&12&F - Страница &P';
      // "&""Arial Cyr,полужирный""&12&F - &D"
    ///////////////////////////////////////////////////
      //Sheet.PageSetup.Orientation := xlLandscape;
    Sheet.PageSetup.PaperSize := xlPaperA4;
    Sheet.PageSetup.Zoom := False;
    Sheet.PageSetup.FitToPagesWide := 1;
    Sheet.PageSetup.FitToPagesTall := False;
    ///////////////////////////////////////////////////
    Sheet.Columns['A'].Font.Bold := True;
    Sheet.Columns['C'].Font.Bold := True;

    Sheet.Columns['A'].ColumnWidth := 3.43;
    Sheet.Columns['B'].ColumnWidth := 1.55;
    Sheet.Columns['C'].ColumnWidth := 6.14;
    Sheet.Columns['D'].ColumnWidth := 14.14;
    Sheet.Columns['E'].ColumnWidth := 4.86;
    Sheet.Columns['F:H'].ColumnWidth := 4.86;
    Sheet.Columns['I'].ColumnWidth := 1;
    Sheet.Columns['J:S'].ColumnWidth := 2.29;
    Sheet.Columns['T'].ColumnWidth := 30;

    aRow := Head(Sheet);
    Inc(aRow);
    Table_NP01F0.First;
    while not Table_NP01F0.Eof do
    begin
      //iRec := RowList.Items[iRow];

      Sheet.Cells[aRow, 1].Font.Bold := True;
      Range := Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow, 20]];
      Range.Merge;
      Range.HorizontalAlignment := -4108;
      Range.VerticalAlignment := -4108;
      Sheet.Rows[aRow].RowHeight := 27;
      Sheet.Cells[aRow, 1] := DelCR(Table_NP01F0.fieldbyname('Title').AsString);

      if (Table_NP01F0.fieldbyname('kod').AsInteger = 2) then
      begin
        Range.HorizontalAlignment := -4131;
      end
      else if (Table_NP01F0.fieldbyname('kod').AsInteger = 1) then
      begin
        Inc(aRow);

        Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1, 1]].Merge;
        Sheet.Range[Sheet.Cells[aRow, 2], Sheet.Cells[aRow + 1, 3]].Merge;
        Sheet.Range[Sheet.Cells[aRow, 4], Sheet.Cells[aRow + 1, 4]].Merge;
        Sheet.Range[Sheet.Cells[aRow, 5], Sheet.Cells[aRow + 1, 5]].Merge;
        Sheet.Range[Sheet.Cells[aRow, 6], Sheet.Cells[aRow, 8]].Merge;
        Sheet.Range[Sheet.Cells[aRow, 9], Sheet.Cells[aRow + 1, 19]].Merge;
        Sheet.Range[Sheet.Cells[aRow, 20], Sheet.Cells[aRow + 1, 20]].Merge;

        Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
          20]].HorizontalAlignment :=
          -4108;
        Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
          20]].VerticalAlignment :=
          -4108;
        Sheet.Cells[aRow, 1] := '№№';
        Sheet.Cells[aRow, 2] := 'Код';
        Sheet.Cells[aRow, 4] := 'Чертёж';
        Sheet.Cells[aRow, 5] := 'Кол';
        Sheet.Cells[aRow, 6] := 'Месяц';
        Sheet.Cells[aRow + 1, 6] := 'I';
        Sheet.Cells[aRow + 1, 7] := 'II';
        Sheet.Cells[aRow + 1, 8] := 'III';
        Sheet.Cells[aRow, 9] := Table_NP01F0.fieldbyname('marsh').AsString;
        Sheet.Cells[aRow, 20] := Table_NP01F0.fieldbyname('prim').AsString;

        Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1, 20]].Font.Bold
          := True;
        SetBorder(Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1, 20]],
          0);

        TableRow.DatabaseName := pyt + '\';
        TableRow.TableName := 'NP01F' +
          IntToStr(Table_NP01F0.fieldbyname('digit').AsInteger);

        try
          TableRow.Open;
        except
          aRow := aRow + 2;
          Continue;
        end;

        CurIndex := Table_NP01F0.fieldbyname('filename').AsInteger;

        TableRow.IndexDefs.Update;
        if (CurIndex < TableRow.IndexDefs.Count) then
          TableRow.IndexName := TableRow.IndexDefs.Items[CurIndex].Name;

        aRow := aRow + 2;
        TableBegin := aRow;

        Range := Sheet.Range[Sheet.Cells[TableBegin, 1], Sheet.Cells[TableBegin
          + TableRow.RecordCount - 1, 20]];

        SetBorder(Range, -1);
        Sheet.Range[Sheet.Cells[aRow, 10], Sheet.Cells[aRow +
          TableRow.RecordCount - 1, 19]].NumberFormat := '00';

        TableRow.First;
        I := 1;
        while not TableRow.Eof do
        begin
          Sheet.Cells[aRow, 1] := I;
          Sheet.Cells[aRow, 3].HorizontalAlignment := -4131;

          for aCol := 3 to 8 do
            Sheet.Cells[aRow, aCol] := TableRow.Fields[aCol - 2].AsString;
          for aCol := 10 to 19 do
            Sheet.Cells[aRow, aCol] := TableRow.Fields[aCol - 3].AsString;
          Sheet.Cells[aRow, 20] := TableRow.Fields[aCol - 1].AsString;

          Inc(aRow);
          Inc(I);
          TableRow.Next;
        end;

        TableRow.Close;
        // защита ячеек
        Sheet.Range[Sheet.Cells[TableBegin - 2, 1], Sheet.Cells[aRow - 1,
          19]].Locked := True;
      end;
      Table_NP01F0.Next;
      aRow := aRow + 2;
    end; // for iRow := 0 to Rowlist.Count-1

    Foot(Sheet, aRow + 2);

    // защита листа
    Sheet.Protect(Password := 'rjcnz', AllowFormattingColumns := True,
      AllowFormattingRows := True, AllowInsertingRows := True);

    DeleteFile(name_dir + '.xls');
    Workbook.SaveAs(FileName := name_dir + '.xls', ReadOnlyRecommended := False,
      CreateBackup := False);
    //	Workbook.Close(SaveChanges := True, FileName := OutputFule);

  finally
    //ExcelApp.Quit;
    ExcelApp := UnAssigned;
    TableRow.Free;
  end;
end;

end.

