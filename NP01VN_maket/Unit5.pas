unit Unit5;
// 24.05.2011 Стеценко А.В. - Изменил сохранение макета на дискету на выбор каталога
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, DBTables, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, shellApi, FileCtrl, IniFiles, ComCtrls;

type
  TForm5 = class(TForm)
    Query1: TQuery;
    Table_DPLN: TTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Query_ins_del_upd: TQuery;
    Query_ins_DPLN: TQuery;
    Table_DPLNMarshryt: TStringField;
    Table_DPLNPmak: TStringField;
    Table_DPLNKI: TStringField;
    Table_DPLNPmod: TStringField;
    Table_DPLNSumKol: TIntegerField;
    Table_DPLNKol1: TIntegerField;
    Table_DPLNKol2: TIntegerField;
    Table_DPLNKol3: TIntegerField;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Table_DPLNChert: TStringField;
    Table_DPLNNM: TStringField;
    lbl1: TLabel;
    chkMonth1: TCheckBox;
    chkMonth2: TCheckBox;
    chkMonth3: TCheckBox;
    lblDoc: TLabel;
    lblTable: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Table_DPLNPmakChange(Sender: TField);
    procedure Table_DPLNCalcFields(DataSet: TDataSet);
    procedure Table_DPLNBeforeEdit(DataSet: TDataSet);
    procedure Table_DPLNKol1SetText(Sender: TField; const Text: string);
    procedure Table_DPLNKol2SetText(Sender: TField; const Text: string);
    procedure Table_DPLNKol3SetText(Sender: TField; const Text: string);
    procedure Table_DPLNPmakSetText(Sender: TField; const Text: string);
    procedure Table_DPLNPmodSetText(Sender: TField; const Text: string);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Table_DPLNAfterInsert(DataSet: TDataSet);
    procedure Table_DPLNAfterPost(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ZapMak(par_po: string);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  i, znach_kol1, znach_kol2, znach_kol3: integer;
  znach_pmak, znach_ki, znach_pmod: string;
implementation

uses Unit1, Unit3, Unit4, Unit2, Unit6, Unit7, StrUtils, Unit8, Journal,
  KoaUtils, Constants;

{$R *.dfm}

function add_nol(field: string; len_field: integer; left_right: string): string;
var
  nol: string;
  len, raznost: integer;
begin
  if left_right = 'left' then
  begin
    nol := '0000000000000';
    len := 0;
    len := length(field);
    raznost := len_field - len;
    if raznost <> 0 then
      add_nol := copy(nol, 1, raznost) + field
    else
      add_nol := field;
  end;
  if left_right = 'right' then
  begin
    nol := '000000000000000000000000';
    len := 0;
    len := length(field);
    raznost := len_field - len;
    if raznost <> 0 then
      add_nol := field + copy(nol, len, raznost)
    else
      add_nol := field;
  end;
end;

function GetTempDir: string;
var
  Buf: array[0..1023] of Char;
begin
  SetString(Result, Buf, GetTempPath(Sizeof(Buf) - 1, Buf));
end;

procedure TForm5.ZapMak(par_po: string);
var
  {str,}maket, str_prom, s1, s_field1, s_field2, s_field3: string;
  //oshibka: Boolean;
  f: textfile;
  //rez_mass_file,
  i: integer;
  dpl_db_name: string;
  aNP01DPL: TTable;
  ClearMarshrut: string;
  //  po: integer;
   { VolName: array[0..255] of char;
    FSName: array[0..100] of char;
    MaxCompLen, FSFlags: Cardinal;
    FC, SPC, BPS, NC: DWORD;}
  f1: file;
  Buf: array[1..80] of Char;
  NumRead, Sum_Kvartal: integer;
  //  str1: string[80];
  chP0, chP1: integer;
  //  str2: string;
  savedir: string;
  params: TIniFile;
  str01: TStringList;
  FilterOld: Boolean;
  RecNoOld: Cardinal;

  function CreateDPL_4_NP01(aTable: TTable): boolean;
  var
    s1: string;
  begin
    aTable.DatabaseName := savedir;
    if par_po = 'yes' then
      dpl_db_name := dpl_db_name + form6.MaskEdit1.Text[1] +
        form6.MaskEdit1.Text[2] + form6.MaskEdit1.Text[3];
    aTable.TableName := dpl_db_name + '.DB';
    s1 := IncludeTrailingPathDelimiter(savedir) + aTable.TableName;
    aTable.TableType := ttParadox;
    aTable.Exclusive := True;
    Result := True;
    try
     { if FileExists(s1) then
        DeleteFile(s1);}
      if not (aTable.Exists) then
      begin
        with aTable.FieldDefs do
        begin
          Add('CHERT', ftString, 13);
          Add('KI', ftString, 4);
          Add('MDF', ftString, 1);
          Add('KV', ftInteger);
          Add('M1', ftInteger);
          Add('M2', ftInteger);
          Add('M3', ftInteger);
          Add('TM', ftString, 26);
          Add('SP', ftString, 1);
        end;
        aTable.CreateTable;
      end
      else if fl_disk = 2 then
        aTable.EmptyTable;
      aTable.Open;
    except
      Result := False;
      ShowMessage('Ошибка доступа к файлу ' + s1);
    end;
  end;

begin
  //  po := 0;
  dpl_db_name := 'NP01';
  fl_disk := 0;
  FmJournal.tbl1.DisableControls;
  RecNoOld := FmJournal.tbl1.RecNo;
  FilterOld := FmJournal.tbl1.Filtered;
  if FmJournal.tbl1.Filtered then
    FmJournal.tbl1.Filtered := False;
  FmJournal.tbl1.RecNo := RecNoOld;
  params := TIniFile.Create(ExtractFilePath(Application.ExeName) +
    'np01vn.ini');
  savedir := params.ReadString('location', 'path', '');
  DeleteFile(GetTempDir + 'np01vn-dpl.txt');
  DeleteFile(GetTempDir + 'np01vn-spravka.txt');
  str01 := TStringList.Create;
  //  if (GetVolumeInformation(PChar('A:\'), VolName, 255, nil, MaxCompLen, FSFlags, FSName, 100)) then
  if FileCtrl.SelectDirectory('Каталог сохранения макета и справки', '', savedir)
    = True then
  begin
    if UseJournal = False then
    begin
      Form1.Table_NP01F0.Edit;
      form1.Table_NP01F0.FieldByName('rekv_P0').AsString := form6.MaskEdit1.Text
        +
        form6.Edit1.Text;
      Form1.Table_NP01F0.FieldByName('data').AsString := DateToStr(Date);
      Form1.Table_NP01F0.Post;
    end
    else
    begin
      FmJournal.tbl1.Edit;
      FmJournal.tbl1.FieldByName('rekv_P0').AsString := form6.MaskEdit1.Text
        + form6.Edit1.Text;
      FmJournal.tbl1.FieldByName('WDate').AsDateTime := Date;
      FmJournal.tbl1.Post;
    end;
    AssignFile(f, savedir + '\DPL.txt');
    //    AssignFile(f, 'a:\DPL.txt');
{$I-} //если исп-ся reset
    //Rewrite(f); // создает файл если нет в директории
    reset(f); //открывает файл и сопров-ся append или rewrite
{$I+}
    if IOResult = 0 then
    begin
      form8.ShowModal;
      // rez_mass_file:=Application.MessageBox('Файл DPL.txt на дискете создан! Перезаписать его?',
                    //     'Внимание',MB_ICONQUESTION+MB_YESNOCANCEL);
      if fl_disk = 1 then
        Append(f);
      if fl_disk = 2 then
        Rewrite(f);
      if fl_disk = 3 then
      begin
        CloseFile(f);
        Exit;
      end;
      { if rez_mass_file=6 then
       Rewrite(f);
       if rez_mass_file=7 then
       Append(f);
       if rez_mass_file=2 then begin  CloseFile(f);
        Exit; end; }
    end
    else
      Rewrite(f);

    form5.Table_DPLN.First;
    Form7.Gauge1.MaxValue := Form5.Table_DPLN.RecordCount;

    Form6.Visible := False;
    Form5.SendToBack;
    Form5.Visible := False;
    form7.Show;
    aNP01DPL := TTable.Create(Self);
    CreateDPL_4_NP01(aNP01DPL);
    for i := 1 to Form5.Table_DPLN.RecordCount do
    begin
      Form7.Gauge1.Progress := i;
      Sum_Kvartal := 0;
      if chkMonth1.Checked then
      begin
        s_field1 := add_nol(Form5.Table_DPLN.FieldByName('Kol1').AsString, 9,
          'left');
        Sum_Kvartal := Form5.Table_DPLN.FieldByName('Kol1').AsInteger;
      end
      else
        s_field1 := '000000000';
      if chkMonth2.Checked then
      begin
        s_field2 := add_nol(Form5.Table_DPLN.FieldByName('Kol2').AsString, 9,
          'left');
        Sum_Kvartal := Sum_Kvartal +
          Form5.Table_DPLN.FieldByName('Kol2').AsInteger;
      end
      else
        s_field2 := '000000000';
      if chkMonth3.Checked then
      begin
        s_field3 := add_nol(Form5.Table_DPLN.FieldByName('Kol3').AsString, 9,
          'left');
        Sum_Kvartal := Sum_Kvartal +
          Form5.Table_DPLN.FieldByName('Kol3').AsInteger;
      end
      else
        s_field3 := '000000000';
      if Sum_Kvartal > 0 then
      begin
        aNP01DPL.Append;
        ClearMarshrut :=
          del_prob(Form5.Table_DPLN.FieldByName('Marshryt').AsString);
        aNP01DPL.FieldByName('TM').AsString := ClearMarshrut + 'AA';
        aNP01DPL.FieldByName('CHERT').AsString :=
          Form5.Table_DPLN.FieldByName('chert').AsString;
        aNP01DPL.FieldByName('SP').AsString := 'M';
        aNP01DPL.FieldByName('MDF').AsString := '0';
        aNP01DPL.FieldByName('KI').AsString :=
          unit3.Form3.Padl(Table_DPLN.FieldByName('KI').AsString, 4, '0');
        aNP01DPL.FieldByName('KV').AsInteger := Sum_Kvartal;
        aNP01DPL.FieldByName('M1').AsInteger :=
          Table_DPLN.FieldByName('Kol1').AsInteger;
        aNP01DPL.FieldByName('M2').AsInteger :=
          Table_DPLN.FieldByName('Kol2').AsInteger;
        aNP01DPL.FieldByName('M3').AsInteger :=
          Table_DPLN.FieldByName('Kol3').AsInteger;
        maket := Table_DPLN.FieldByName('NM').AsString +
          Table_DPLN.FieldByName('PMak').AsString +
          aNP01DPL.FieldByName('KI').AsString +
          del_prob(Table_DPLN.FieldByName('chert').AsString) +
          Table_DPLN.FieldByName('PMod').AsString + '0' +
          add_nol(inttostr(Sum_Kvartal), 9, 'left') + s_field1 + s_field2 +
          s_field3;
        if (Table_DPLN.FieldByName('PMak').AsInteger <> 1) and
          (Table_DPLN.FieldByName('PMak').AsInteger <> 3) then
          maket := maket + add_nol(ClearMarshrut, 24, 'right')
        else
        begin
          if length(ClearMarshrut) <= 4 then
            str_prom := add_nol(ClearMarshrut, 4, 'right')
          else
            str_prom := copy(ClearMarshrut, length(ClearMarshrut) - 3, 4);
          str_prom := str_prom + copy('                        ', 1, 24 -
            length(str_prom));
          maket := maket + str_prom;
        end;
        aNP01DPL.Post;
        Write(f, maket);
        str01.Text := str01.Text + maket;
      end;
      Form5.Table_DPLN.Next;
    end;
    if par_po = 'yes' then
    begin
      maket := '';
      str_prom := LeftStr(form6.Edit1.Text + dupestring(' ', 74), 74);
      s1 := str_prom;
      chartooem(Pchar(s1), Pchar(s1));
      maket := 'P0' + form6.MaskEdit1.Text + s1;
      str01.Text := str01.Text + maket;
      Write(f, maket);
    end;
    {    if par_po = 'yes' then
          po := 1;}
    CloseFile(f);
    try
      str01.SaveToFile(GetTempDir + 'np01vn-dpl.txt');
    except
      ShowMessage('Ошибка сохранения временного файла макета' + GetTempDir +
        'np01vn-dpl.txt');
    end;
    AssignFile(f1, savedir + '\DPL.txt');
    //    AssignFile(f1, 'a:\DPL.txt');
{$I-}
    reset(f1, 1);
{$I+}
    if IOResult = 0 then
    begin
      chP0 := 0;
      chP1 := 0;
      repeat
        BlockRead(f1, Buf, SizeOf(Buf), NumRead);
        if NumRead <> 0 then
        begin
          if (buf[1] + buf[2]) = 'P0' then
            chP0 := chP0 + 1;
          if (buf[1] + buf[2]) = 'P1' then
            chP1 := chP1 + 1;
        end;
      until (NumRead = 0);
    end;
    CloseFile(f1);
    AssignFile(f, savedir + '\SPRAVKA.txt');
    Rewrite(f);
    Writeln(f,
      '* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *');
    Writeln(f, '   Дата ' + datetostr(Date) + '               Время   ' +
      timetostr(Time));
    Writeln(f, '   Макеты для директивного плана  *DPL.txt*');
    Writeln(f, '');
    // Writeln(f,'   Всего записей за '+datetostr(Date)+'   -        '+inttostr(Form5.Table_DPLN.RecordCount+po));
    Writeln(f, '   Всего записей за ' + datetostr(Date) + '   -        ' +
      inttostr(chP0 + chP1));
    Writeln(f, '       в том числе:');
    //Writeln(f,'         макет Р0  -   '+IntToStr(po));
    //Writeln(f,'         макет Р1  -   '+inttostr(Form5.Table_DPLN.RecordCount));
    Writeln(f, '         макет Р0  -   ' + IntToStr(chP0));
    Writeln(f, '         макет Р1  -   ' + inttostr(chP1));
    Writeln(f,
      '* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *');
    CloseFile(f);
    //**** считаем для времен файла
 (*   AssignFile(f1, GetTempDir + 'np01vn-dpl.txt');
    //    AssignFile(f1, 'a:\DPL.txt');
{$I-}
    reset(f1, 1);
{$I+}
    if IOResult = 0 then
    begin
      chP0 := 0;
      chP1 := 0;
      repeat
        BlockRead(f1, Buf, SizeOf(Buf), NumRead);
        if NumRead <> 0 then
        begin
          if (buf[1] + buf[2]) = 'P0' then
            chP0 := chP0 + 1;
          if (buf[1] + buf[2]) = 'P1' then
            chP1 := chP1 + 1;
        end;
      until (NumRead = 0);
    end;
    CloseFile(f1);
    str01.Clear;
    str01.Add('* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *');
    str01.Add('   Дата ' + datetostr(Date) + '               Время   ' +
      timetostr(Time));
    str01.Add('   Макеты для директивного плана  *DPL.txt*');
    str01.Add('');
    // Writeln(f,'   Всего записей за '+datetostr(Date)+'   -        '+inttostr(Form5.Table_DPLN.RecordCount+po));
    str01.Add('   Всего записей за ' + datetostr(Date) + '   -        ' +
      inttostr(chP0 + chP1));
    str01.Add('       в том числе:');
    //Writeln(f,'         макет Р0  -   '+IntToStr(po));
    //Writeln(f,'         макет Р1  -   '+inttostr(Form5.Table_DPLN.RecordCount));
    str01.Add('         макет Р0  -   ' + IntToStr(chP0));
    str01.Add('         макет Р1  -   ' + inttostr(chP1));
    str01.Add('* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *');
    try
      str01.SaveToFile(GetTempDir + 'np01vn-spravka.txt');
    except
      ShowMessage('Ошибка сохранения временного файла справки' + GetTempDir +
        'np01vn-spravka.txt');
    end;
    *)
    //************
    Form7.Close;
    Form6.Close;
    Form5.Close;
    ShellExecute(Handle, nil, PChar(savedir + '\SPRAVKA.txt'), nil, nil,
      SW_RESTORE);
    aNP01DPL.Close;
    FreeAndNil(aNP01DPL);
  end;
  if savedir <> '' then
    try
      params.WriteString('location', 'path', savedir);
    except
    end;
  FreeAndNil(params);
  try
    s1 := NetDir + FmJournal.tbl1.FieldByName('Fname2').AsString + '\NP01F' +
      IntToStr(FmJournal.tbl1.FieldByName('Digit').AsInteger);
    //  FmJournal.tbl1.Edit;
    //  FmJournal.Write2Blob(GetTempDir + 'np01vn-spravka.txt', FmJournal.tbl1,   'Spravka');
  //  FmJournal.Write2Blob(GetTempDir + 'np01vn-dpl.txt', FmJournal.tbl1,  'Maket');
    if FileExists(s1 + Constants.csMakFilePostfix) then
      KoaUtils.fDeleteFile(s1 + Constants.csMakFilePostfix);
    KoaUtils.fCopyFile(GetTempDir + 'np01vn-dpl.txt', s1 +
      Constants.csMakFilePostfix);
    //    if FileExists(s1 + Constants.csSprFilePostfix) then
    //      KoaUtils.fDeleteFile(s1 + Constants.csSprFilePostfix);
    //    KoaUtils.fCopyFile(GetTempDir + 'np01vn-spravka.txt', s1 +
    //      Constants.csSprFilePostfix);
        // FmJournal.tbl1.Post;
  except
    ShowMessage('Ошибка при записи макета в базу');
  end;
  if UseJournal = True then
  begin
    FmJournal.tbl1.Edit;
    FmJournal.tbl1.FieldByName('Kl').AsInteger := chP0 + chP1;
    //Table_DPLN.RecordCount;
    FmJournal.tbl1.Post;
  end;
  FreeAndNil(str01);
  FmJournal.tbl1.Filtered := FilterOld;
  FmJournal.tbl1.RecNo := RecNoOld;
  FmJournal.tbl1.EnableControls;
  {  else
      MessageDlg('Вставьте дискету!!!', mtError, [mbOK], 0);}
end;

procedure TForm5.FormActivate(Sender: TObject);
var
  shablon: string;
  sim: string;
  {sql_str,}cherteg: string;
  Tabl4: TTable;
begin
  lblDoc.Caption := FmJournal.tbl1.FieldByName('Fname2').AsString;
  lblTable.Caption := FmJournal.tbl1.FieldByName('Tname').AsString;
  Table_DPLN.Active := true;
  if id_mess = 6 then
  begin //yes
    if UseJournal = False then
    begin
      Form1.Table_NP01F0.Edit;
      Form1.Table_NP01F0.FieldByName('data').AsString := DateToStr(Date);
      Form1.Table_NP01F0.FieldByName('rekv_P0').AsString := '';
      Form1.Table_NP01F0.Post;
    end
    else
    begin
      FmJournal.tbl1.Edit;
      FmJournal.tbl1.FieldByName('PDate').AsDateTime := Date;
      FmJournal.tbl1.FieldByName('rekv_P0').AsString := '';
      FmJournal.tbl1.Post;
    end;
    if Table_DPLN.RecordCount <> 0 then
    begin
      Query_ins_del_upd.DatabaseName := pyt;
      with Query_ins_del_upd do
      begin
        close;
        SQL.clear;
        SQL.Add('delete ');
        SQL.Add('FROM "' + Name_tDPLN + '"');
        ExecSQL;
      end;
      Query_ins_del_upd.DatabaseName := '';
    end;
    id_mess := 0; //перезаполнение таблицы
  end;
  if id_mess = 0 then
  begin
    sim := ' ';
    shablon := '___ ______ __';
    {Query1.DatabaseName:=pyt;
    with Query1 do begin
       close;
       SQL.clear;
     SQL.Add('select kod,chert,kol,kol1,kol2,kol3,tm1+" "+tm2+" "+tm3+" "+tm4+" "+tm5+" "+tm6+" "+tm7+" "+tm8+" "+tm9+" "+tm10+" "+tm11+" "+tm12 as marshryt');
    SQL.Add('FROM "'+Name_tNP01F+'"');
    SQL.Add('WHERE');
    SQL.Add('chert like "'+shablon+'"');
    if Form1.Table_NP01F0.FieldByName('filename').AsInteger=1 then
    SQL.Add('order by kod');
    Open;end;  }

    {if Query1.RecordCount<>0 then    begin
    //DataSource1.DataSet:=Query1;
    //Table_DPLN.Active:=true;
    {if Table_DPLN.RecordCount<>0 then begin
    Query_ins_del_upd.DatabaseName:=pyt;
    with Query_ins_del_upd do begin
       close;
       SQL.clear;
     SQL.Add('delete ');
    SQL.Add('FROM "'+Name_tDPLN+'"');
    ExecSQL;end;
     Query_ins_del_upd.DatabaseName:='';
     end; }
    {Query_ins_DPLN.DatabaseName:=pyt;
    Query_ins_DPLN.Close;
    Query_ins_DPLN.SQL.Clear;
    Query_ins_DPLN.SQL.Add('insert into "'+Name_tDPLN+'" values ("P1",:pm,:ki,:ch,:pmod,:k,:k1,:k2,:k3,:m)');
    Query_ins_DPLN.Prepare;  }

    {for i:=1 To Query1.RecordCount do  begin

    {
    with Query2_ins_del_upd do begin
       close;
       SQL.clear;
     SQL.Add('insert into P1.db');// (NM,Pmod,KI,Cherteg,Pmod,Kol,Kol1,Kol2, Kol3,Marshryt)');
    SQL.Add('values ');
    SQL.Add('("P1",');
    SQL.Add('"'+form4.ComboBox1.Text+'",');
    SQL.Add('"'+Query1.Fields[0].AsString+'",');
    SQL.Add('"'+Query1.Fields[1].AsString+'","'+form4.ComboBox1.Text+'","'+Query1.Fields[2].AsString+'",');
    SQL.Add('"'+Query1.Fields[3].AsString+'","'+Query1.Fields[4].AsString+'","'+Query1.Fields[5].AsString+'"');
    SQL.Add(',"'+Query1.Fields[6].AsString+'")');
    ExecSQL;end; }
    {Query_ins_DPLN.Params[0].AsString:=form4.ComboBox1.Text;
    Query_ins_DPLN.Params[1].AsString:=Query1.Fields[0].AsString;
    Query_ins_DPLN.Params[2].AsString:=Query1.Fields[1].AsString;
    Query_ins_DPLN.Params[3].AsString:=form4.ComboBox2.Text;
    Query_ins_DPLN.Params[4].AsInteger:=Query1.Fields[2].AsInteger;
    Query_ins_DPLN.Params[5].AsInteger:=Query1.Fields[3].AsInteger;
    Query_ins_DPLN.Params[6].AsInteger:=Query1.Fields[4].AsInteger;
    Query_ins_DPLN.Params[7].AsInteger:=Query1.Fields[5].AsInteger;
    Query_ins_DPLN.Params[8].AsString:=Query1.Fields[6].AsString;
    Query_ins_DPLN.ExecSQL;
    Query1.Next; }
    //end;
    if UseJournal = False then
    begin
      //-- Старый вариант
      Form2.Table_NP01FN.First;
      //for i:=1 To Form2.Table_NP01FN.RecordCount do  begin
      while not Form2.Table_NP01FN.Eof do
      begin
        cherteg := Form2.Table_NP01FN.fieldbyname('chert').AsString;
        if (Length(cherteg) = 13) and // проверка что именно номер чертежа
        (pos(copy(cherteg, 1, 1), '0123456789') <> 0) and
          (pos(' ', cherteg) = 4) and
          (pos(' ', copy(cherteg, 5, 13)) = 7) then
        begin
          {if (Length(cherteg)=13) then
          if(pos(copy(cherteg,1,1),'0123456789')<>0) then
          if (pos(' ',cherteg)=4)then
          if (pos(' ',copy(cherteg,5,13))=7) then begin}
          Table_DPLN.Append;
          Table_DPLN.FieldByName('nm').AsString := 'P1';
          Table_DPLN.FieldByName('pmak').AsString := form4.ComboBox1.Text;
          Table_DPLN.FieldByName('ki').AsString :=
            Form2.Table_NP01FN.FieldByName('kod').AsString;
          Table_DPLN.FieldByName('chert').AsString := cherteg;
          Table_DPLN.FieldByName('pmod').AsString := form4.ComboBox2.Text;
          Table_DPLN.FieldByName('kol1').AsInteger :=
            Form2.Table_NP01FN.FieldByName('kol1').AsInteger;
          Table_DPLN.FieldByName('kol2').AsInteger :=
            Form2.Table_NP01FN.FieldByName('kol2').AsInteger;
          Table_DPLN.FieldByName('kol3').AsInteger :=
            Form2.Table_NP01FN.FieldByName('kol3').AsInteger;
          Table_DPLN.FieldByName('marshryt').AsString :=
            Form2.Table_NP01FN.FieldByName('TM1').AsString + ' ' +
            Form2.Table_NP01FN.FieldByName('TM2').AsString + ' ' +
            Form2.Table_NP01FN.FieldByName('TM3').AsString + ' ' +
            Form2.Table_NP01FN.FieldByName('TM4').AsString + ' ' +
            Form2.Table_NP01FN.FieldByName('TM5').AsString + ' ' +
            Form2.Table_NP01FN.FieldByName('TM6').AsString + ' ' +
            Form2.Table_NP01FN.FieldByName('TM7').AsString + ' ' +
            Form2.Table_NP01FN.FieldByName('TM8').AsString + ' ' +
            Form2.Table_NP01FN.FieldByName('TM9').AsString + ' ' +
            Form2.Table_NP01FN.FieldByName('TM10').AsString + ' ' +
            Form2.Table_NP01FN.FieldByName('TM11').AsString + ' ' +
            Form2.Table_NP01FN.FieldByName('TM12').AsString + ' ';
          Table_DPLN.Post;
        end;
        Form2.Table_NP01FN.Next;
      end;
      // -- / старый вариант
    end
    else
    begin
      // -- новый вариант
      Tabl4 := TTable.Create(nil);
      Tabl4.TableType := ttParadox;
      Tabl4.DatabaseName := pyt;
      Tabl4.TableName := Name_tNP01F;
      Tabl4.ReadOnly := True;
      Tabl4.Open;
      {if CurRec.Sort=0 then
       Tabl4.IndexName := '';
       if CurRec.Sort = 1 then}
      Tabl4.IndexName := 'NP01VN_Kod';
      //      ShowMessage('Fields:'+Tabl4.IndexDefs.Find('NP01VN_Kod').Fields+#10#13'Grouplvl:'+inttostr(Tabl4.IndexDefs.Find('NP01VN_Kod').GroupingLevel)+#10#13'Фильтр '+tabl4.Filter+#10#13'Записей '+inttostr(Tabl4.RecordCount) );
      Tabl4.First;
      while not Tabl4.Eof do
      begin
        cherteg := Tabl4.fieldbyname('chert').AsString;
        if (Length(cherteg) = 13) and //номер чертежа
        (pos(copy(cherteg, 1, 1), '0123456789') <> 0) and
          (pos(' ', cherteg) = 4) and
          (pos(' ', copy(cherteg, 5, 13)) = 7) then
        begin
          Table_DPLN.Append;
          Table_DPLN.FieldByName('nm').AsString := 'P1';
          Table_DPLN.FieldByName('pmak').AsString := form4.ComboBox1.Text;
          Table_DPLN.FieldByName('ki').AsString :=
            Tabl4.FieldByName('kod').AsString;
          Table_DPLN.FieldByName('chert').AsString := cherteg;
          Table_DPLN.FieldByName('pmod').AsString := form4.ComboBox2.Text;
          Table_DPLN.FieldByName('kol1').AsInteger :=
            Tabl4.FieldByName('kol1').AsInteger;
          Table_DPLN.FieldByName('kol2').AsInteger :=
            Tabl4.FieldByName('kol2').AsInteger;
          Table_DPLN.FieldByName('kol3').AsInteger :=
            Tabl4.FieldByName('kol3').AsInteger;
          Table_DPLN.FieldByName('marshryt').AsString :=
            Tabl4.FieldByName('TM1').AsString + ' ' +
            Tabl4.FieldByName('TM2').AsString + ' ' +
            Tabl4.FieldByName('TM3').AsString + ' ' +
            Tabl4.FieldByName('TM4').AsString + ' ' +
            Tabl4.FieldByName('TM5').AsString + ' ' +
            Tabl4.FieldByName('TM6').AsString + ' ' +
            Tabl4.FieldByName('TM7').AsString + ' ' +
            Tabl4.FieldByName('TM8').AsString + ' ' +
            Tabl4.FieldByName('TM9').AsString + ' ' +
            Tabl4.FieldByName('TM10').AsString + ' ' +
            Tabl4.FieldByName('TM11').AsString + ' ' +
            Tabl4.FieldByName('TM12').AsString + ' ';
          Table_DPLN.Post;
        end;
        Tabl4.Next;
      end;
      Tabl4.Close;
      FreeAndNil(Tabl4);
      // -- / новый вариант
    end;

    //DataSource1.DataSet:=Table_P1;
    //DBGrid1.DataSource:=DataSource1;
    Query_ins_DPLN.Close;
    Query_ins_DPLN.UnPrepare;
    Query_ins_DPLN.DatabaseName := '';
    Query1.Close;
    Query1.DatabaseName := '';
    Table_DPLN.First;
    //end;//если запрос из таблицы NVP01VN дал результат
  end; //если надо формировать мак.файл заново или формировать новый(id_mess=0)
end;

procedure TForm5.Table_DPLNCalcFields(DataSet: TDataSet);
begin
  Table_DPLNSumKol.Value := Table_DPLNKol1.AsInteger + Table_DPLNKol2.AsInteger
    + Table_DPLNKol3.AsInteger;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Table_DPLN.First;
  Table_DPLN.Active := False;
  MaskEdit1.Text := '';
end;

procedure TForm5.Table_DPLNBeforeEdit(DataSet: TDataSet);
begin
  znach_pmak := DataSet.Fields[1].AsString;
  znach_ki := DataSet.Fields[2].AsString;
  znach_pmod := DataSet.Fields[4].AsString;
  znach_kol1 := DataSet.Fields[5].AsInteger;
  znach_kol2 := DataSet.Fields[6].AsInteger;
  znach_kol3 := DataSet.Fields[7].AsInteger;
end;

procedure TForm5.Table_DPLNPmakChange(Sender: TField);
begin
  {if Table_P1.Fields[1].AsInteger>4
   then  begin
  ShowMessage('Недопустимое значение');
  Table_P1.Fields[1].AsString:=znach_pmak;
  end;  }
end;

procedure TForm5.Table_DPLNPmakSetText(Sender: TField; const Text: string);
begin
  if text <> ' ' then
  begin
    if (StrToInt(Text) > 4) then
      MessageDlg('Недопустимое значение', mtError, [mbOK], 0)
    else
      Table_DPLNPmak.AsString := Text;
  end;
  //else
    //Table_DPLNPmak.AsString:=Text;
end;

procedure TForm5.Table_DPLNPmodSetText(Sender: TField; const Text: string);
begin
  if text <> ' ' then
  begin
    if StrToInt(Text) > 5 then
      MessageDlg('Недопустимое значение', mtError, [mbOK], 0)
    else
      Table_DPLNPmod.AsString := Text;
  end;
end;

procedure TForm5.Table_DPLNKol1SetText(Sender: TField; const Text: string);
begin
  if (Length(Text) > 9) or (StrToInt(Text) < 0) then
    MessageDlg('Недопустимое значение', mtError, [mbOK], 0)
  else
    Table_DPLNKol1.AsInteger := strtoint(Text);
end;

procedure TForm5.Table_DPLNKol2SetText(Sender: TField; const Text: string);
begin
  if (Length(Text) > 9) or (StrToInt(Text) < 0) then
    MessageDlg('Недопустимое значение', mtError, [mbOK], 0)
  else
    Table_DPLNKol2.AsInteger := strtoint(Text);
end;

procedure TForm5.Table_DPLNKol3SetText(Sender: TField; const Text: string);
begin
  if (Length(Text) > 9) or (StrToInt(Text) < 0) then
    MessageDlg('Недопустимое значение', mtError, [mbOK], 0)
  else
    Table_DPLNKol3.AsInteger := strtoint(Text);
end;

procedure TForm5.BitBtn3Click(Sender: TObject);
begin
  Table_DPLN.Locate('chert', trim(MaskEdit1.Text), [loPartialKey]);

  DBGrid1.SetFocus;

end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
  Table_DPLN.First;
  if MessageDlg('Записать макет Р0?', mtInformation, [mbYes, mbNo], 0) = mrYes
    then
    form6.ShowModal
  else
  begin
    ZapMak('no');
  end;
end;

procedure TForm5.Table_DPLNAfterInsert(DataSet: TDataSet);
begin
  {Table_DPLNNM.ReadOnly:=False;
  Table_DPLN.Edit;
  Table_DPLN.Fields[0].AsString:='P1';
  Table_DPLN.Post;
  Table_DPLNNM.ReadOnly:=True;
  Table_DPLNChert.ReadOnly:=False; }
end;

procedure TForm5.Table_DPLNAfterPost(DataSet: TDataSet);
begin
  // Table_DPLNChert.ReadOnly:=True;
end;

procedure TForm5.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid1.Canvas do
  begin
    if (length(del_prob(Table_DPLN.FieldByName('chert').AsString)) <> 11) or
      (Table_DPLN.FieldByName('Pmak').AsString = '') or
      (Table_DPLN.FieldByName('Pmod').AsString = '') then
    begin
      { if (gdselected in State) then begin
         Brush.Color:=clActiveCaption;
        Font.Color:=clWhite;
         end
        else begin }
      Brush.Color := clYellow;
      Font.Color := clBlack;
      //end;
    end
    else
    begin
      Brush.Color := clWhite;
      Font.Color := clBlack;
    end;

    if (gdselected in State) then
    begin
      Brush.Color := clActiveCaption;
      Font.Color := clWhite;
    end;
    FillRect(Rect);
    if (Column.Index <= 8) then
      TextOut(Rect.Left + (Column.Width - TextWidth(Column.Field.Text)) div 2,
        Rect.Top + 1, Column.Field.Text)
    else
      TextOut(Rect.Left, Rect.Top + 1, Column.Field.Text);
    //Font.Color:=clBlue;
  end;
end;

procedure TForm5.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  lbl1.Caption := IntToStr(DataSource1.DataSet.RecordCount);
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  chkMonth1.Checked := True;
  chkMonth2.Checked := True;
  chkMonth3.Checked := True;
end;

procedure TForm5.FormResize(Sender: TObject);
begin
  if Self.Width < 615 then
    Self.Width := 615;
  if Self.Height < 300 then
    Self.Height := 300;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  Self.AutoScroll := True;
end;

end.

