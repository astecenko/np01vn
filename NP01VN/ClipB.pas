unit ClipB;

interface
uses Windows, Clipbrd;

type
	TDBRecord = packed record
  	Kod : Word;
    Chert : string[13];
    Kol : array [1..3] of Word;
    Kol_1 : Word;
    Kol_v : array [1..3] of Word;
    TM : array [1..24] of String[2];
    Primech : string[255];
	end;
  TDBRecordOst = packed record
    Vp : Char;
    Cp : string[3];
    Shifr : string[8];
    KI : string[4];
    Kol : string[11];
    Kol2 : string[11];
    Kol3 : string[11];
    Norma : string[13];
    kol_m:string[3];
    kol_m2:string[3];
    kol_m3:string[3];
    Podrazd:Integer;
    Znak:Char;
    Eim:string[5];
    Primech:string[50];
  end;

  TRows = record
  	Num : integer;
  	DBRecAr : array of TDBRecord;
  end;

  TRowsOst = record
    Num:Integer;
    DBRecAr: array of TDBRecordOst;
  end;

const
 FormatName = 'CF_MyFormat';
 FormatNameOst = 'CF_MyFormatOst';

var
	CF_MyFormat, CF_MyFormatOst: Word;

procedure CopyToClipboard(Rows : TRows);
function LoadFromClipboard : TRows;

procedure CopyToClipboardOst(Rows : TRowsOst);
function LoadFromClipboardOst : TRowsOst;

implementation

procedure CopyToClipboard(Rows : TRows);
var
	h : THandle;
  First : ^Byte;
  iSize, RecSize, i : Integer;
begin
  Rows.Num := Length(Rows.DBRecAr);
  iSize := SizeOf(integer);
  RecSize := SizeOf(TDBRecord);
  h := GlobalAlloc(GMEM_MOVEABLE, iSize + RecSize*Rows.Num);
  First := GlobalLock(h);

  try
  	Move(Rows, First^, iSize);
    First := pointer(LongWord(First) + iSize);
    for i := 1 to Rows.Num do begin
    	Move(Rows.DBRecAr[i-1], First^, RecSize);
    	First := pointer(LongWord(First) + RecSize);
    end;
    Clipboard.SetAsHandle(CF_MyFormat, h);
  finally
  	GlobalUnlock(h);
  end;
end;

function LoadFromClipboard : TRows;
var
	h : THandle;
  First : ^Byte;
  Rows : TRows;
  i, iSize : integer;
begin
	h := Clipboard.GetAsHandle(CF_MyFormat);
  if (h <> 0) then begin
  	First := GlobalLock(h);

    try
      iSize := SizeOf(integer);
    	Move(First^, Rows, iSize);
      SetLength(Rows.DBRecAr, Rows.Num);
    	First := pointer(LongWord(First) + iSize);
      for i := 1 to Rows.Num do begin
        Move(First^, Rows.DBRecAr[i-1], SizeOf(TDBRecord));
        First := pointer(LongWord(First) + SizeOf(TDBRecord));
      end;
    finally
    	GlobalUnlock(h);
      Result := Rows;
    end;
  end;
end;

procedure CopyToClipboardOst(Rows : TRowsOst);
var
	h : THandle;
  First : ^Byte;
  iSize, RecSize, i : Integer;
begin
  Rows.Num := Length(Rows.DBRecAr);
  iSize := SizeOf(integer);
  RecSize := SizeOf(TDBRecordOst);
  h := GlobalAlloc(GMEM_MOVEABLE, iSize + RecSize*Rows.Num);
  First := GlobalLock(h);

  try
  	Move(Rows, First^, iSize);
    First := pointer(LongWord(First) + iSize);
    for i := 1 to Rows.Num do begin
    	Move(Rows.DBRecAr[i-1], First^, RecSize);
    	First := pointer(LongWord(First) + RecSize);
    end;
    Clipboard.SetAsHandle(CF_MyFormatOst, h);
  finally
  	GlobalUnlock(h);
  end;
end;

function LoadFromClipboardOst : TRowsOst;
var
	h : THandle;
  First : ^Byte;
  Rows : TRowsOst;
  i, iSize : integer;
begin
	h := Clipboard.GetAsHandle(CF_MyFormatOst);
  if (h <> 0) then begin
  	First := GlobalLock(h);

    try
      iSize := SizeOf(integer);
    	Move(First^, Rows, iSize);
      SetLength(Rows.DBRecAr, Rows.Num);
    	First := pointer(LongWord(First) + iSize);
      for i := 1 to Rows.Num do begin
        Move(First^, Rows.DBRecAr[i-1], SizeOf(TDBRecordOst));
        First := pointer(LongWord(First) + SizeOf(TDBRecordOst));
      end;
    finally
    	GlobalUnlock(h);
      Result := Rows;
    end;
  end;
end;


initialization
	CF_MyFormat := RegisterClipboardFormat(FormatName);
  CF_MyFormatOst := RegisterClipboardFormat(FormatNameOst);

end.
