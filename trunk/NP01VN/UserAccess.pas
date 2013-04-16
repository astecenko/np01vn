unit UserAccess;

interface
uses Classes, IniFiles;
type
  TNP01VNAccess = class(TObject)
  private
    Fini: TMemIniFile;
    FDivision: integer;
    FDivisionStr: string;
    FMonthCheck: Boolean;
    FCods: string;
    FShortened: Boolean;
    FSnyatie: Boolean;
    // список возможных кодов подразделений
    FCodsList: TStringList;
    procedure SetDivision(const Value: Integer);
  public
    property Division: Integer read FDivision write SetDivision;
    property DivisionStr: string read FDivisionStr;
    property Shortened: Boolean read FShortened;
    property MonthCheck: Boolean read FMonthCheck;
    property Snyatie: Boolean read FSnyatie;
    property CodsList: TStringList read FCodsList;
    procedure ReadAccessIni;
    function CodInAccess(const sCod: string): Boolean;
    constructor Create(const IniFile: string);
    destructor Destroy; override;
  end;

implementation

uses SysUtils;

function ReplaceStr(const AText, AFromText, AToText: string): string;
{замена подстроки в строке}
var
  I: Integer;
  Source: string;
begin
  Source := AText;
  Result := '';
  repeat
    I := Pos(AFromText, Source);
    if I > 0 then
    begin
      Result := Result + Copy(Source, 1, I - 1) + AToText;
      Source := Copy(Source, I + Length(AFromText), MaxInt);
    end
    else
      Result := Result + Source;
  until I <= 0;
end;

{ TNP01VNAccess }

function TNP01VNAccess.CodInAccess(const sCod: string): Boolean;
begin
  Result := Pos(sCod, FCods) > 0;
end;

constructor TNP01VNAccess.Create(const IniFile: string);
begin
  inherited Create;
  FCods := '';
  FDivision := 0;
  FShortened := False;
  FSnyatie := False;
  FMonthCheck := False;
  FCodsList := TStringList.Create;
  Fini := TMemIniFile.Create(IniFile);
end;

destructor TNP01VNAccess.Destroy;
begin
  FreeAndNil(FCodsList);
  if Assigned(Fini) then
    FreeAndNil(Fini);
  inherited;
end;

procedure TNP01VNAccess.ReadAccessIni;
var
  s: string;
begin
  FCodsList.Clear;
  FCods := Fini.ReadString(FDivisionStr, 'cods', '2');
  s := Fini.ReadString(FDivisionStr, 'podrazd', FDivisionStr);
  FCodsList.Text := ReplaceStr(s, ',', #13#10);
  FShortened := Fini.ReadBool(FDivisionStr, 'shorten', False);
  FMonthCheck := Fini.ReadBool(FDivisionStr, 'monthchk', False);
  FSnyatie := Fini.ReadBool(FDivisionStr, 'snyatie', False);

end;

procedure TNP01VNAccess.SetDivision(const Value: Integer);
begin
  FDivision := Value;
  FDivisionStr := IntToStr(FDivision);
  if FDivision < 100 then
  begin
    if FDivision > 9 then
      FDivisionStr := '0' + FDivisionStr
    else
      FDivisionStr := '00' + FDivisionStr;
  end;
  ReadAccessIni;
end;

end.

