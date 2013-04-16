unit PrintDoc;

interface

procedure PrintDocum(DocID:Integer);

implementation
uses Journal,DB,DBTables,Unit1;
procedure PrintDocum(DocID:Integer);
var
  ExcelApp, WorkBook, Sheet, Range: OleVariant;
  aRow, aCol, I, j: Integer;
  TableRow: TTable;
  CurIndex: Integer;
  iRow: Integer;
  iRec: TRecord;
  TableBegin: integer;
  iQ, iM, iT, iKol: Integer;
  TMSKolAr: array[1..3] of Integer;
  FExcelLanguageID: integer;
  mso2003, isTMC, isFirst: Boolean;
  mso2003s: string;
  sPrevPrim, sPrimTek: string; //хранит примечание из предыдущ записи
begin
  isTMC := False; // если будет “ћ÷ надо будет вставл€ть разрыв строк
  isFirst := True; // перва€ ли это таблица
  if sDocName = '' then
  begin
    bDocNameClick(nil);
  end;
  ButtonExcel.Enabled:=False;
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

  FExcelLanguageID := ExcelApp.LanguageSettings.LanguageID[msoLanguageIDUI];
  try
    ExcelApp.Visible := ShowExcel;
    Workbook := ExcelApp.WorkBooks.Add;

    for I := 1 to WorkBook.Sheets.Count - 1 do
      WorkBook.Sheets.Item[I].Delete;
    Sheet := WorkBook.Sheets.Item[1];

    Sheet.Name := csDocSheetName_1;
    Sheet.Cells.Font.Name := csDocFont_1;
    Sheet.Cells.Font.Size := FontSize;
    // сн€ть защиту
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

    aRow := Head(Sheet);
    Inc(aRow);

    for iRow := 0 to RowList.Count - 1 do
    begin
      iRec := RowList.Items[iRow];
      Sheet.Cells[aRow, 1].Font.Bold := True;
      Range := Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow, 22]];
      Range.Merge;
      Range.HorizontalAlignment := -4108;
      Range.VerticalAlignment := -4108;
      Sheet.Rows[aRow].RowHeight := 27;
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
                Sheet.Cells[TableBegin + TableRow.RecordCount, 22]];
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
                sPrimTek := TableRow.Fields[TableRow.FieldCount - 5].AsString;
                if sPrimTek = sPrevPrim then
                  Sheet.Cells[aRow, 22] := csDocPrim
                else
                begin
                  Sheet.Cells[aRow, 22] := sPrimTek;
                  sPrevPrim := sPrimTek;
                end;

                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;

              TableRow.Close;

              // защита €чеек
              Sheet.Range[Sheet.Cells[TableBegin - 2, 1], Sheet.Cells[aRow - 1,
                21]].Locked := True;
            end;
          end;
        2: //строка
          begin
            Range.HorizontalAlignment := -4108;
          end;
        3, 5: //таблица корректировки лимита и остатка лимита “ћ÷ мес€ц
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
              //мес€ц
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
              (* Sheet.Range[Sheet.Cells[aRow, 8], Sheet.Cells[aRow + 1, 8]].Merge;
               //       Sheet.Range[Sheet.Cells[aRow, 8], Sheet.Cells[aRow + 1, 8]].wraptext;
               Sheet.Range[Sheet.Cells[aRow, 9], Sheet.Cells[aRow + 1,
                 22]].Merge;
               //            Sheet.Range[Sheet.Cells[aRow, 22], Sheet.Cells[aRow + 1, 22]].Merge;
                *)
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                22]].HorizontalAlignment :=
                -4108;
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                22]].VerticalAlignment :=
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
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                22]].Font.Bold := True;
              SetBorder(Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                22]], 0);
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
              {
              CurIndex := iRec.Sort;

              TableRow.IndexDefs.Update;
              if (CurIndex < TableRow.IndexDefs.Count) then
                TableRow.IndexName := TableRow.IndexDefs.Items[CurIndex].Name;
              }
              aRow := aRow + 2;
              TableBegin := aRow;

              Range := Sheet.Range[Sheet.Cells[TableBegin, 1],
                Sheet.Cells[TableBegin
                + TableRow.RecordCount - 1, 22]];

              SetBorder(Range, -1);
              //Sheet.Range[Sheet.Cells[aRow, 10], Sheet.Cells[aRow + TableRow.RecordCount - 1, 22]].NumberFormat := '00';

              TableRow.First;
              I := 1;
              while not TableRow.Eof do
              begin
                Sheet.Cells[aRow, 1] := I;
                Sheet.Cells[aRow, 3].HorizontalAlignment := -4131;
                Sheet.Cells[aRow, 4].Font.Size := ChertFontSize;
                Sheet.Cells[aRow, 3] := TableRow.Fields[3].AsString;
                Sheet.Cells[aRow, 4].NumberFormat := '@';
                Sheet.Cells[aRow, 4] := TableRow.Fields[2].AsString;
                Sheet.Cells[aRow, 5] := TableRow.Fields[7].AsString;
                Sheet.Cells[aRow, 5].HorizontalAlignment := -4108;
                Sheet.Range[Sheet.Cells[aRow, 6], Sheet.Cells[aRow, 7]].Merge;
                //мес€ц
                Sheet.Cells[aRow, 6] := TableRow.Fields[4].AsFloat;
                Sheet.Cells[aRow, 6].NumberFormat := '0,000';
                Sheet.Cells[aRow, 6].HorizontalAlignment := -4152;
                Sheet.Range[Sheet.Cells[aRow, 8], Sheet.Cells[aRow, 10]].Merge;
                Sheet.Cells[aRow, 8] := TableRow.Fields[1].AsString;
                Sheet.Cells[aRow, 8].HorizontalAlignment := -4108;
                Sheet.Range[Sheet.Cells[aRow, 11], Sheet.Cells[aRow, 15]].Merge;
                Sheet.Cells[aRow, 11].HorizontalAlignment := -4108;
                Sheet.Cells[aRow, 11] := TableRow.Fields[6].AsString;
                Sheet.Range[Sheet.Cells[aRow, 16], Sheet.Cells[aRow, 22]].Merge;
                //Sheet.Cells[aRow, 16] := TableRow.Fields[9].AsString;
                sPrimTek := TableRow.Fields[9].AsString;
                if sPrimTek = sPrevPrim then
                  Sheet.Cells[aRow, 16] := csDocPrim
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

              // защита €чеек
              Sheet.Range[Sheet.Cells[TableBegin - 2, 1], Sheet.Cells[aRow - 1,
                22]].Locked := True;
            end;
          end;
        4: //таблица корректировки лимита “ћ÷ квартал
          begin
            if FileExists(StartDir + WorkName + csSymb_BackSlash + csNP01F +
              IntToStr(iRec.Digit) + csDBExt) = True then
            begin
              Inc(aRow);
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
              //            Sheet.Range[Sheet.Cells[aRow, 22], Sheet.Cells[aRow + 1, 22]].Merge;

              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                22]].HorizontalAlignment :=
                -4108;
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                22]].VerticalAlignment :=
                -4108;
              Sheet.Cells[aRow, 1] := csDocColumn_1;
              Sheet.Cells[aRow, 2] := csDocColumn_2;
              Sheet.Cells[aRow, 4] := csDocColumn_11;
              Sheet.Cells[aRow, 5] := csDocColumn_12;
              Sheet.Cells[aRow, 6] := csDocColumn_15;
              // Sheet.Cells[aRow, 6] := SysUtils.LongMonthNames[StrToInt(iRec.Data)];
              Sheet.Cells[aRow, 9] := csDocColumn_13;
              Sheet.Cells[aRow, 13] := csDocColumn_14;
              Sheet.Cells[aRow, 17] := csDocColumn_9;
              // название мес€цев
              if iT = 2 then
              begin //буд квартал, все мес
                iKol := 3;
              end
              else if iT = 1 then
              begin //текущий квартал, анализируем мес€ца
                iKol := 4 - iM;
              end;
              i := iKol;
              while i > 0 do
              begin
                Sheet.Cells[aRow + 1, 9 - i] := SysUtils.LongMonthNames[(iQ - 1)
                  *
                  3 +
                  4 - i];
                Dec(i);
              end;
              // -----
              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                22]].Font.Bold := True;
              SetBorder(Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                22]], 0);
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
                + TableRow.RecordCount - 1, 22]];

              SetBorder(Range, -1);
              { Sheet.Range[Sheet.Cells[aRow, 10], Sheet.Cells[aRow +
                 TableRow.RecordCount - 1, 22]].NumberFormat := '00';
               }
              TableRow.First;
              I := 1;
              while not TableRow.Eof do
              begin
                Sheet.Cells[aRow, 1] := I;
                Sheet.Cells[aRow, 3].HorizontalAlignment := -4131;
                Sheet.Cells[aRow, 4].Font.Size := ChertFontSize;
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
                //Sheet.Cells[aRow, 17] := TableRow.Fields[9].AsString;
                sPrimTek := TableRow.Fields[9].AsString;
                if sPrimTek = sPrevPrim then
                  Sheet.Cells[aRow, 17] := csDocPrim
                else
                begin
                  Sheet.Cells[aRow, 17] := sPrimTek;
                  sPrevPrim := sPrimTek;
                end;
                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;
              TableRow.Close;

              // защита €чеек
              Sheet.Range[Sheet.Cells[TableBegin - 2, 1], Sheet.Cells[aRow - 1,
                22]].Locked := True;
            end;
          end;
        6, 7: // орректировка плана и лимита, корректировка лимита
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
              // название мес€цев
              if iT = 2 then
              begin //буд квартал, все мес
                iKol := 3;
              end
              else if iT = 1 then
              begin //текущий квартал, анализируем мес€ца
                iKol := 4 - iM;
              end;

              Sheet.Cells[aRow + 1, 6] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                1];
              Sheet.Cells[aRow + 1, 7] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                2];
              Sheet.Cells[aRow + 1, 8] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                3];
              Sheet.Cells[aRow, 9] := iRec.Marsh;
              Sheet.Cells[aRow, 22] := iRec.Prim;

              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                22]].Font.Bold
                := True;
              SetBorder(Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                22]],
                  0);

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
                Sheet.Cells[TableBegin
                + TableRow.RecordCount - 1, 22]];

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
                sPrimTek := TableRow.Fields[TableRow.FieldCount - 5].AsString;
                if sPrimTek = sPrevPrim then
                  Sheet.Cells[aRow, 22] := csDocPrim
                else
                begin
                  Sheet.Cells[aRow, 22] := sPrimTek;
                  sPrevPrim := sPrimTek;
                end;

                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;

              TableRow.Close;

              // защита €чеек
              Sheet.Range[Sheet.Cells[TableBegin - 2, 1], Sheet.Cells[aRow - 1,
                21]].Locked := True;
            end;
          end;
        8: // орректировка плана и лимита, корректировка лимита
          begin
            if FileExists(StartDir + WorkName + csSymb_BackSlash + csNP01F +
              IntToStr(iRec.Digit) + csDBExt) = True then
            begin
              Inc(aRow);
              GetFromKod2(StrToInt(iRec.Data), iQ, iM, iT);
              if (iT = 2) and (iM = 1) then
                Inc(iQ);
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
              Sheet.Cells[aRow + 1, 6] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                1];
              Sheet.Cells[aRow + 1, 7] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                2];
              Sheet.Cells[aRow + 1, 8] := SysUtils.LongMonthNames[(iQ - 1) * 3 +
                3];
              Sheet.Cells[aRow, 9] := iRec.Marsh;
              Sheet.Cells[aRow, 22] := iRec.Prim;

              Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                22]].Font.Bold
                := True;
              SetBorder(Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
                22]],
                  0);

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
                Sheet.Cells[TableBegin
                + TableRow.RecordCount - 1, 22]];

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
                sPrimTek := TableRow.Fields[TableRow.FieldCount - 5].AsString;
                if sPrimTek = sPrevPrim then
                  Sheet.Cells[aRow, 22] := csDocPrim
                else
                begin
                  Sheet.Cells[aRow, 22] := sPrimTek;
                  sPrevPrim := sPrimTek;
                end;
                Inc(aRow);
                Inc(I);
                TableRow.Next;
              end;

              TableRow.Close;

              // защита €чеек
              Sheet.Range[Sheet.Cells[TableBegin - 2, 1], Sheet.Cells[aRow - 1,
                21]].Locked := True;
            end;
          end;

      end;
      {if (iRec.Kod = 2) then
      begin
        Range.HorizontalAlignment := -4131;
      end
      else if (iRec.Kod = 1) then
      begin
        Inc(aRow);

        Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1, 1]].Merge;
        Sheet.Range[Sheet.Cells[aRow, 2], Sheet.Cells[aRow + 1, 3]].Merge;
        Sheet.Range[Sheet.Cells[aRow, 4], Sheet.Cells[aRow + 1, 4]].Merge;
        Sheet.Range[Sheet.Cells[aRow, 5], Sheet.Cells[aRow + 1, 5]].Merge;
        Sheet.Range[Sheet.Cells[aRow, 6], Sheet.Cells[aRow, 8]].Merge;
        Sheet.Range[Sheet.Cells[aRow, 9], Sheet.Cells[aRow + 1, 21]].Merge;
        Sheet.Range[Sheet.Cells[aRow, 22], Sheet.Cells[aRow + 1, 22]].Merge;

        Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
          22]].HorizontalAlignment :=
          -4108;
        Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1,
          22]].VerticalAlignment :=
          -4108;
        Sheet.Cells[aRow, 1] := 'єє';
        Sheet.Cells[aRow, 2] := ' од';
        Sheet.Cells[aRow, 4] := '„ертЄж';
        Sheet.Cells[aRow, 5] := ' ол';
        Sheet.Cells[aRow, 6] := 'ћес€ц';
        Sheet.Cells[aRow + 1, 6] := 'I';
        Sheet.Cells[aRow + 1, 7] := 'II';
        Sheet.Cells[aRow + 1, 8] := 'III';
        Sheet.Cells[aRow, 9] := iRec.Marsh;
        Sheet.Cells[aRow, 22] := iRec.Prim;

        Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1, 22]].Font.Bold
          := True;
        SetBorder(Sheet.Range[Sheet.Cells[aRow, 1], Sheet.Cells[aRow + 1, 22]],
          0);

        TableRow.DatabaseName := StartDir + WorkName + '\';
        TableRow.TableName := 'NP01F' + IntToStr(iRec.Digit);

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

        Range := Sheet.Range[Sheet.Cells[TableBegin, 1], Sheet.Cells[TableBegin
          + TableRow.RecordCount - 1, 22]];

        SetBorder(Range, -1);
        Sheet.Range[Sheet.Cells[aRow, 10], Sheet.Cells[aRow +
          TableRow.RecordCount - 1, 21]].NumberFormat := '00';

        TableRow.First;
        I := 1;
        while not TableRow.Eof do
        begin
          Sheet.Cells[aRow, 1] := I;
          Sheet.Cells[aRow, 3].HorizontalAlignment := -4131;

          for aCol := 3 to 8 do
            Sheet.Cells[aRow, aCol] := TableRow.Fields[aCol - 2].AsString;
          for aCol := 10 to 21 do
            Sheet.Cells[aRow, aCol] := TableRow.Fields[aCol - 3].AsString;

          Sheet.Cells[aRow, 22] := TableRow.Fields[TableRow.FieldCount -
            1].AsString;

          Inc(aRow);
          Inc(I);
          TableRow.Next;
        end;

        TableRow.Close;
        // защита €чеек
        Sheet.Range[Sheet.Cells[TableBegin - 2, 1], Sheet.Cells[aRow - 1,
          21]].Locked := True;
      end;}
      aRow := aRow + 2;
    end; // for iRow := 0 to Rowlist.Count-1

    //    Foot(Sheet, aRow+2);

    Sheet.PageSetup.PrintArea := 'A1:V' + IntToStr(aRow + 1);

    // защита листа
    Sheet.Protect(Password := csDocPasw, AllowFormattingColumns := True,
      AllowFormattingRows := True, AllowInsertingRows := True);

    DeleteFile(OutputFile);
    if mso2003 = False then
      Workbook.SaveAs(FileName := OutputFile, ReadOnlyRecommended := False,
        CreateBackup := False, FileFormat := 56)
    else
      Workbook.SaveAs(FileName := OutputFile, ReadOnlyRecommended := False,
        CreateBackup := False);
    //Workbook.Close(SaveChanges := True, FileName := OutputFule);
    ExcelApp.Visible := True;

  finally
    //ExcelApp.Quit;
    ExcelApp := UnAssigned;
    TableRow.Free;
    ButtonExcel.Enabled:=True;
  end;
end;

end.
