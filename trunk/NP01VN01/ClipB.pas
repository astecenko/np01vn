unit ClipB;

interface
uses Windows, Clipbrd;

type
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

  TRowsOst = record
    Num:Integer;
    DBRecAr: array of TDBRecordOst;
  end;

const
  FormatNameOst = 'CF_MyFormatOst';

var
	CF_MyFormatOst: Word;

procedure CopyToClipboardOst(Rows : TRowsOst);

implementation

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

initialization
  CF_MyFormatOst := RegisterClipboardFormat(FormatNameOst);

end.
