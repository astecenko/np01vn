unit TMClass;

interface
type
  TM = class;

  TMArray = array of TM;

  TM = class
  private
    function GetText: ShortString;
  protected
    Len: Integer;
    mText: string[71];
    StrArr: array of string[2]; // массив цехов в ТМ
  public
    constructor Create(_TM: string);
    property Text: ShortString read GetText;
    function IsIn(Zeh: ShortString): Integer;
    function GetLen(): Integer;
    class function FormZeh(const Zeh: ShortString): ShortString;
    function SubTM(Zeh: ShortString): string; // возвращает подстроку до цеха Zeh
    class procedure ClearTM(TMAr: TMArray);
  end;

implementation
uses SysUtils;

constructor TM.Create(_TM: string);
var
  I: Integer;
begin
  Len := Length(_TM) div 2;
  SetLength(StrArr, Len);

  for i := 0 to Len - 1 do
  begin
    StrArr[i] := Copy(_TM, i * 2 + 1, 2);
    if i = 0 then
      mText := StrArr[i]
    else
      mText := mText + ' ' + StrArr[i];
  end;
end;

function TM.IsIn(Zeh: ShortString): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := Low(StrArr) to High(StrArr) do
  begin
    if (StrArr[i] = Zeh) then
    begin
      Result := i + 1;
      break;
    end;
  end;
end;

function TM.GetLen(): Integer;
begin
  Result := Len;
end;

function TM.GetText: ShortString;
begin
  Result := mText;
end;

class function TM.FormZeh(const Zeh: ShortString): ShortString;
var
  ZehStr: string[2];
begin
  ZehStr := Copy(Zeh, 1, 2);
  Result := Format('%.2d', [StrToInt(ZehStr)]);
end;

function TM.SubTM(Zeh: ShortString): string;
var
  ZehInd, I: Integer;
begin
  ZehInd := IsIn(Zeh);
  if ZehInd = 0 then
    Result := ''
  else
  begin
    Result := StrArr[0];
    for i := 1 to ZehInd - 1 do
      Result := Result + ' ' + StrArr[i];
  end;
end;

class procedure TM.ClearTM(TMAr: TMArray);
var
  I: Integer;
begin
  for I := Low(TMAr) to High(TMAr) do
  begin
    //TMAr[I].Free;
    FreeAndNil(TMAr[i]);
  end;
end;

end.
 
