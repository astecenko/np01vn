unit Excel;

interface

uses DBTables;

procedure PrintFile(Table1 : TTable);

implementation

uses ComObj, Ost, SysUtils, Variants, Main, {Neispr, Menu,} ExcelXP;

const
	CR = $D;
  LF : Char = Chr($A);
  Fn : array[1..2] of string = ('42', 'P8');

function Head(Sheet: Variant) : Integer;
var
	CurYear : string;
begin
	DateTimeToString(CurYear, 'yyyy', Date());
	//FileDate := Copy(WorkName[iNum], Length(CurTaskName)+2, 255);

//	Sheet.Rows['1:2'].Font.Bold := True;
{	Sheet.Rows['1:6'].Font.Size := 14;}
	Sheet.Rows[1].RowHeight := 78;
(*	Sheet.Cells[1, 5] := 'УТВЕРЖДАЮ';
	Sheet.Cells[3, 5] := 'Директор по производству';
	Sheet.Cells[4, 5] := '__________ С.А. Пудов';
	Sheet.Cells[5, 5] := '«____» ____________ ' + CurYear + ' г.';*)

	if (iNum = 1) then begin
		Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[1,7]].Merge;
		Sheet.Cells[1, 1].HorizontalAlignment := -4108;
		Sheet.Cells[1, 1].VerticalAlignment := -4108;
		Sheet.Cells[1, 1] :=
			'Ведомость корректировки лимита в номенклатуре ТМЦ по приказам' + LF +
			'на                       месяц   ' + CurYear + ' г.';
	end
	else begin
		Sheet.Range[Sheet.Cells[7,1], Sheet.Cells[7,5]].Merge;
		Sheet.Cells[7, 1].HorizontalAlignment := -4108;
		Sheet.Cells[7, 1].VerticalAlignment := -4108;
		Sheet.Cells[7, 1] :=
			'Ведомость неисправимого брака для корректирования остатка лимита' + LF +
			'(увеличения остатка лимита) на материалы, покупные и комплектующие изделия' +
			LF + 'на   квартал ' + CurYear + ' г.';
	end;
  Result := 1;
end;

function Foot(Sheet: Variant; aRow: Integer) : Integer;
var
	Range : Variant;
begin
  Inc(aRow);
  Range := Sheet.Range[Sheet.Cells[aRow,1], Sheet.Cells[aRow+2,7]];
  Range.Cells.RowHeight := 30;
  Range.Columns['E'].HorizontalAlignment := -4131;
{  Range.Cells[2, 1] := 'Начальник ПДО';
	Range.Cells[2, 5] := 'А.В. Морозов';}
{	Range.Cells[3, 1] := 'Исполнитель ПДО';
  Range.Cells[3, 5] := 'Н.И. Караваева'; }
	Result := aRow;
end;

procedure SetBorder(Range: Variant; Weight: Integer);
var
	Border : Variant;
  I : Integer;
begin
  for I := 7 to 11 do begin
    Border := Range.Borders[I];	// left
    Border.LineStyle := 1;
    //Border.Weight := Weight;
  end;
  if (Range.Rows.Count > 1) then begin
    Border := Range.Borders[I];	// left
    Border.LineStyle := 1;
  end;
  if (Weight < 0) then
  	Range.Columns['G'].Borders[10].LineStyle := -4119;
end;

procedure PrintFile(Table1 : TTable);
var
  ExcelApp, WorkBook, Sheet, Range : OleVariant;
  aRow, I : Integer;
	iRow, cRows : Integer;
begin
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.DisplayAlerts := False;
  try
    Table1.Open;
  	ExcelApp.Visible := True;

    Workbook := ExcelApp.WorkBooks.Add;
    Sheet := WorkBook.Sheets.Item[1];
    //////////////////////////////////////////////////////////////////
    Sheet.Name := 'Видеограмма ' + IntToStr(iNum);
    Sheet.Cells.Font.Name := 'Times New Roman';
    Sheet.Cells.Font.Size := 14;
    // снять защиту
    Sheet.Cells.Locked := False;
    Sheet.PageSetup.LeftMargin := 72/25.4*20;
		Sheet.PageSetup.TopMargin := 72/25.4*20;
		Sheet.PageSetup.RightMargin := 72/25.4*6;
		Sheet.PageSetup.BottomMargin := 72/25.4*8;

///////////////////////////////////////////////////
    Sheet.PageSetup.Zoom := False;
    Sheet.PageSetup.FitToPagesWide := 1;
    Sheet.PageSetup.FitToPagesTall := False;
    Sheet.PageSetup.PaperSize := 9;

    if iNum=1 then begin
///////////////////////////////////////////////////
      Sheet.Columns['A'].ColumnWidth := 11;
      Sheet.Columns['B'].ColumnWidth := 12;
      Sheet.Columns['C'].ColumnWidth := 15;
      Sheet.Columns['D'].ColumnWidth := 10;
      Sheet.Columns['E'].ColumnWidth := 17;
      Sheet.Columns['F'].ColumnWidth := 10;
      Sheet.Columns['G'].ColumnWidth := 7;
///////////////////////////////////////////////////
    end
    else begin
///////////////////////////////////////////////////
      Sheet.Columns['A'].ColumnWidth := 7;
      Sheet.Columns['B'].ColumnWidth := 12;
      Sheet.Columns['C'].ColumnWidth := 21.7;
      Sheet.Columns['D'].ColumnWidth := 13;
      Sheet.Columns['E'].ColumnWidth := 38;
///////////////////////////////////////////////////
		end;

    aRow := Head(Sheet);
    aRow := aRow + 1;

    cRows := Table1.RecordCount + 1;
    // вся таблица
    if iNum=1 then begin
    	Range := Sheet.Range[Sheet.Cells[aRow,1], Sheet.Cells[aRow+cRows-1,7]];
      Range.Columns['A:D'].HorizontalAlignment := -4108;
      Range.Columns['E'].HorizontalAlignment := -4152;
      Range.Columns['F:G'].HorizontalAlignment := -4108;
      Range.Columns['B'].NumberFormat := '00';
      Range.Columns['C'].NumberFormat := '00000000';
      Range.Columns['D'].NumberFormat := '0000';      
      Range.Columns['E'].NumberFormat := '0,000';
    end
    else begin
    	Range := Sheet.Range[Sheet.Cells[aRow,1], Sheet.Cells[aRow+cRows-1,5]];
      Range.Columns['A:D'].HorizontalAlignment := -4108;
      Range.Columns['E'].HorizontalAlignment := -4131;
      Range.Columns['E'].IndentLevel := 1;
		end;
    Range.Rows[1].Font.Size := 12;
//////////////////////////////////////////////////////////////////////
    Range.Rows[1].HorizontalAlignment := 1;
		Range.Rows[1].VerticalAlignment := -4107;
		Range.Rows[1].WrapText := True;
//////////////////////////////////////////////////////////////////////

    SetBorder(Range, 0);
    Range.Rows[1].HorizontalAlignment := -4108;
    Range.Rows[1].VerticalAlignment := -4108;
    //Range.Rows[1].RowHeight := 26;

    if iNum = 1 then
      for I := 1 to Table1.Fields.Count-1 do
        Range.Cells[1, I] := Table1.Fields[I-1].DisplayLabel
    else begin
      for I := 1 to 5 do
				Range.Cells[1, I] := Table1.Fields[I-1].DisplayLabel;
    end;

    iRow := 2;

    while not Table1.Eof do begin
    	if iNum=1 then begin
				for I := 1 to 7 do begin
					if (I = 5) then
						try
							Range.Cells[iRow, I] := Table1.Fields[I-1].AsFloat;
						except
							Range.Cells[iRow, I] := Null;
						end
					else
						Range.Cells[iRow, I] := Table1.Fields[I-1].AsString;
        end;
      end
      else begin
      	Range.Cells[iRow, 1] := iRow - 1;
      	for I := 2 to 5 do begin
       		Range.Cells[iRow, I] := Table1.Fields[I-1].AsString;
        end;
      end;

      Inc(iRow);
      Table1.Next;
    end;

    // защита ячеек
    Range.Locked := True;
    aRow := aRow + cRows;

    Foot(Sheet, aRow);

    // защита листа
    Sheet.Protect(Password := 'rjcnz', AllowFormattingColumns := True,
    	AllowFormattingRows := True, AllowInsertingRows:=True);

		Workbook.SaveAs(FileName := OutputFile[iNum], ReadOnlyRecommended:=False,
			CreateBackup:=False);
    //Workbook.Close(SaveChanges := True, FileName := OutputFule);
  finally
    Table1.Close;
  	ExcelApp := UnAssigned;
  end;
end;

end.
