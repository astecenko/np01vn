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

  TRows = record
  	Num : integer;
  	DBRecAr : array of TDBRecord;
  end;

const
  FormatName = 'CF_MyFormat';

var
	CF_MyFormat: Word;

procedure CopyToClipboard(Rows : TRows);

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


initialization
	CF_MyFormat := RegisterClipboardFormat(FormatName);

end.
