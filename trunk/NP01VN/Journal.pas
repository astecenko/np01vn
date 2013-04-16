unit Journal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, Grids, DBGrids, DBTables,
  DBGridEhGrouping, GridsEh, DBGridEh, Buttons, ExtCtrls, ComCtrls, Index,
  Constants;

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
    btn5: TBitBtn;
    btnFiltr1: TSpeedButton;
    mfldtbl1Spravka: TMemoField;
    dlgSave1: TSaveDialog;
    pnl2: TPanel;
    pnl3: TPanel;
    spl1: TSplitter;
    pnl4: TPanel;
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
    btnFiltr6: TSpeedButton;
    stat1: TStatusBar;
    dtfldtbl2SDate: TDateField;
    strngfldtbl2Doc: TStringField;
    strngfldtbl1Doc: TStringField;
    btn4: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure dbgrdh1Columns8GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgrdh1Columns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgrdh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure btn5Click(Sender: TObject);
    procedure tbl1MarkChange(Sender: TField);
    procedure dbgrdh1Columns1GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgrdh1DblClick(Sender: TObject);
    procedure btnFiltr0Click(Sender: TObject);
    procedure dbgrdh1Columns9GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure btnFiltr1Click(Sender: TObject);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure dbgrdh1Columns3GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure btn4Click(Sender: TObject);
  private
    procedure Add2Journal(JournalTable: TTable; ItemTable: TTable;
      Zapis: TRecord; TempFile: string; DocumID: Integer; OldDigit: Integer;
      MonthNum: Integer; KolField: string = csField_Kol; Ostatok: Boolean =
      False; DataInc: Integer = 0);
    procedure Add2JournalP8(JournalTable: TTable; ItemTable: TTable; Zapis:
      TRecord; DocumID: Integer; MonthNum: Integer; OldDigit: Integer);
    procedure Add2JournalP8_8(JournalTable: TTable; ItemTable: TTable;
      Zapis: TRecord; DocumID: Integer; OldDigit: Integer);

  public
    procedure Write2Blob(FileName: string; Table1: TTable; FieldName: string);
    procedure Blob2File(FileName: string; Table1: TDBDataSet; FieldName:
      string);
    procedure SetJournalFilter;
  end;

var
  FmJournal: TFmJournal;

implementation
uses NewString, Main, Ost, DateUtils, ShellApi, KoaUtils, Start, Arhiv;
{$R *.dfm}
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

procedure TFmJournal.Blob2File(FileName: string; Table1: TDBDataSet; FieldName:
  string);
var
  blob: TStream;
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
    FreeAndNil(blob);
  end;
end;

procedure TFmJournal.SetJournalFilter();
var
  bNeedAnd: Boolean;
  i: Integer;
  filtr: string;

  procedure NeedAnd();
  begin
    if bNeedAnd = True then
      filtr := filtr + ' AND ';
  end;

begin
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
      bNeedAnd := True;
    end;
  tbl1.Filtered := False;
  if bNeedAnd = True then
  begin
    tbl1.Filter := filtr;
    tbl1.Filtered := True;
  end;
  tbl1.EnableControls;
end;

// добавление записи типа лимит, ост. лимита Макет 42

procedure TFmJournal.Add2Journal(JournalTable: TTable; ItemTable: TTable; Zapis:
  TRecord; TempFile: string; DocumID: Integer; OldDigit: Integer; MonthNum:
  Integer; KolField: string = csField_Kol;
  Ostatok: Boolean = False; DataInc: Integer = 0);
var
  i: Integer;
begin
  i := frm42.CreateMak42(TempFile, ItemTable, KolField, Ostatok);
  if i > 0 then
  begin
    JournalTable.Append;
    JournalTable.FieldByName(csField_Tname).AsString := Zapis.Title;
    JournalTable.FieldByName(csField_Kod).AsInteger := Zapis.Kod;
    JournalTable.FieldByName(csField_FnId).AsInteger := DocumID;
    JournalTable.FieldByName(csField_Digit).AsInteger := Zapis.Digit;
    JournalTable.FieldByName(csField_OldDigit).AsInteger := OldDigit;
    JournalTable.FieldByName(csField_Makname).AsString := csMaketName_42;
    JournalTable.FieldByName(csField_Data).AsString := Zapis.Data;
    JournalTable.FieldByName(csField_Kl).AsInteger := i;
    fCopyFile(TempFile, ItemTable.DatabaseName + csNP01F + inttostr(Zapis.Digit)
      + csMakFilePostfix);
    frm42.Spr(TempFile, ItemTable);
    case JournalTable.FieldByName(csField_Kod).AsInteger of
      3, 5:
        begin
          //JournalTable.FieldByName(csField_Mmyyyy).AsString := SysUtils.LongMonthNames[strtoint(Zapis.Data)];
          if Length(Zapis.Data) = 1 then
            JournalTable.FieldByName(csField_Mmyyyy).AsString := '0' + Zapis.Data
              + '.' + inttostr(CurYear)
          else
            JournalTable.FieldByName(csField_Mmyyyy).AsString := Zapis.Data + '.'
              + inttostr(CurYear);

        end;
      4:
        begin
          if MonthNum > 0 then
          begin
            JournalTable.FieldByName(csField_Mmyyyy).AsString := '';
            if MonthNum < 10 then
              JournalTable.FieldByName(csField_Mmyyyy).AsString := '0';
            JournalTable.FieldByName(csField_Mmyyyy).AsString :=
              JournalTable.FieldByName(csField_Mmyyyy).AsString +
              IntToStr(MonthNum)
              + '.' + inttostr(CurYear);
          end;
        end;
    end;
    fCopyFile(TempFile, ItemTable.DatabaseName + csNP01F + inttostr(Zapis.Digit)
      + csSprFilePostfix);
    JournalTable.FieldByName(csField_Sdate).AsDateTime := Date;
    JournalTable.Post;
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

//SDate - дата обработки
//PDate - дата отправки из ПДО
//WDate - дата взятия на обработку в ОАСУП

procedure TFmJournal.Add2JournalP8(JournalTable: TTable; ItemTable: TTable;
  Zapis: TRecord; DocumID: Integer; MonthNum: Integer; OldDigit: Integer);
var
  sYear: string;
begin
  JournalTable.Append;
  JournalTable.FieldByName(csField_Tname).AsString := Zapis.Title;
  JournalTable.FieldByName(csField_Kod).AsInteger := Zapis.Kod;
  JournalTable.FieldByName(csField_FnId).AsInteger := DocumID;
  JournalTable.FieldByName(csField_Kl).AsInteger := ItemTable.RecordCount;
  if (Zapis.Data <> csSymb_Null) and (MonthNum > 0) then
  begin
    if (Zapis.Data[1] = '1') and (Zapis.Data[3] = '2') then
      sYear := IntToStr(CurYear + 1)
    else if (Zapis.Data[1] = '4') and (Zapis.Data[3] = '0') then
      sYear := IntToStr(CurYear - 1)
    else
      sYear := IntToStr(CurYear);
    JournalTable.FieldByName(csField_Mmyyyy).AsString :=
      GettMMFromKod2(Zapis.Data, MonthNum) + csSymb_Dot + sYear;
  end
  else
  begin

  end;
  JournalTable.FieldByName(csField_Data).AsString := Zapis.Data;
  JournalTable.FieldByName(csField_Makname).AsString := csMaketName_P8;
  JournalTable.FieldByName(csField_Digit).AsInteger := Zapis.Digit;
  JournalTable.FieldByName(csField_OldDigit).AsInteger := OldDigit;
  JournalTable.FieldByName(csField_sdate).AsDateTime := Date;
  JournalTable.Post;
end;

procedure TFmJournal.Add2JournalP8_8(JournalTable: TTable; ItemTable: TTable;
  Zapis: TRecord; DocumID: Integer; OldDigit: Integer);
var
  iYear: Integer;
  iMonth: Integer;
  iQuart: Integer;
  sMmyyyy: string;
begin
  JournalTable.Append;
  JournalTable.FieldByName(csField_Tname).AsString := Zapis.Title;
  JournalTable.FieldByName(csField_Kod).AsInteger := Zapis.Kod;
  JournalTable.FieldByName(csField_FnId).AsInteger := DocumID;
  JournalTable.FieldByName(csField_Kl).AsInteger := ItemTable.RecordCount;
  if Zapis.Data[3] = '2' then
  begin
    if (Zapis.Data[1] = '4') and (Zapis.Data[2] = '3') then
    begin
      iMonth := 1;
      iQuart := 1;
      iYear := CurYear + 1;
    end
    else if Zapis.Data[2] = '3' then
    begin
      iMonth := 1;
      iQuart := StrToInt(Zapis.Data[1]) + 1;
      iYear := CurYear;
    end
    else
    begin
      iMonth := StrToInt(Zapis.Data[2]) + 1;
      iQuart := StrToInt(Zapis.Data[1]);
      iYear := CurYear;
    end;
  end
  else
  begin
    iMonth := StrToInt(Zapis.Data[2]);
    iQuart := StrToInt(Zapis.Data[1]);
    iYear := CurYear;
  end;
  sMmyyyy := IntToStr((iQuart - 1) * 3 + iMonth);
  if Length(sMmyyyy) = 1 then
    sMmyyyy := '0' + sMmyyyy;
  JournalTable.FieldByName(csField_Mmyyyy).AsString := sMmyyyy + csSymb_Dot +
    IntToStr(iYear);
  JournalTable.FieldByName(csField_Makname).AsString := csMaketName_P8;
  JournalTable.FieldByName(csField_Data).AsString := Zapis.Data;
  JournalTable.FieldByName(csField_sdate).AsDateTime := Date;
  JournalTable.FieldByName(csField_OldDigit).AsInteger := OldDigit;
  JournalTable.FieldByName(csField_Digit).AsInteger := Zapis.Digit;
  JournalTable.Post;
end;

{function GetArhiveTMSPath: string;
begin
  //Result := ArhivTMSDir + '20' + Copy(sDocName, 21, 2);
  Result := ArhivTMSDir;
end;}

procedure TFmJournal.FormShow(Sender: TObject);
var
  i, x: Integer;
  iQ, iT, iM: Integer;
  t, t1, t2, t3, t0: TTable;
  t_tms_0, t_tms_1, t_tms_2: TTable; //архив ТМЦ
  t_chert_0, t_chert_1, t_chert_2: TTable; //архив чертежей
  opiutmc_table: TTable;
  b_tms_0, b_chert_0 {, b_tms_1}: Boolean;
  // чтобы отследить добавлен документ и таблиц
  MaxDig: array[1..3] of Integer;
  iRec, iRec2: TRecord;
  fname {, idata}, maxdigit: Integer;
  sfilename: string;
  MnthNum: Integer;
  b, b2: Boolean;

  //процедура вызывается в цикле, служит для разделения таблицы квартальной на месячные таблицы
  procedure GetFromToPlan(TableIn, TableOut: TTable; TableMonth: Integer = 1);
  var
    iiii: Integer;
    ssss: string;
  begin
    ssss := inttostr(TableMonth);
    //проверка, если количество не задали или ноль то игнорируем
    if (TableIn.FieldByName('Kol' + ssss).AsInteger <> 0) and
      (TableIn.FieldByName('Kol' + ssss).AsInteger <> null) then
    begin
      TableOut.Append;
      TableOut.FieldByName(csField_Kod).AsInteger :=
        TableIn.FieldByName(csField_Kod).AsInteger;
      TableOut.FieldByName(csField_Chert).AsString :=
        TableIn.FieldByName(csField_Chert).AsString;
      iiii := 1;
      while iiii < 25 do
      begin
        TableOut.FieldByName('TM' + inttostr(iiii)).AsString :=
          TableIn.FieldByName('TM' + inttostr(iiii)).AsString;
        inc(iiii);
      end;
      TableOut.FieldByName('Kol' + ssss).AsInteger :=
        TableIn.FieldByName('Kol' + ssss).AsInteger;
      TableOut.FieldByName('Kol').AsInteger :=
        TableIn.FieldByName('Kol' + ssss).AsInteger;
      TableOut.FieldByName(csField_Primech).AsString :=
        TableIn.FieldByName(csField_Primech).AsString;
      TableOut.Post;
    end;
  end;

  //процедура вызывается в цикле, служит для выборки 2 и 3 мес кварт в отд табл
  procedure GetFromToPlan2(TableIn, TableOut: TTable);
  var
    iiii: Integer;
  begin
    //проверка, если количество не задали или ноль то игнорируем
    if ((TableIn.FieldByName('Kol2').AsInteger <> 0) and
      (TableIn.FieldByName('Kol2').Value <> null)) or
      ((TableIn.FieldByName('Kol3').AsInteger <> 0) and
      (TableIn.FieldByName('Kol3').Value <> null)) then
    begin
      TableOut.Append;
      TableOut.FieldByName(csField_Kod).AsInteger :=
        TableIn.FieldByName(csField_Kod).AsInteger;
      TableOut.FieldByName(csField_Chert).AsString :=
        TableIn.FieldByName(csField_Chert).AsString;
      iiii := 1;
      while iiii < 25 do
      begin
        TableOut.FieldByName('TM' + inttostr(iiii)).AsString :=
          TableIn.FieldByName('TM' + inttostr(iiii)).AsString;
        inc(iiii);
      end;
      if TableIn.FieldByName('Kol2').Value <> null then
      begin
        TableOut.FieldByName('Kol2').AsInteger :=
          TableIn.FieldByName('Kol2').AsInteger;
        TableOut.FieldByName('Kol').AsInteger :=
          TableIn.FieldByName('Kol2').AsInteger;
      end
      else
        TableOut.FieldByName('Kol').AsInteger := 0;
      if TableIn.FieldByName('Kol3').Value <> null then
      begin
        TableOut.FieldByName('Kol3').AsInteger :=
          TableIn.FieldByName('Kol3').AsInteger;
        TableOut.FieldByName('Kol').AsInteger :=
          TableOut.FieldByName('Kol').AsInteger +
          TableIn.FieldByName('Kol3').AsInteger;
      end;
      TableOut.FieldByName(csField_Primech).AsString :=
        TableIn.FieldByName(csField_Primech).AsString;
      TableOut.Post;
    end;
  end;

  //добавление документа в NP01VN01_0.DB
  procedure AddDoc2ArhTMS;
  begin
    if b_tms_0 = False then
    begin
      if t_tms_0.Locate('Title', WorkName, [loCaseInsensitive]) = False then
      begin
        t_tms_0.Append;
        t_tms_0.FieldByName('Title').AsString := WorkName;
        t_tms_0.FieldByName('DDate').AsDateTime := FormIndex.sDocNameToDate;
        t_tms_0.FieldByName('Sdate').AsDateTime := Date;
        t_tms_0.FieldByName('NameDoc').AsString := sDocName;
        t_tms_0.Post;
      end
      else
        ShowMessage('Документ уже существует в архиве корректировок ТМЦ. Данные будут добавляться к этому документу!');
      b_tms_0 := True;
    end;
  end;

  //добавление документа в NP01VN02_0.DB
  procedure AddDoc2ArhChert;
  begin
    if b_chert_0 = False then
    begin
      if t_chert_0.Locate('Title', WorkName, [loCaseInsensitive]) = False then
      begin
        t_chert_0.Append;
        t_chert_0.FieldByName('Title').AsString := WorkName;
        t_chert_0.FieldByName('DDate').AsDateTime := FormIndex.sDocNameToDate;
        t_chert_0.FieldByName('Sdate').AsDateTime := Date;
        t_chert_0.FieldByName('NameDoc').AsString := sDocName;
        t_chert_0.Post;
      end
      else
        ShowMessage('Документ уже существует в архиве корректировок чертежей. Данные будут добавляться к этому документу!');
      b_chert_0 := True;
    end;
  end;

  //добавление таблиц в NP01VN_TMS_1.DB и NP01VN_TMS_2.DB
  procedure AddTable2ArhTMS(TableIn: TTable; const Kod_1: Integer = 0;
    const QuartIn: integer = 0);
  var
    month_1: Integer;

    procedure AddTable2Arh_Sub;
    begin
      t_tms_2.FieldByName('TableID').AsInteger :=
        t_tms_1.FieldByName('TableID').AsInteger;
      t_tms_2.FieldByName('Vp').AsString :=
        TableIn.FieldByName('Vp').AsString;
      t_tms_2.FieldByName('Cp').AsString :=
        TableIn.FieldByName('Cp').AsString;
      t_tms_2.FieldByName('Shifr').AsString :=
        TableIn.FieldByName('Shifr').AsString;
      t_tms_2.FieldByName('KI').AsString :=
        TableIn.FieldByName('KI').AsString;
      t_tms_2.FieldByName('Podrazd').AsInteger :=
        TableIn.FieldByName('Podrazd').AsInteger;
      t_tms_2.FieldByName('Znak').AsString :=
        TableIn.FieldByName('Znak').AsString;
      t_tms_2.FieldByName('Eim').AsString :=
        TableIn.FieldByName('Eim').AsString;
      t_tms_2.FieldByName('Primech').AsString :=
        TableIn.FieldByName('Primech').AsString;
      t_tms_2.FieldByName('Norma').AsString :=
        TableIn.FieldByName('Norma').AsString;
    end;

  begin
    if TableIn.RecordCount > 0 then
    begin
      t_tms_1.Append;
      t_tms_1.FieldByName('DocID').AsInteger :=
        t_tms_0.FieldByName('DocID').AsInteger;
      t_tms_1.FieldByName('Title').AsString := iRec.Title;
      t_tms_1.FieldByName('Kod').AsInteger := iRec.Kod;
      t_tms_1.FieldByName('Data').AsString := iRec.Data;
      t_tms_1.FieldByName('Digit').AsInteger := iRec.Digit;
      t_tms_1.FieldByName('Quart').AsInteger := QuartIn;
      t_tms_1.Post;
      TableIn.First;
      if Kod_1 = 0 then
        while not (TableIn.Eof) do //пишем весь квартал
        begin
          t_tms_2.Append;
          AddTable2Arh_Sub;
          t_tms_2.FieldByName('Kol').AsString :=
            TableIn.FieldByName('Kol').AsString;
          t_tms_2.FieldByName('Kol2').AsString :=
            TableIn.FieldByName('Kol2').AsString;
          t_tms_2.FieldByName('Kol3').AsString :=
            TableIn.FieldByName('Kol3').AsString;
          t_tms_2.FieldByName('Kol_m').AsString :=
            TableIn.FieldByName('Kol_m').AsString;
          t_tms_2.FieldByName('Kol_m2').AsString :=
            TableIn.FieldByName('Kol_m2').AsString;
          t_tms_2.FieldByName('Kol_m3').AsString :=
            TableIn.FieldByName('Kol_m3').AsString;
          t_tms_2.Post;
          TableIn.Next;
        end
      else
      begin // определяем месяц и пишем только его
        month_1 := Main.Form1.GetMonthOfQuartal(Kod_1);
        while not (TableIn.Eof) do //пишем весь квартал
        begin
          t_tms_2.Append;
          AddTable2Arh_Sub;
          case month_1 of
            1:
              begin
                t_tms_2.FieldByName('Kol').AsString :=
                  TableIn.FieldByName('Kol').AsString;
                t_tms_2.FieldByName('Kol_m').AsString :=
                  TableIn.FieldByName('Kol_m').AsString;
              end;
            2:
              begin
                t_tms_2.FieldByName('Kol2').AsString :=
                  TableIn.FieldByName('Kol').AsString;
                t_tms_2.FieldByName('Kol_m2').AsString :=
                  TableIn.FieldByName('Kol_m').AsString;
              end;
            3:
              begin
                t_tms_2.FieldByName('Kol3').AsString :=
                  TableIn.FieldByName('Kol').AsString;
                t_tms_2.FieldByName('Kol_m3').AsString :=
                  TableIn.FieldByName('Kol_m').AsString;
              end;
          end;
          t_tms_2.Post;
          TableIn.Next;
        end;
      end;
    end;
  end;

  //добавление таблиц в NP01VN02_1.DB и NP01VN0_2.DB
  procedure AddTable2ArhChert(TableIn: TTable; const QuartIn: integer = 0);
  var
    month_1: Integer;

    procedure AddTable2Arh_Sub;
    var
      j: integer;
      s1: string;
    begin
      t_chert_2.FieldByName('TableID').AsInteger :=
        t_chert_1.FieldByName('TableID').AsInteger;
      t_chert_2.FieldByName('Kod').AsString :=
        TableIn.FieldByName('Kod').AsString;
      t_chert_2.FieldByName('Chert').AsString :=
        TableIn.FieldByName('Chert').AsString;
      t_chert_2.FieldByName('Kol_1').AsString :=
        TableIn.FieldByName('Kol_1').AsString;
      for j := 1 to 24 do
      begin
        s1 := 'TM' + inttostr(j);
        t_chert_2.FieldByName(s1).AsString := TableIn.FieldByName(s1).AsString;
      end;
      t_chert_2.FieldByName('Kol').AsString :=
        TableIn.FieldByName('Kol').AsString;
      t_chert_2.FieldByName('Kol1').AsInteger :=
        TableIn.FieldByName('Kol1').AsInteger;
      t_chert_2.FieldByName('Kol2').AsString :=
        TableIn.FieldByName('Kol2').AsString;
      t_chert_2.FieldByName('Kol3').AsString :=
        TableIn.FieldByName('Kol3').AsString;
      t_chert_2.FieldByName('Primech').AsString :=
        TableIn.FieldByName('Primech').AsString;
    end;

  begin
    if TableIn.RecordCount > 0 then
    begin
      t_chert_1.Append;
      t_chert_1.FieldByName('DocID').AsInteger :=
        t_chert_0.FieldByName('DocID').AsInteger;
      t_chert_1.FieldByName('Title').AsString := iRec.Title;
      t_chert_1.FieldByName('Kod').AsInteger := iRec.Kod;
      t_chert_1.FieldByName('Data').AsString := iRec.Data;
      t_chert_1.FieldByName('Digit').AsInteger := iRec.Digit;
      t_chert_1.FieldByName('Quart').AsInteger := QuartIn;
      t_chert_1.Post;
      TableIn.First;
      while not (TableIn.Eof) do //пишем весь квартал
      begin
        t_chert_2.Append;
        AddTable2Arh_Sub;
        t_chert_2.Post;
        TableIn.Next;
      end
    end;
  end;

begin
  x := 0;
  b := False;
  b2 := False;
  iRec2 := TRecord.Create(0, 0, '');
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
  except
    ShowMessage(csErrorMsg_ServiceTable);
  end;
  { TODO -oСтеценко А.В. -cСделать : Сделать проверку наличия записи с подобным имененм файла }
  if (Index.JournalLock = False) and (Index.FormIndex.ButtonNet.Tag = 0) then
  begin
    if DirectoryExists(NetDir + WorkName) = true then
    begin
      ShowMessage('Документ с именем ' + WorkName +
        'уже был передан в ОАСУП');
    end
    else if not ArhivTMSCheck(ArhivTMSDir) then
      ShowMessage('Таблицы архива ТМЦ недоступны. Передача документа в ОАСУП невозможна!')
    else if not ArhivChertCheck(ArhivChertDir) then
      ShowMessage('Таблицы архива чертежей недоступны. Передача документа в ОАСУП невозможна!')
    else
    begin
      if tbl2.Locate(csField_Fname, WorkName, [loCaseInsensitive]) = False then
      begin
        tbl2.Append;
        tbl2.FieldByName(csField_Fname).AsString := WorkName;
        tbl2.FieldByName(csField_Sdate).AsDateTime := Date;
        tbl2.FieldByName(csField_Doc).AsString := sDocName;
        tbl2.Post;
        tbl2.Last;
      end
      else
        ShowMessage('Документ уже существует в журале. Данные будут добавляться к этому документу!');
      fname := tbl2.FieldByName(csField_Id).AsInteger;
      t_tms_0 := TTable.Create(nil);
      t_tms_1 := TTable.Create(nil);
      t_tms_2 := TTable.Create(nil);
      if not ArhTableInit(t_tms_0, t_tms_1, t_tms_2, ArhivTMSDir,
        csTMSArh0, csTMSArh1, csTMSArh2) then
        ShowMessage('Ошибка открытия таблиц архива ТМЦ');
      b_tms_0 := False;
      b_chert_0 := False;
      t_chert_0 := TTable.Create(nil);
      t_chert_1 := TTable.Create(nil);
      t_chert_2 := TTable.Create(nil);
      if not ArhTableInit(t_chert_0, t_chert_1, t_chert_2, ArhivChertDir,
        csChertArh0, csChertArh1, csChertArh2) then
        ShowMessage('Ошибка открытия таблиц архива чертежей');
      //  b_tms_1 := False;
      t := TTable.Create(nil);
      t.TableType := ttParadox;
      t1 := TTable.Create(nil);
      t1.TableType := ttParadox;
      t2 := TTable.Create(nil);
      t2.TableType := ttParadox;
      t3 := TTable.Create(nil);
      t3.TableType := ttParadox;
      t0 := TTable.Create(nil);
      t0.TableType := ttParadox;
      maxdigit := 0;
      for i := 0 to RowList.Count - 1 do
      begin
        iRec := RowList.Items[i];
        if iRec.Digit > maxdigit then
          maxdigit := iRec.Digit;
      end;
      Inc(maxdigit);
      Index.FormIndex.TableIndex.FlushBuffers;
      { if DirectoryExists(StartDir + csTempPath) = true then
         fRemoveDir(StartDir + csTempPath);}
      fCopyDir(StartDir + WorkName, StartDir + csTempPath);
      t.DatabaseName := StartDir + csTempPath + csSymb_BackSlash;
      t1.DatabaseName := t.DatabaseName;
      t2.DatabaseName := t.DatabaseName;
      t3.DatabaseName := t.DatabaseName;
      t0.DatabaseName := t.DatabaseName;
      t0.TableName := IndexTableName;
      for i := 0 to RowList.Count - 1 do
      begin
        iRec := RowList.Items[i];
        t.TableName := csNP01F + IntToStr(iRec.Digit) + csDBExt;

        if (iRec.Kod <> 2) and (FileExists(t.DatabaseName + t.TableName) =
          True) then
        begin

          sfilename := tbl1.DatabaseName + csTempMaket;
          t.Open;
          if t.RecordCount > 0 then
          begin
            b := True;
            case iRec.Kod of
              1: //план
                begin
                  AddDoc2ArhChert;
                  if b2 = False then
                  begin
                    iRec2.Kod := 1;
                    iRec2.Title := iRec.Title;
                    iRec2.Prim := iRec.Prim;
                    iRec2.Data := iRec.Data;
                    iRec2.Digit := iRec.Digit;
                    Index.FormIndex.GetFromKod2Str(iRec.Data, iQ, iM, iT);
                    Add2JournalP8(tbl1, t, iRec2, fname, 0, iRec.Digit);
                    AddTable2ArhChert(t, iQ);
                    inc(x);
                  end;
                end;
              6: //план и лимит
                begin
                  AddDoc2ArhChert;
                  Index.FormIndex.GetFromKod2Str(iRec.Data, iQ, iM, iT);
                  iM := Main.Form1.GetMonthOfQuartal(MonthOf(Date));
                  // текущий месяц берем не из кода а реально текущий!!!
                  if (iT = 2) and (iQ = Main.Form1.GetQuartal) then
                  begin
                    iT := 1;
                    iRec.Data := iRec.Data[1] + inttostr(iM)[1] + '1';
                  end;
                  t1.Active := False;
                  t2.Active := False;
                  t3.Active := False;
                  MaxDig[1] := MaxDigit;
                  t1.TableName := 'NP01F' + IntToStr(MaxDig[1]) + '.db';
                  inc(maxdigit);
                  MaxDig[2] := MaxDigit;
                  t2.TableName := 'NP01F' + IntToStr(MaxDig[2]) + '.db';
                  Inc(maxdigit);
                  MaxDig[3] := MaxDigit;
                  t3.TableName := 'NP01F' + IntToStr(MaxDig[3]) + '.db';
                  Inc(maxdigit);
                  if not Start.FormEdit.CreateNewTable(T1) then
                    Exit;
                  if not Start.FormEdit.CreateNewTable(T2) then
                    Exit;
                  if not Start.FormEdit.CreateNewTable(T3) then
                    Exit;
                  t.First;
                  t1.Open;
                  t2.Open;
                  t3.Open;
                  if iT = 2 then
                  begin //будущий квартал - все месяца планируемые - передаем все
                    if b2 = False then
                    begin
                      iRec2.Kod := 1;
                      iRec2.Title := iRec.Title;
                      iRec2.Prim := iRec.Prim;
                      iRec2.Data := iRec.Data;
                      iRec2.Digit := iRec.Digit;
                      Add2JournalP8(tbl1, t, iRec2, fname, 0, iRec.Digit);
                      inc(x);
                      { while not (t.Eof) do
                       begin
                         GetFromToPlan(t, t1, 1);
                         GetFromToPlan2(t, t2);
                         t.Next;
                       end;
                       if t1.RecordCount = 0 then
                       begin
                         t1.Close;
                         t1.DeleteTable
                       end
                       else
                       begin
                         iRec2.Digit := MaxDig[1];
                         Add2JournalP8(tbl1, t1, iRec2, fname, 1, iRec.Digit);
                         Inc(x);
                       end;
                       if t2.RecordCount = 0 then
                       begin
                         t2.Close;
                         t2.DeleteTable
                       end
                       else
                       begin
                         iRec2.Digit := MaxDig[2];
                         Add2JournalP8(tbl1, t2, iRec2, fname, 2, iRec.Digit);
                         Inc(x);
                       end;  }
                    end
                  end
                  else
                  begin // текущий квартал - могут быть тек и будущ мес, надо разбивать на таблицы
                    iRec2.Kod := 1;
                    iRec2.Title := iRec.Title;
                    iRec2.Prim := iRec.Prim;
                    iRec2.Data := iRec.Data;
                    case iM of
                      1:
                        begin
                          while not (t.Eof) do
                          begin
                            GetFromToPlan(t, t1, 1);
                            GetFromToPlan2(t, t2);
                            t.Next;
                          end;
                          if t1.RecordCount = 0 then
                          begin
                            t1.Close;
                            t1.DeleteTable
                          end
                          else
                          begin
                            iRec2.Digit := MaxDig[1];
                            Add2JournalP8(tbl1, t1, iRec2, fname, 1,
                              iRec.Digit);
                            Inc(x);
                          end;
                          if t2.RecordCount = 0 then
                          begin
                            t2.Close;
                            t2.DeleteTable
                          end
                          else
                          begin
                            iRec2.Digit := MaxDig[2];
                            Add2JournalP8(tbl1, t2, iRec2, fname, 2,
                              iRec.Digit);
                            Inc(x);
                          end;
                        end; //1
                      2:
                        begin
                          while not (t.Eof) do
                          begin
                            GetFromToPlan(t, t2, 2);
                            GetFromToPlan(t, t3, 3);
                            t.Next;
                          end;
                          if t2.RecordCount = 0 then
                          begin
                            t2.Close;
                            t2.DeleteTable
                          end
                          else
                          begin
                            iRec2.Digit := MaxDig[2];
                            Add2JournalP8(tbl1, t2, iRec2, fname, 2,
                              iRec.Digit);
                            Inc(x);
                          end;
                          if t3.RecordCount = 0 then
                          begin
                            t3.Close;
                            t3.DeleteTable
                          end
                          else
                          begin
                            iRec2.Digit := MaxDig[3];
                            Add2JournalP8(tbl1, t3, iRec2, fname, 3,
                              iRec.Digit);
                            Inc(x);
                          end;
                        end;
                      3:
                        begin
                          while not (t.Eof) do
                          begin
                            GetFromToPlan(t, t3, 3);
                            t.Next;
                          end;
                          if t3.RecordCount = 0 then
                          begin
                            t3.Close;
                            t3.DeleteTable
                          end
                          else
                          begin
                            iRec2.Digit := MaxDig[3];
                            Add2JournalP8(tbl1, t3, iRec2, fname, 3,
                              iRec.Digit);
                            Inc(x);
                          end;
                        end;
                    end; // case
                  end; // тек кварт
                  AddTable2ArhChert(t, iQ);
                end;
              8:
                begin
                  AddDoc2ArhChert;
                  Index.FormIndex.GetFromKod2Str(iRec.Data, iQ, iM, iT);
                  iRec2.Kod := 1;
                  iRec2.Title := iRec.Title;
                  iRec2.Prim := iRec.Prim;
                  iRec2.Data := iRec.Data;
                  iRec2.Digit := iRec.Digit;
                  Add2JournalP8_8(tbl1, t, iRec2, fname, iRec.Digit);
                  if (iT = 2) and (iM = 3) then
                  begin
                    if iQ > 3 then
                      iQ := 1
                    else
                      inc(iQ);
                  end;
                  AddTable2ArhChert(t, iQ);
                  inc(x);
                end;
              3: //лимит мес
                begin
                  AddDoc2ArhTMS;
                  iRec2.Kod := iRec.Kod;
                  iRec2.Title := iRec.Title;
                  iRec2.Prim := iRec.Prim;
                  iRec2.Data := iRec.Data;
                  iRec2.Digit := MaxDigit;
                  inc(maxdigit);
                  Add2Journal(tbl1, t, iRec2, sfilename, fname, iRec.Digit, 0);
                  AddTable2ArhTMS(t, strtoint(iRec2.Data),
                    Main.Form1.GetQuartalByMonth(StrToInt(iRec.Data)));
                  Inc(x);
                end;
              4: // лимит кварт
                begin
                  AddDoc2ArhTMS;
                  MnthNum := (StrToInt(iRec.Data[1]) - 1) * 3 + 1;
                  iRec2.Kod := iRec.Kod;
                  iRec2.Title := iRec.Title;
                  iRec2.Prim := iRec.Prim;
                  iRec2.Data := iRec.Data;
                  if StrToInt(iRec.Data[3]) = 2 then
                  begin // будущий квартал, все 3 мес
                    iRec2.Digit := MaxDigit;
                    inc(maxdigit);
                    Add2Journal(tbl1, t, iRec2, sfilename, fname,
                      iRec.Digit, MnthNum, csField_Kol, False, 1);
                    //-- kol2
                    t.First;
                    iRec2.Digit := MaxDigit;
                    inc(maxdigit);
                    Add2Journal(tbl1, t, iRec2, sfilename, fname,
                      iRec.Digit, MnthNum + 1, csField_Kol2, False, 2);
                    t.First;
                    iRec2.Digit := MaxDigit;
                    inc(maxdigit);
                    Add2Journal(tbl1, t, iRec2, sfilename, fname,
                      iRec.Digit, MnthNum + 2, csField_Kol3, False, 3);
                    inc(x, 3);
                  end
                  else //тек квартал анализ месяца
                  begin
                    case StrToInt(iRec.Data[2]) of
                      1: // 1,4,7,10
                        begin
                          iRec2.Digit := MaxDigit;
                          inc(maxdigit);
                          Add2Journal(tbl1, t, iRec2, sfilename, fname,
                            iRec.Digit, MnthNum, csField_Kol, False, 1);
                          //-- kol2
                          t.First;
                          iRec2.Digit := MaxDigit;
                          inc(maxdigit);
                          Add2Journal(tbl1, t, iRec2, sfilename, fname,
                            iRec.Digit, MnthNum + 1, csField_Kol2, False, 2);
                          t.First;
                          iRec2.Digit := MaxDigit;
                          inc(maxdigit);
                          Add2Journal(tbl1, t, iRec2, sfilename, fname,
                            iRec.Digit, MnthNum + 2, csField_Kol3, False, 3);
                          inc(x, 3);
                        end;
                      2: // 2,5,8,11 - создаются 2 макета, по kol2 и kol3
                        begin
                          iRec2.Digit := MaxDigit;
                          inc(maxdigit);
                          Add2Journal(tbl1, t, iRec2, sfilename, fname,
                            iRec.Digit, MnthNum + 1, csField_Kol2, False, 2);
                          //-- kol2
                          t.First;
                          iRec2.Digit := MaxDigit;
                          inc(maxdigit);
                          Add2Journal(tbl1, t, iRec2, sfilename, fname,
                            iRec.Digit, MnthNum + 2, csField_Kol3, False, 3);
                          inc(x, 2);
                        end;
                      3: // 3,6,9,12 - создается макет только по kol3
                        begin
                          iRec2.Digit := MaxDigit;
                          inc(maxdigit);
                          Add2Journal(tbl1, t, iRec2, sfilename, fname,
                            iRec.Digit, MnthNum + 2, csField_Kol3, False, 1);
                          Inc(x);
                        end;
                    end;
                  end;
                  AddTable2ArhTMS(t, 0, StrToInt(iRec.Data[1]));
                end;
              5: // остат лимита
                begin
                  AddDoc2ArhTMS;
                  iRec2.Kod := iRec.Kod;
                  iRec2.Title := iRec.Title;
                  iRec2.Prim := iRec.Prim;
                  iRec2.Data := iRec.Data;
                  iRec2.Digit := MaxDigit;
                  inc(maxdigit);
                  Add2Journal(tbl1, t, iRec2, sfilename, fname, iRec.Digit,
                    0, csField_Kol, True);
                  AddTable2ArhTMS(t, strtoint(iRec2.Data),
                    Main.Form1.GetQuartalByMonth(StrToInt(iRec.Data)));
                  Inc(x);
                end;
              7: //корректировка лимита, надо разбросать по месяцам
                begin
                  AddDoc2ArhChert;
                  Index.FormIndex.GetFromKod2Str(iRec.Data, iQ, iM, iT);
                  iRec2.Kod := 1;
                  iRec2.Title := iRec.Title;
                  iRec2.Prim := iRec.Prim;
                  iRec2.Data := iRec.Data;
                  t1.Active := False;
                  t2.Active := False;
                  t3.Active := False;
                  MaxDig[1] := MaxDigit;
                  t1.TableName := 'NP01F' + IntToStr(MaxDig[1]) + '.db';
                  inc(maxdigit);
                  MaxDig[2] := MaxDigit;
                  t2.TableName := 'NP01F' + IntToStr(MaxDig[2]) + '.db';
                  Inc(maxdigit);
                  MaxDig[3] := MaxDigit;
                  t3.TableName := 'NP01F' + IntToStr(MaxDig[3]) + '.db';
                  Inc(maxdigit);
                  if not Start.FormEdit.CreateNewTable(T1) then
                    Exit;
                  if not Start.FormEdit.CreateNewTable(T2) then
                    Exit;
                  if not Start.FormEdit.CreateNewTable(T3) then
                    Exit;
                  t.First;
                  t1.Open;
                  t2.Open;
                  t3.Open;
                  while not (t.Eof) do
                  begin
                    GetFromToPlan(t, t1, 1);
                    GetFromToPlan(t, t2, 2);
                    GetFromToPlan(t, t3, 3);
                    t.Next;
                  end;
                  if t1.RecordCount = 0 then
                  begin
                    t1.Close;
                    t1.DeleteTable
                  end
                  else
                  begin
                    iRec2.Digit := MaxDig[1];
                    Add2JournalP8(tbl1, t1, iRec2, fname, 1, iRec.Digit);
                    Inc(x);
                  end;
                  if t2.RecordCount = 0 then
                  begin
                    t2.Close;
                    t2.DeleteTable
                  end
                  else
                  begin
                    iRec2.Digit := MaxDig[2];
                    Add2JournalP8(tbl1, t2, iRec2, fname, 2, iRec.Digit);
                    Inc(x);
                  end;
                  if t3.RecordCount = 0 then
                  begin
                    t3.Close;
                    t3.DeleteTable
                  end
                  else
                  begin
                    iRec2.Digit := MaxDig[3];
                    Add2JournalP8(tbl1, t3, iRec2, fname, 3, iRec.Digit);
                    Inc(x);
                  end;
                  AddTable2ArhChert(t, iQ);
                end;
            end;
          end;
          t.Close;
          DeleteFile(sfilename);
        end;
      end;
      if b = True then
      begin
        if index.FormIndex.LockJournal(true) = False then
          ShowMessage(csErrorMsg_BlockDoc)
        else
        begin
          index.FormIndex.lbl1.Visible := True;
          Index.FormIndex.ButtonCopy.Enabled := False;
          Index.FormIndex.ButtonsOff(False);
        end
      end
      else
      begin
        ShowMessage(csErrorMsg_DocTableEmpty)
      end;
      if Assigned(opiutmc_table) then
      begin
        opiutmc_table.Active := False;
        try
          opiutmc_table.DeleteTable;
        finally
          FreeAndNil(opiutmc_table);
        end;
      end;
      FreeAndNil(t);
      t1.Active := False;
      FreeAndNil(t1);
      t2.Active := False;
      FreeAndNil(t2);
      t3.Active := False;
      FreeAndNil(t3);
      t0.Active := False;
      FreeAndNil(t0);
      t_tms_0.Active := False;
      FreeAndNil(t_tms_0);
      t_tms_1.Active := False;
      FreeAndNil(t_tms_1);
      t_tms_2.Active := False;
      FreeAndNil(t_tms_2);
      t_chert_0.Active := False;
      FreeAndNil(t_chert_0);
      t_chert_1.Active := False;
      FreeAndNil(t_chert_1);
      t_chert_2.Active := False;
      FreeAndNil(t_chert_2);
    end
  end;
  if (tbl1.Active = true) and (tbl1.RecordCount > 0) then
  begin
    btn5.Enabled := True;
    for i := 0 to 6 do
      (FmJournal.FindComponent('btnFiltr' + inttostr(i)) as
        TSpeedButton).Enabled := True;
  end
  else
  begin
    btn5.Enabled := False;
    for i := 0 to 6 do
      (FmJournal.FindComponent('btnFiltr' + inttostr(i)) as
        TSpeedButton).Enabled
        := False;
  end;
  FreeAndNil(iRec2);
  if x > 0 then
  begin
    if DirectoryExists(NetDir + WorkName) = true then
      ShowMessage('Документ с именем ' + WorkName +
        'уже был передан в ОАСУП')
    else
      fCopyDir(StartDir + csTempPath, NetDir + WorkName);
  end;
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
  else if dbgrdh1.DataSource.DataSet.FieldByName(csField_Pdate).AsString
    <> csJournal_NullDate then
    Background := clYellow;
end;

procedure TFmJournal.btn5Click(Sender: TObject);
var
  qry2: TQuery;
  s1, s2, s3: string;
  i1, i2: Integer;
begin
  tbl1.DisableControls;
  i2 := tbl1.FieldByName(csField_FnId).AsInteger;
  s1 := Format(FilterQ[1], [i2]);
  s2 := '';
  s3 := tbl1.FieldByName(csField_Fname2).AsString;
  if Trim(s3) = '' then
    ShowMessage('Ошибка! Пустая строка!')
  else
  begin
    if tbl1.Filtered = True then
    begin
      s2 := tbl1.Filter;
      tbl1.Filtered := False;
    end;
    tbl1.Filter := s1;
    tbl1.Filtered := True;
    i1 := tbl1.RecordCount;
    tbl1.Filtered := False;
    tbl1.Filter := s1 + ' AND (PDate=''01.01.2000'')';
    tbl1.Filtered := True;
    if tbl1.RecordCount = i1 then
    begin
      if
        Application.MessageBox(PAnsiChar(
        'Из журнала будут удалены все таблицы входящие в документ '
        + s3 + '. Продолжить удаление?'), 'Удаление из журнала',
        MB_YESNOCANCEL + MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
      begin
        qry2 := TQuery.Create(Self);
        qry2.DatabaseName := tbl1.DatabaseName;
        qry2.SQL.Text := 'Delete from "' + tbl1.TableName + '" where FnId=' +
          IntToStr(i2);
        try
          qry2.ExecSQL;
          qry2.SQL.Text := 'Delete from "' + tbl2.TableName + '" where Id=' +
            IntToStr(i2);
          qry2.ExecSQL;
          DeleteDocFromArhiv(s3, ArhivTMSDir, '1');
          DeleteDocFromArhiv(s3, ArhivChertDir, '2');
          fRemoveDir(NetDir + s3);
          fDeleteFile(StartDir + s3 + '\' + csJournalLock);
        finally
          FreeAndNil(qry2);
        end; // try

      end
    end
    else
      ShowMessage('Удалить документ нельзя! Есть таблицы принятые в обработку ОАСУП!!!');
    tbl1.Filtered := False;
    if s2 <> '' then
    begin
      tbl1.Filter := s2;
      tbl1.Filtered := True;
    end;
  end;
  tbl1.EnableControls;
  tbl1.Refresh;
end;

procedure TFmJournal.tbl1MarkChange(Sender: TField);
begin
  if Sender.AsBoolean = True then
  begin
    if (tbl1.FieldByName(csField_Sdate).AsString <> csJournal_NullDate) then
      Sender.AsBoolean := False;
  end;
end;

procedure TFmJournal.dbgrdh1Columns1GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Params.Text = '01.2000' then
    Params.Text := '';
end;

procedure TFmJournal.dbgrdh1DblClick(Sender: TObject);
var
  TempRec: TRecord;
begin
  TempRec := TRecord.Create(tbl1.FieldByName(csField_OldDigit).AsInteger,
    tbl1.FieldByName(csField_Kod).AsInteger,
    tbl1.FieldByName(csField_Tname).AsString, 0, csRoute, csNote,
    tbl1.FieldByName(csField_Data
    ).AsString);
  ShowOld := True;
  CurRec := TempRec;
  Workname_2 := tbl1.FieldByName(csField_Fname2).AsString;
  Kod2 := StrToInt(TempRec.Data);
  NewString.Kod := tbl1.FieldByName(csField_Kod).AsInteger;
  case NewString.Kod of
    3, 4, 5:
      begin
        frm42 := Tfrm42.Create(Application); //Tfrm42 описан в Ost.pas
        frm42.ShowModal;
        FreeAndNil(frm42);
      end;
    1, 6, 7, 8:
      begin
        FormEdit := TFormEdit.Create(Application);
        //TFormEdit описан в Start.pas
        FormEdit.ShowModal();
        FreeAndNil(FormEdit);
      end;
  end;
  FreeAndNil(TempRec);
  ShowOld := False;
end;

procedure TFmJournal.btnFiltr0Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to 6 do
    (FmJournal.FindComponent('btnFiltr' + inttostr(i)) as
      TSpeedButton).Down
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

procedure TFmJournal.btnFiltr1Click(Sender: TObject);
begin
  FmJournal.SetJournalFilter;
end;

procedure TFmJournal.ds1DataChange(Sender: TObject; Field: TField);
begin
  stat1.Panels.Items[1].Text := 'Записей: ' + IntToStr(tbl1.RecordCount);
end;

procedure TFmJournal.dbgrdh1Columns3GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if (Params.Text <> '') and (Params.Text[1] <> 'С') then
    Params.Text := 'Сл. зап. ' + Params.Text;
end;

procedure TFmJournal.btn4Click(Sender: TObject);
begin
  tbl1.Refresh;
end;

end.

