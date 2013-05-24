unit Arhiv;

interface
uses DBTables;
function ArhivChertCheck(const ArhivChertDir: string): Boolean;
function ArhivTMSCheck(const ArhivTMSDir: string): Boolean;
function ArhTableInit(tabl1, tabl2, tabl3: TTable; const DataBaseName,
  Tabl1Name, Tabl2Name, Tabl3Name: string): Boolean;
function DeleteDocFromArhiv(const aDocName, aArhivPath, aTaskNumb: string):
  Boolean;

implementation
uses SysUtils, Windows, Forms, KoaUtils, Constants;

function ArhivChertCheck(const ArhivChertDir: string): Boolean;

//создание таблиц архива
  function CreateArhChertTables(const DirPath: string): Boolean;
  const
    csNP01VN_Chert_0 =
      'create table "NP01VN02_0.DB" (DocID autoinc, Title varchar(255), NameDoc varchar(22), DDate date, SDate date)';
    csNP01VN_Chert_1 =
      'create table "NP01VN02_1.DB" (TableID autoinc, DocID integer, Title varchar(255), Digit integer, Kod integer, Data char(10), Quart smallint)';
    csNP01VN_Chert_2_1 = 'create table "NP01VN02_2.DB" ';
    csNP01VN_Chert_2_2 =
      '(ItemID autoinc, TableID integer, Kod integer, Chert char(13), Kol_1 integer, Kol integer, Kol1 integer, Kol2 integer, Kol3 integer,';
    csNP01VN_Chert_2_3 = ' Primech char(255), Changed char(1), PRIMARY KEY (ItemID))';
    csNP01VN_Chert_3_1 = 'create table "NP01VN02_3.DB" ';
    csNP01VN_Chert_3_2 =
      '(ItemID integer, TableID integer, Kod integer, Chert char(13), Kol_1 integer, Kol integer, Kol1 integer, Kol2 integer, Kol3 integer,';
    csNP01VN_Chert_3_3 = ' Primech char(255), ChangeDate date, WinUser char(20), PRIMARY KEY (ItemID))';
    csNP01VN_Chert_Index_1 = 'CREATE INDEX Table1 ON "NP01VN02_3.DB" (TableID)';
    csNP01VN_Chert_Index_2 = 'CREATE INDEX Table1 ON "NP01VN02_2.DB" (TableID)';
  var
    q: TQuery;
    s: string;
    i: Integer;

    function GetTMSQL: string;
    var
      j: integer;
    begin
      Result := '';
      for j := 1 to 24 do
        Result := Result + ' TM' + inttostr(j) + ' char(2),'
    end;

  begin
    Result := True;
    for i := 0 to 3 do
    begin
      s := DirPath + 'NP01VN02_' + inttostr(i) + '.DB';
      if FileExists(s) then
      begin
        BackupData(s, 3);
        if not (Windows.DeleteFile(PAnsiChar(s))) then
          Result := False;
      end;
    end;
    if Result then
    begin
      q := TQuery.Create(nil);
      q.DatabaseName := DirPath;
      q.SQL.Text := csNP01VN_Chert_0;
      try
        q.ExecSQL;
        q.SQL.Text := csNP01VN_Chert_1;
        q.ExecSQL;
        q.SQL.Text := csNP01VN_Chert_2_1 + csNP01VN_Chert_2_2 + GetTMSQL +
          csNP01VN_Chert_2_3;
        q.ExecSQL;
        q.SQL.Text := csNP01VN_Chert_3_1 + csNP01VN_Chert_3_2 + GetTMSQL +
          csNP01VN_Chert_3_3;
        q.ExecSQL;
        q.SQL.Text:=csNP01VN_Chert_Index_1;
        q.ExecSQL;
        q.SQL.Text:=csNP01VN_Chert_Index_2;
        q.ExecSQL;
      except
        Result := False;
      end;
      FreeAndNil(q);
    end;
  end;
  //проверка и создание директории архива
  function CreateArhChert(const DirPath: string): Boolean;
  begin
    if ForceDirectories(DirPath) then
    begin
      Result := CreateArhChertTables(DirPath)
    end
    else
      Result := False;
  end;

  function CreateArhChertAsk: Boolean;
  begin
    if Application.MessageBox(PAnsiChar('Создать таблицы в ' + ArhivChertDir +
      '?'),
      'Таблицы архива по чертежам не обнаружены', MB_YESNOCANCEL + MB_ICONWARNING
      + MB_DEFBUTTON2) = IDYES then
      Result := CreateArhChert(ArhivChertDir)
    else
      Result := False;
  end;

begin
  if DirectoryExists(ExcludeTrailingPathDelimiter(ArhivChertDir)) then
  begin
    if (FileExists(ArhivChertDir + csChertArh0)) and
      (FileExists(ArhivChertDir + csChertArh1)) and (FileExists(ArhivChertDir +
      csChertArh2)) then
      Result := True
    else
      Result := CreateArhChertAsk;
  end
  else
    Result := CreateArhChertAsk;
end;

function ArhivTMSCheck(const ArhivTMSDir: string): Boolean;

//создание таблиц архива
  function CreateArhTMSTables(const DirPath: string): Boolean;
  const
    csNP01VN_TMS_0 =
      'create table "NP01VN01_0.DB" (DocID autoinc, Title varchar(255), NameDoc varchar(22), DDate date, SDate date)';
    csNP01VN_TMS_1 =
      'create table "NP01VN01_1.DB" (TableID autoinc, DocID integer, Title varchar(255), Digit integer, Kod integer, Data char(10), Quart smallint)';
    csNP01VN_TMS_2_1 = 'create table "NP01VN01_2.DB" ';
    csNP01VN_TMS_2_2 =
      '(TableID integer, Vp char(1), Cp char(3), Shifr char(8), KI char(4), Kol char(11), Podrazd integer, Znak char(1), Eim char(5), Kol2 char(11), Primech char(50), Norma char(9), Kol_m char(3), Kol_m2 char(3), Kol_m3 char(3),Kol3 char(11))';
  var
    q: TQuery;
    s: string;
    i: Integer;
  begin
    Result := True;
    for i := 0 to 2 do
    begin
      s := DirPath + 'NP01VN01_' + inttostr(i) + '.DB';
      if FileExists(s) then
      begin
        BackupData(s, 3);
        if not (Windows.DeleteFile(PAnsiChar(s))) then
          Result := False;
      end;
    end;
    if Result then
    begin
      q := TQuery.Create(nil);
      q.DatabaseName := DirPath;
      q.SQL.Text := csNP01VN_TMS_0;
      try
        q.ExecSQL;
        q.SQL.Text := csNP01VN_TMS_1;
        q.ExecSQL;
        q.SQL.Text := csNP01VN_TMS_2_1 + csNP01VN_TMS_2_2;
        q.ExecSQL;
      except
        Result := False;
      end;
      FreeAndNil(q);
    end;
  end;
  //проверка и создание директории архива
  function CreateArhTMS(const DirPath: string): Boolean;
  begin
    if ForceDirectories(DirPath) then
    begin
      Result := CreateArhTMSTables(DirPath)
    end
    else
      Result := False;
  end;

  function CreateArhTMSAsk: Boolean;
  begin
    if Application.MessageBox(PAnsiChar('Создать таблицы в ' + ArhivTMSDir +
      '?'),
      'Таблицы архива ТМЦ не обнаружены', MB_YESNOCANCEL + MB_ICONWARNING
      + MB_DEFBUTTON2) = IDYES then
      Result := CreateArhTMS(ArhivTMSDir)
    else
      Result := False;
  end;

begin
  if DirectoryExists(ExcludeTrailingPathDelimiter(ArhivTMSDir)) then
  begin
    if (FileExists(ArhivTMSDir + 'NP01VN01_0.DB')) and (FileExists(ArhivTMSDir +
      'NP01VN01_1.DB'))
      and (FileExists(ArhivTMSDir + 'NP01VN01_2.DB')) then
      Result := True
    else
      Result := CreateArhTMSAsk;
  end
  else
    Result := CreateArhTMSAsk;
end;

function ArhTableInit(tabl1, tabl2, tabl3: TTable; const DataBaseName,
  Tabl1Name, Tabl2Name, Tabl3Name: string): Boolean;
begin
  tabl1.TableType := ttParadox;
  tabl2.TableType := ttParadox;
  tabl3.TableType := ttParadox;
  tabl1.DatabaseName := DataBaseName;
  tabl2.DatabaseName := DataBaseName;
  tabl3.DatabaseName := DataBaseName;
  tabl1.TableName := Tabl1Name;
  tabl2.TableName := Tabl2Name;
  tabl3.TableName := Tabl3Name;
  Result := True;
  try
    tabl1.Open;
    tabl2.Open;
    tabl3.Open;
  except
    Result := False;
  end;
end;

function DeleteDocFromArhiv(const aDocName, aArhivPath, aTaskNumb: string):
  Boolean;
var
  aqyr1, aqyr2, aqyr3: TQuery;
begin
  aqyr1 := TQuery.Create(nil);
  //  aqyr1.DatabaseName := GetArhiveTMSPath;
  aqyr1.DatabaseName := aArhivPath;
  aqyr1.SQL.Text := 'SELECT DocID, Title FROM ''NP01VN0' + aTaskNumb +
    '_0.DB'' WHERE Title=''' + aDocName + '''';
  try
    aqyr1.Open;
    if aqyr1.RecordCount > 0 then
    begin
      aqyr2 := TQuery.Create(nil);
      aqyr2.DatabaseName := aqyr1.DatabaseName;
      aqyr2.SQL.Text :=
        'SELECT TableID, DocID FROM ''NP01VN0' + aTaskNumb +
        '_1.DB'' WHERE DocID=' + aqyr1.fieldbyname('DocID').AsString;
      aqyr2.Open;
      if aqyr2.RecordCount > 0 then
      begin
        aqyr3 := TQuery.Create(nil);
        aqyr3.DatabaseName := aqyr2.DatabaseName;
        while not (aqyr2.Eof) do
        begin
          aqyr3.SQL.Text := 'DELETE FROM ''NP01VN0' + aTaskNumb +
            '_2.DB'' WHERE TableID=' + aqyr2.fieldbyname('TableID').AsString;
          aqyr3.ExecSQL;
          aqyr2.Next;
        end;
        aqyr3.SQL.Text := 'DELETE FROM ''NP01VN0' + aTaskNumb +
          '_1.DB'' WHERE DocID=' + aqyr1.fieldbyname('DocID').AsString;
        aqyr3.ExecSQL;
        FreeAndNil(aqyr3);
      end;
      aqyr2.Open;
      aqyr2.SQL.Text := 'DELETE FROM ''NP01VN0' + aTaskNumb +
        '_0.DB'' WHERE DocID=' +
        aqyr1.fieldbyname('DocID').AsString;
      aqyr2.ExecSQL;
      FreeAndNil(aqyr2);
    end;
    aqyr1.Close;
    FreeAndNil(aqyr1);
    Result := True;
  except
    if Assigned(aqyr1) then
      FreeAndNil(aqyr1);
    if Assigned(aqyr2) then
      FreeAndNil(aqyr2);
    if Assigned(aqyr3) then
      FreeAndNil(aqyr3);
    Result := False;
  end;
end;

end.

