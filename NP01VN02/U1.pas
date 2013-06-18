unit U1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, DB, DBTables, GridsEh, Menus, VKDBFDataSet,
  StdCtrls, Buttons, Mask, ExtCtrls, DBGridEh, DBCtrls, EhLibBDE,
  DBGridEhImpExp, ComCtrls, Grids, DBGrids, CheckLst, MemTableDataEh,
  MemTableEh;

resourcestring
  csFormCaption = 'Просмотр корректировок по чертежам/изделиям  ';
  csNS03 = 'ns03.dbf';
  csNs02nch = 'ns02nch.dbf';
  csBases = 'bases.dbf';
  csTMCaption = 'Тех. маршрут|';

  // csPDOXUSRS_Path = '\\nevz\nevz\ASUP_Data1\BD-ASU\NET\';
  csBasesPath_default = '\\nevz\nevz\ASUP_Data1\SYSTEM\';
  csNetPath_default = '\\nevz\nevz\ASUP_Data1\BD-ASU\NET\';
  // csArhivTMSPath_default = '\\nevz\nevz\Ceh\CEH-ASU\NP01\NP01VN01\';
  csNS03Path_default = '';

type
  TNP01VN02Form1 = class(TForm)
    pnl1: TPanel;
    spl1: TSplitter;
    pnl2: TPanel;
    spl2: TSplitter;
    pnl3: TPanel;
    dbgrdh1: TDBGridEh;
    ds1: TDataSource;
    qry1: TQuery;
    cbbYear: TComboBox;
    btnQ1: TSpeedButton;
    btnQ2: TSpeedButton;
    btnQ3: TSpeedButton;
    btnQ4: TSpeedButton;
    medtChert: TMaskEdit;
    medtKI: TMaskEdit;
    btnSearch: TBitBtn;
    dbmmoDocTitle: TDBMemo;
    lbl1: TLabel;
    dbmmoTable: TDBMemo;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    dbtxtSendDate: TDBText;
    dbtxtQuart: TDBText;
    lbl6: TLabel;
    edtPrimech: TEdit;
    bvl2: TBevel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    edtTable: TEdit;
    edtDoc: TEdit;
    btnExport: TBitBtn;
    dlgSave1: TSaveDialog;
    btn1: TBitBtn;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    lbl10: TLabel;
    medtDocNumb: TMaskEdit;
    lbl11: TLabel;
    medtDocDate: TMaskEdit;
    lbl12: TLabel;
    medt1: TMaskEdit;
    lbl13: TLabel;
    medt2: TMaskEdit;
    btnTable: TSpeedButton;
    btnDoc: TSpeedButton;
    txt1: TStaticText;
    btn3: TButton;
    rg1: TRadioGroup;
    medtDate1: TMaskEdit;
    medtDate2: TMaskEdit;
    btn5: TButton;
    lblSearch: TLabel;
    btnFilter: TSpeedButton;
    btnFind: TSpeedButton;
    btnStructura: TBitBtn;
    DBText1: TDBText;
    N3: TMenuItem;
    NP01VN1: TMenuItem;
    N4: TMenuItem;
    btn2: TButton;
    strngfldqry1Chert: TStringField;
    intgrfldqry1KI: TIntegerField;
    intgrfldqry1Kol: TIntegerField;
    intgrfldqry1Kol_1: TIntegerField;
    intgrfldqry1Kol1: TIntegerField;
    intgrfldqry1Kol2: TIntegerField;
    intgrfldqry1Kol3: TIntegerField;
    strngfldqry1TM1: TStringField;
    strngfldqry1TM2: TStringField;
    strngfldqry1TM3: TStringField;
    strngfldqry1TM4: TStringField;
    strngfldqry1TM5: TStringField;
    strngfldqry1TM6: TStringField;
    strngfldqry1TM7: TStringField;
    strngfldqry1TM8: TStringField;
    strngfldqry1TM9: TStringField;
    strngfldqry1TM10: TStringField;
    strngfldqry1TM11: TStringField;
    strngfldqry1TM12: TStringField;
    strngfldqry1TM13: TStringField;
    strngfldqry1TM14: TStringField;
    strngfldqry1TM15: TStringField;
    strngfldqry1TM16: TStringField;
    strngfldqry1TM17: TStringField;
    strngfldqry1TM18: TStringField;
    strngfldqry1TM19: TStringField;
    strngfldqry1TM20: TStringField;
    strngfldqry1TM21: TStringField;
    strngfldqry1TM22: TStringField;
    strngfldqry1TM23: TStringField;
    strngfldqry1TM24: TStringField;
    strngfldqry1Primech: TStringField;
    smlntfldqry1Quart: TSmallintField;
    strngfldqry1TableTitle: TStringField;
    strngfldqry1DocTitle: TStringField;
    dtfldqry1DocDate: TDateField;
    dtfldqry1SendDate: TDateField;
    intgrfldqry1Kod: TIntegerField;
    strngfldqry1NameDoc: TStringField;
    intgrfldqry1TableID: TIntegerField;
    intgrfldqry1DocID: TIntegerField;
    medtTM: TMaskEdit;
    vkdbfNs02nch: TVKDBFNTX;
    pm2: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    dsChanges: TDataSource;
    tblChanges: TTable;
    intgrfldqry1ItemID: TIntegerField;
    strngfldqry1Changed: TStringField;
    btnChange: TButton;
    qryChangesUpd1: TQuery;
    qryChangesUpd2: TQuery;
    intgrfldChangesItemID: TIntegerField;
    intgrfldChangesTableID: TIntegerField;
    intgrfldChangesKod: TIntegerField;
    strngfldChangesChert: TStringField;
    intgrfldChangesKol_1: TIntegerField;
    intgrfldChangesKol: TIntegerField;
    intgrfldChangesKol1: TIntegerField;
    intgrfldChangesKol2: TIntegerField;
    intgrfldChangesKol3: TIntegerField;
    strngfldChangesTM1: TStringField;
    strngfldChangesTM2: TStringField;
    strngfldChangesTM3: TStringField;
    strngfldChangesTM4: TStringField;
    strngfldChangesTM5: TStringField;
    strngfldChangesTM6: TStringField;
    strngfldChangesTM7: TStringField;
    strngfldChangesTM8: TStringField;
    strngfldChangesTM9: TStringField;
    strngfldChangesTM10: TStringField;
    strngfldChangesTM11: TStringField;
    strngfldChangesTM12: TStringField;
    strngfldChangesTM13: TStringField;
    strngfldChangesTM14: TStringField;
    strngfldChangesTM15: TStringField;
    strngfldChangesTM16: TStringField;
    strngfldChangesTM17: TStringField;
    strngfldChangesTM18: TStringField;
    strngfldChangesTM19: TStringField;
    strngfldChangesTM20: TStringField;
    strngfldChangesTM21: TStringField;
    strngfldChangesTM22: TStringField;
    strngfldChangesTM23: TStringField;
    strngfldChangesTM24: TStringField;
    strngfldChangesPrimech: TStringField;
    dtfldChangesChangeDate: TDateField;
    dbtxtChangeDate: TDBText;
    txtChanged: TStaticText;
    txtDeleted: TStaticText;
    txtAdded: TStaticText;
    qryChangesUpd3: TQuery;
    strngfldChangesWinUser: TStringField;
    dbtxtWinUser: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure cbbYearChange(Sender: TObject);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure btnSearchClick(Sender: TObject);
    procedure pnl1CanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure pnl3CanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure btnExportClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure dbmmoTableDblClick(Sender: TObject);
    procedure dbmmoDocTitleDblClick(Sender: TObject);
    procedure lbl1DblClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure medtDocNumbChange(Sender: TObject);
    procedure medt1Change(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure pnl3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnSearchMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure medtDate1Change(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure medtDate2Change(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnFilterMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnFindClick(Sender: TObject);
    procedure btnStructuraClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure medtChertClick(Sender: TObject);
    procedure medtKIClick(Sender: TObject);
    procedure medt1Click(Sender: TObject);
    procedure medt2Click(Sender: TObject);
    procedure NP01VN1Click(Sender: TObject);
    procedure qry1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure medtTMClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure dbgrdh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    function GetFilter: string;
    function GetChertTitle(const s: string): string;
    //    function GetShifrTitle(const number: string = ''): string;
    procedure SetRecCountInStatus(const DefaultValue: string = '');
    procedure ExportGrid(AllGrid: Boolean);
    procedure FieldSelect(aGrid: TDBGridEh);
    procedure SetFormCaption(const s: string);
    function GetMonthNameFromQuartMonth(const Quart, Month: integer): string;
    procedure SetMonthTableDef;
    procedure CompareFilterDate;
    function ShowDebug(const aSource: string): string;
    function GetNiceTM(DatSet1: TDataSet): string;
    procedure SetTableFilter;
    procedure SetTMCaption(const aTMCaption: string);
  end;

var
  NP01VN02Form1: TNP01VN02Form1;
  PrivDir, TMSDir, TMSDirArh, NS02NCHDir: string;
  ItemInd: Integer;
  SQLDefault: string;
  LocalStorage: string;
  //  CexNum: string;
    //параметры командной строки
  parExt, parTest: Boolean;
  parDir, parKi, parChert, parTM, parPodrazd: string;

implementation
uses ASU_DBF, KoaUtils, SAVLib, SAVLib_DBF, SAVLib_DB, IniFiles, VKDBFNTX,
  DateUtils, U2, U3, U4, ClipB, Constants, CommandLine;
{$R *.dfm}

procedure ArhivNotFound;
begin
  ShowMessage('Каталоги с архивами чертежей не обнаружены!');
  Application.Terminate;
end;

//

function TNP01VN02Form1.ShowDebug(const aSource: string): string;
begin
  if parTest then
    Result := aSource
  else
    Result := '';
end;

procedure TNP01VN02Form1.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
  NetFileDir, BasesPath: string;
  Cmd: TCmdLine;

  procedure CopyConfigNew(const aFileName: string);
  begin
    if (FileExists(GetCurrentDir + '\' + aFileName)) and (not
      (FileExists(LocalStorage + aFileName))) then
      fCopyFile(GetCurrentDir + '\' + aFileName, LocalStorage + aFileName);
  end;

  procedure GetBases;
  var
    table1: TVKDBFNTX;
  begin
    try
      table1 := TVKDBFNTX.Create(Self);
      SAVLib_DBF.InitOpenDBF(table1, BasesPath);
      table1.Open;
      if table1.Locate('name', 'np01vn02', []) then
      begin
        TMSDir := table1.fieldbyname('path').AsString;
        TMSDirArh := table1.fieldbyname('arch').AsString;
        if table1.Locate('name', csNs02nch, []) then
        begin
          NS02NCHDir := table1.fieldbyname('path').AsString;
          if FileExists(NS02NCHDir + csNs02nch) then
          begin
            vkdbfNs02nch.DBFFileName := NS02NCHDir + csNs02nch;
            try
              vkdbfNs02nch.Open;
            except
              NS02NCHDir := '';
            end;
          end
          else
            NS02NCHDir := '';
        end;
        cbbYear.Items.Add('Текущий');
        SAVLib.GetDirList(cbbYear.Items, TMSDirArh);
        cbbYear.ItemIndex := 0; // текущий год определять!
        ItemInd := 0;
        qry1.DatabaseName := TMSDir;
        try
          qry1.Open;
          if tblChanges.Active then
            tblChanges.Close;
          tblChanges.DatabaseName := qry1.DatabaseName;
          tblChanges.Open;
        except
          ShowMessage('Нет доступа к архиву за ' + cbbYear.Text +
            ' год, выберите другой!' + ShowDebug(#10#13'Запрос: ' + qry1.SQL.Text
            + #10#13'БД: ' + qry1.DatabaseName));
          Exit;
        end;

        NP01VN02Form1.Caption := csFormCaption;
        NP01VN02Form1.SetRecCountInStatus;
        if parExt and ((parKi <> '') or (parChert <> '') or (parTM <> '')) then
        begin
          medtKI.Text := parKi;
          medtChert.Text := parChert;
          medtTM.Text := parTM;
          btnFilter.Down := True;
          btnFilter.Click;
        end;
      end
      else
        ArhivNotFound;
    finally
      table1.Active := False;
      FreeAndNil(table1);
    end;
  end;

begin
  Cmd := TCmdLine.Create;
  Cmd.AddBoolKey('E', False, 'EXT');
  Cmd.AddStrKey('T', '', 'TM');
  Cmd.AddStrKey('D', '', 'DIR');
  Cmd.AddStrKey('K', '', 'KI');
  Cmd.AddStrKey('C', '', 'CHERT');
  Cmd.AddStrKey('P', '', 'PODRAZD');
  Cmd.AddBoolKey('A', False, 'ALTER');
  Cmd.RequirePaths(0, 8);
  Cmd.Parse;
  PrivDir := '';
  LocalStorage := SAVLib.GetSpecialFolderLocation(CSIDL_APPDATA,
    FOLDERID_RoamingAppData) + 'NEVZ\OASUP\NP01VN02';
  parDir := '';
  parKi := '';
  parChert := '';
  parTM := '';
  parPodrazd := '';
  parExt := False;
  parTest := False;
  if Cmd.IsValid then
  begin
    parExt := Cmd.BoolKey['E'];
    n3.Visible := parExt;
    NP01VN1.Visible := parExt;
    btnChange.Visible := Cmd.BoolKey['A'];
    dbtxtWinUser.Visible := btnChange.Visible;
    N4.Visible := parExt;
    parDir := Cmd.StrKey['D'];
    if parDir <> '' then
      LocalStorage := IncludeTrailingPathDelimiter(LocalStorage) + parDir;
    parKi := Cmd.StrKey['K'];
    parChert := Cmd.StrKey['C'];
    parTM := Cmd.StrKey['T'];
    parPodrazd := Cmd.StrKey['P'];
  end;
  FreeAndNil(Cmd);
  if not (DirectoryExists(LocalStorage)) then
  begin
    if not (ForceDirectories(LocalStorage)) then
      ShowMessage('Нет доступа к каталогу пользовательских настроек');
  end;
  LocalStorage := IncludeTrailingPathDelimiter(LocalStorage);
  CopyConfigNew('NP01VN02.ini');
  Ini := TIniFile.Create(LocalStorage + 'NP01VN02.ini');
  NetFileDir := Ini.ReadString('location', 'netfiledir',
    csNetPath_default);
  FreeAndNil(ini);
  { TODO 5 -oСтеценко : Вернуть определение сессий назад при релизе!!! }
  SetBDEConfig(NetFileDir, PrivDir);
  // BasesPath := GetCurrentDir + '\cex.ini';
 {  if parCex = '' then
   begin
     ini := TIniFile.Create(BasesPath);
     parCex := Ini.ReadString('АСУ-Цех', '№ Цеха', '');
     FreeAndNil(ini);
   end;              }
  { if parCex <> '' then
   begin
     qry1.SQL.Text := qry1.SQL.Text + ' and (t2.cp ="' + parCex + '") ';
     medtCP.Visible := False;
     parCex := ' Цех №' + parCex + ' ';
   end;}
  SQLDefault := qry1.SQL.Text;
  NS02NCHDir := '';
  BasesPath := GetCurrentDir + '\' + csBases;
  SetTMCaption(csTMCaption);
  txtChanged.Color := RGB(127, 199, 255);
  txtDeleted.Color := RGB(196, 30, 58);
  txtDeleted.Font.Color := clWhite;
  txtAdded.Color := RGB(150, 255, 150);
  if FileExists(BasesPath) then
    GetBases
  else
  begin
    BasesPath := csBasesPath_default + csBases;
    if FileExists(BasesPath) then
      GetBases
    else
    begin
      ShowMessage('Bases не обнаружен');
      Application.Terminate;
    end;
  end;

end;

procedure TNP01VN02Form1.SetFormCaption(const s: string);
begin
  NP01VN02Form1.Caption := csFormCaption + {parCex +} ' - ' + cbbYear.Text +
  ' год  - ' + s + ' стр.';
end;

procedure TNP01VN02Form1.SetRecCountInStatus(const DefaultValue: string = '');
begin
  if dbgrdh1.DataSource.DataSet.Active then
    SetFormCaption(IntToStr(dbgrdh1.DataSource.DataSet.RecordCount))
  else
    SetFormCaption(DefaultValue);
end;

procedure TNP01VN02Form1.cbbYearChange(Sender: TObject);
var
  s: string;
begin
  if cbbYear.ItemIndex = 0 then
    s := TMSDir
  else
    s := TMSDirArh + cbbYear.Text + '\';
  if FileExists(s + 'NP01VN02_2.DB') then
  begin
    qry1.Close;
    qry1.DatabaseName := s;
    if tblChanges.Active then
      tblChanges.Close;
    tblChanges.DatabaseName := qry1.DatabaseName;
    try
      qry1.Open;
      tblChanges.Open;
    except
      ShowMessage('Нет доступа к архиву за ' + cbbYear.Text +
        ', выберите другой год!');
    end;

  end
  else
    ShowMessage('Нет доступа к архиву за ' + cbbYear.Text +
      ', выберите другой год!');
end;

function TNP01VN02Form1.GetFilter: string;
var
  i: Integer;
  q: Boolean;
  s, k, tm_1: string;

  procedure FilterCaption(const s1: string);
  begin
    txt1.Caption := txt1.Caption + s1 + '; ';
  end;

  function GetTMFilterList(const TMwSpace: string): string;
  var
    j, n, v: integer;
    s_tm, s_tm2: string;
  begin
    s_tm := TMwSpace[1] + TMwSpace[2];
    if s_tm <> '  ' then
    begin
      s_tm2 := 'TM1=' + QuotedStr(TMwSpace[1] + TMwSpace[2]);
      FilterCaption(s_tm2);
      Result := '(' + s_tm2 + ')';
    end;
    n := length(TMwSpace);
    n := (n div 3) + 2;
    j := 2;
    while j < n do
    begin
      v := succ(pred(j) * 3);
      s_tm := TMwSpace[v] + TMwSpace[succ(v)];
      if s_tm <> '  ' then
      begin
        if Result <> '' then
          Result := Result + ' AND ';
        s_tm2 := 'TM' + inttostr(j) + '=' + QuotedStr(s_tm);
        FilterCaption(s_tm2);
        Result := Result + '(' + s_tm2 + ')';
      end;
      inc(j);
    end;
  end;

begin
  txt1.Caption := 'Фильтр: ';
  Result := '';
  if medtChert.Text <> '             ' then
  begin
    if Result <> '' then
      Result := Result + ' AND ';
    Result := Result + '(Chert=''' + Trim(medtChert.Text) + ''')';
    FilterCaption('Чртж=' + medtChert.Text);
  end;
  if medtKI.Text <> '    ' then
  begin
    if Result <> '' then
      Result := Result + ' AND ';
    s := Trim(medtKI.Text);
    Result := Result + '(KI=' + s + ')';
    FilterCaption('КИ=' + s);
  end;
  tm_1 := Trim(medtTm.text);
  if (tm_1 <> '') and (N5.Checked) then
  begin
    if Result <> '' then
      Result := Result + ' AND ';
    Result := Result + GetTMFilterList(medtTm.text);
  end;
  if btnTable.Down then
  begin
    if Result <> '' then
      Result := Result + ' AND ';
    Result := Result + '(TableID=' +
      dbgrdh1.DataSource.DataSet.fieldbyname('TableID').AsString + ')';
    FilterCaption('Таблица');
  end
  else if btnDoc.Down then
  begin
    if Result <> '' then
      Result := Result + ' AND ';
    Result := Result + '(DocID=' +
      dbgrdh1.DataSource.DataSet.fieldbyname('DocID').AsString + ')';
    FilterCaption('Документ');
  end;
  q := False;
  s := '';
  for i := 1 to 4 do
  begin
    if (NP01VN02Form1.FindComponent('btnQ' + inttostr(i)) as TSpeedButton).Down
      then
    begin
      if Result <> '' then
      begin
        if q then
        begin
          Result := Result + ' OR ';
          s := s + ','
        end
        else
          Result := Result + ' AND ';
      end;
      if q = false then
        Result := Result + '( ';
      k := IntToStr(i);
      Result := Result + '(Quart=' + k + ')';
      s := s + k;
      q := True;
    end;
  end;
  if s <> '' then
    FilterCaption('Кварт.=' + s);
  if q then
    Result := Result + ' )';
  if Length(Trim(medt1.Text)) = 8 then
  begin
    if Result <> '' then
      Result := Result + ' AND ';
    if (medt2.Enabled) and (Length(Trim(medt2.Text)) = 8) then
    begin
      Result := Result + '( NameDoc=''№ ' + medt1.Text + ' от ' + medt2.Text +
        ''' )';
      FilterCaption('Рекв.=№ ' + QuotedStr(medt1.Text + ' от ' + medt2.Text));
    end
    else
    begin
      Result := Result + '( NameDoc=''№ ' + medt1.Text + ' от *'')';
      FilterCaption('Реквизит=№ ' + medt1.Text + '*');
    end;
  end;
  s := '';
  if rg1.ItemIndex > -1 then
  begin
    if rg1.ItemIndex = 0 then
      s := 'DocDate'
    else
      s := 'SendDate';
    if (medtDate2.Enabled) and (Length(Trim(medtDate2.Text)) = 8) then
    begin
      if Result <> '' then
        Result := Result + ' AND ';
      Result := Result + '( ( ' + s + '>=''' + medtDate1.Text + ''' ) AND ( ' + s
        + '<=''' + medtDate2.Text + ''' ) )';
      FilterCaption(rg1.Caption + rg1.Items[rg1.itemindex] + '=' +
        medtDate1.Text + '-' + medtDate2.Text);
    end
    else if Length(Trim(medtDate1.Text)) = 8 then
    begin
      if Result <> '' then
        Result := Result + ' AND ';
      Result := Result + '( ' + s + '=''' + medtDate1.Text + ''' )';
      FilterCaption(rg1.Caption + ' ' + rg1.Items[rg1.itemindex] + '=' +
        medtDate1.Text);
    end;
  end;
end;

procedure TNP01VN02Form1.SetMonthTableDef;
begin
  dbgrdh1.Columns[4].Title.Caption := '1 месяц';
  dbgrdh1.Columns[5].Title.Caption := '2 месяц';
  dbgrdh1.Columns[6].Title.Caption := '3 месяц';
end;

function TNP01VN02Form1.GetChertTitle(const s: string): string;
begin
  Result := '';
  if (s <> '') and (Length(s) = 13) and (vkdbfns02nch.Active) and
    (Poisk(vkdbfNS02nch, 'chert', s)) then
    Result := vkdbfNS02nch.fieldbyname('naim').AsString
end;

procedure TNP01VN02Form1.ds1DataChange(Sender: TObject; Field: TField);
var
  i: integer;
  s: string;
begin
  if btnChange.Visible then
  begin
    s := dbgrdh1.DataSource.DataSet.FieldByName('NameDoc').AsString;
    if parPodrazd = '' then
      btnChange.Enabled := False
    else if parPodrazd = 'all' then
      btnChange.Enabled := True
    else if Length(s) > 4 then
    begin
      s := s[3] + s[4] + s[5];
      btnChange.Enabled := parPodrazd = s;
    end;
  end;
  if NS02NCHDir <> '' then
    lbl1.Caption :=
      GetChertTitle(dbgrdh1.DataSource.DataSet.FieldByName('Chert').AsString);
  NP01VN02Form1.SetRecCountInStatus;
  if dbgrdh1.DataSource.DataSet.FieldByName('Quart') <> nil then
  begin
    dbgrdh1.Columns[4].Title.Caption := '1 месяц ' +
      GetMonthNameFromQuartMonth(dbgrdh1.DataSource.DataSet.FieldByName('Quart').AsInteger, 1);
    dbgrdh1.Columns[5].Title.Caption := '2 месяц ' +
      GetMonthNameFromQuartMonth(dbgrdh1.DataSource.DataSet.FieldByName('Quart').AsInteger, 2);
    dbgrdh1.Columns[6].Title.Caption := '3 месяц ' +
      GetMonthNameFromQuartMonth(dbgrdh1.DataSource.DataSet.FieldByName('Quart').AsInteger, 3);
  end;
  if tblChanges.Active then
  begin
    if dbgrdh1.DataSource.DataSet.FieldByName('changed').AsString <> '' then
    begin
      dbgrdh1.Columns[0].Footer.Value :=
        tblChanges.fieldbyname('kod').AsString;
      dbgrdh1.Columns[1].Footer.Value :=
        tblChanges.fieldbyname('chert').AsString;
      dbgrdh1.Columns[2].Footer.Value :=
        tblChanges.fieldbyname('kol_1').AsString;
      dbgrdh1.Columns[3].Footer.Value :=
        tblChanges.fieldbyname('kol').AsString;
      dbgrdh1.Columns[4].Footer.Value :=
        tblChanges.fieldbyname('kol1').AsString;
      dbgrdh1.Columns[5].Footer.Value :=
        tblChanges.fieldbyname('kol2').AsString;
      dbgrdh1.Columns[6].Footer.Value :=
        tblChanges.fieldbyname('kol3').AsString;
      dbgrdh1.Columns[37].Footer.Value :=
        tblChanges.fieldbyname('primech').AsString;
      for i := 1 to 24 do
        dbgrdh1.Columns[i + 12].Footer.Value :=
          tblChanges.fieldbyname('tm' + inttostr(i)).AsString;
    end
    else
    begin
      for i := 0 to 37 do
        dbgrdh1.Columns[i].Footer.Value := '';
    end;
  end;
end;

function TNP01VN02Form1.GetMonthNameFromQuartMonth(const Quart, Month: integer):
  string;
begin
  try
    Result := LongMonthNames[3 * (Quart - 1) + Month];
  except
    Result := '';
  end;
end;

procedure TNP01VN02Form1.btnSearchClick(Sender: TObject);
var
  keyval, a: Variant;
  keyfields, tm_1: string;
  list: TStringList;
  i, n, v: Integer;

begin
  if qry1.Active then
  begin
    list := TStringList.Create;
    if medtChert.Text <> '             ' then
      list.Add('Chert=' + Trim(medtChert.Text));
    if medtKI.Text <> '    ' then
      list.Add('KI=' + Trim(medtKI.Text));
    if (Length(Trim(medt1.Text)) = 8) and (Length(Trim(medt2.Text)) = 8) then
      list.Add('NameDoc=№ ' + medt1.Text + ' от ' + medt2.Text);
    tm_1 := Trim(medtTM.Text);
    if tm_1 <> '' then
    begin
      list.Add('TM1=' + tm_1[1] + tm_1[2]);
      n := length(tm_1);
      if n > 2 then
      begin
        n := (n div 3) + 2;
        i := 2;
        while i < n do
        begin
          v := succ(pred(i) * 3);
          list.Add('TM' + inttostr(i) + '=' + tm_1[v] + tm_1[succ(v)]);
          inc(i);
        end;
      end;
    end;
    if list.Count > 0 then
    begin
      if list.Count > 1 then
      begin
        keyfields := '';
        keyval := VarArrayCreate([0, list.count - 1], varOleStr);
        for i := 0 to list.Count - 1 do
        begin
          if i > 0 then
            keyfields := keyfields + ';';
          keyfields := keyfields + list.Names[i];
          a := list.ValueFromIndex[i];
          keyval[i] := a;
        end;
      end
      else
      begin
        keyfields := list.Names[0];
        keyval := list.ValueFromIndex[0];
      end;
      if not (qry1.Locate(keyfields, keyval, [loPartialKey])) then
        ShowMessage('Не найдено!');
    end;
    FreeAndNil(list);
  end;
end;

procedure PanelResize(Panel: TPanel; const MinHeight, MaxHeight: integer);
begin
  if Panel.Height < MinHeight then
    Panel.Height := MinHeight
  else if Panel.Height > MaxHeight then
    Panel.Height := MaxHeight;
end;

procedure TNP01VN02Form1.pnl1CanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if NewHeight > 135 then
    NewHeight := 135
  else if NewHeight < 25 then
    NewHeight := 25;
end;

procedure TNP01VN02Form1.pnl3CanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if NewHeight > 175 then
    NewHeight := 175
  else if NewHeight < 65 then
    NewHeight := 65;
end;

procedure TNP01VN02Form1.FieldSelect(aGrid: TDBGridEh);
var
  frm1: TForm;
  chkb1: TCheckListbox;
  btn01, btn02: TButton;
  i: Integer;
begin
  frm1 := TForm.Create(NP01VN02Form1);
  frm1.Position := poDesktopCenter;
  frm1.BorderStyle := bsDialog;
  frm1.Width := 200;
  frm1.Height := 400;
  frm1.Caption := 'Выберите поля';
  chkb1 := TCheckListBox.Create(frm1);
  btn01 := TButton.Create(frm1);
  btn02 := TButton.Create(frm1);
  chkb1.Parent := frm1;
  btn01.Parent := frm1;
  btn02.Parent := frm1;
  chkb1.Top := 3;
  chkb1.Left := 2;
  chkb1.Width := 190;
  chkb1.Height := 340;
  chkb1.Visible := True;
  btn01.Width := 80;
  btn01.Height := 22;
  btn01.Left := 10;
  btn01.Top := 348;
  btn02.Top := btn01.Top;
  btn02.Height := btn01.Height;
  btn02.Width := btn01.Width;
  btn02.Left := 105;
  btn01.Caption := 'Выбор';
  btn01.ModalResult := mrOk;
  btn02.Caption := 'Отмена';
  btn02.ModalResult := mrCancel;
  btn02.Cancel := True;
  for i := 0 to aGrid.Columns.Count - 1 do
  begin
    chkb1.Items.Add(aGrid.Columns[i].Title.Caption);
    chkb1.Checked[i] := aGrid.Columns[i].Visible;
  end;
  if frm1.ShowModal = mrok then
  begin
    for i := 0 to chkb1.Count - 1 do
      aGrid.Columns[i].Visible := chkb1.Checked[i];
  end;
  FreeAndNil(frm1);
end;

procedure TNP01VN02Form1.ExportGrid(AllGrid: Boolean);
var
  ExpClass: TDBGridEhExportClass;
  Ext: string;
begin
  if dlgSave1.Execute = True then
  begin
    case dlgSave1.FilterIndex of
      4:
        begin
          ExpClass := TDBGridEhExportAsText;
          Ext := 'txt';
        end;
      5:
        begin
          ExpClass := TDBGridEhExportAsCSV;
          Ext := 'csv';
        end;
      3:
        begin
          ExpClass := TDBGridEhExportAsHTML;
          Ext := 'htm';
        end;
      2:
        begin
          ExpClass := TDBGridEhExportAsRTF;
          Ext := 'rtf';
        end;
      1:
        begin
          ExpClass := TDBGridEhExportAsXLS;
          Ext := 'xls';
        end;
    else
      ExpClass := TDBGridEhExportAsXLS;
      Ext := 'xls';
    end;
    if ExpClass <> nil then
    begin
      if UpperCase(Copy(dlgSave1.FileName, Length(dlgSave1.FileName) - 2, 3)) <>
        UpperCase(Ext) then
        dlgSave1.FileName := dlgSave1.FileName + '.' + Ext;
      SaveDBGridEhToExportFile(ExpClass, dbgrdh1, dlgSave1.FileName, AllGrid);
    end;
  end;
end;

procedure TNP01VN02Form1.btnExportClick(Sender: TObject);
begin
  SetMonthTableDef;
  SetTMCaption('TM');
  dbgrdh1.FooterRowCount := 0;
  ExportGrid(True);
  dbgrdh1.FooterRowCount := 1;
  SetTMCaption(csTMCaption);
end;

procedure TNP01VN02Form1.btn1Click(Sender: TObject);
begin
  FieldSelect(dbgrdh1)
end;

procedure TNP01VN02Form1.N1Click(Sender: TObject);
begin
  SetMonthTableDef;
  ExportGrid(False);
end;

procedure TNP01VN02Form1.N2Click(Sender: TObject);
var
  list: TStringList;
  strm1: TMemoryStream;
begin
  SetMonthTableDef;
  list := TStringList.Create;
  strm1 := TMemoryStream.Create;
  WriteDBGridEhToExportStream(TDBGridEhExportAsText, dbgrdh1, strm1, False);
  strm1.Position := 0;
  list.LoadFromStream(strm1);
  SAVLib.CopyTextToClipboard(list.Text);
  FreeAndNil(strm1);
  FreeAndNil(list);
end;

procedure TNP01VN02Form1.dbmmoTableDblClick(Sender: TObject);
begin
  edtTable.Text := dbmmoTable.Text;
end;

procedure TNP01VN02Form1.dbmmoDocTitleDblClick(Sender: TObject);
begin
  edtDoc.Text := dbmmoDocTitle.Text;
end;

procedure TNP01VN02Form1.lbl1DblClick(Sender: TObject);
begin
  if ds1.DataSet.RecordCount > 0 then
  begin
    medtChert.Text := ds1.DataSet.FieldByName('Chert').AsString;
    medtKI.Text := ds1.DataSet.FieldByName('KI').AsString;
    edtPrimech.Text := ds1.DataSet.FieldByName('Primech').AsString;
    medtDocNumb.Text := Copy(ds1.DataSet.FieldByName('NameDoc').AsString, 3, 8);
    medtDocDate.Text := Copy(ds1.DataSet.FieldByName('NameDoc').AsString, 15,
      8);
    edtTable.Text := dbmmoTable.Text;
    edtDoc.Text := dbmmoDocTitle.Text;
    medt1.Text := medtDocNumb.Text;
    medt2.Text := medtDocDate.Text;
    medtTM.Text := GetNiceTM(ds1.DataSet);
  end;
end;

procedure TNP01VN02Form1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if NewWidth < 750 then
    NewWidth := 750;
  if NewHeight < 250 then
    NewHeight := 250;
  if NewHeight > 620 then
    pnl3.Height := 175
  else if NewHeight < 300 then
    pnl3.Height := 65;
end;

function SecondDateControl(const s: string): Boolean;
begin
  Result := (not (s = '   -    ')) and (Length(Trim(s)) = 8);
end;

procedure TNP01VN02Form1.medtDocNumbChange(Sender: TObject);
begin
  medtDocDate.Enabled := SecondDateControl(medtDocNumb.Text);
end;

procedure TNP01VN02Form1.medt1Change(Sender: TObject);
begin
  medt2.Enabled := SecondDateControl(medt1.Text)
end;

procedure TNP01VN02Form1.medtDate1Change(Sender: TObject);
begin
  medtDate2.Enabled := SecondDateControl(medtDate1.Text);
  if medtDate2.Enabled then
    CompareFilterDate;
end;

procedure TNP01VN02Form1.btn3Click(Sender: TObject);
begin
  if pnl1.Height > 25 then
    pnl1.Height := 25
  else
    pnl1.Height := 135;
end;

procedure TNP01VN02Form1.pnl3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  medtChert.Color := clWindow;
  medtKI.Color := clWindow;
  medt1.Color := clWindow;
  medt2.Color := clWindow;
  medtTM.Color := clWindow;
  medtDate1.Color := clWindow;
  medtDate2.Color := clWindow;
  btnQ1.Flat := True;
  btnQ2.Flat := True;
  btnQ3.Flat := True;
  btnQ4.Flat := True;
  btnTable.Flat := True;
  btnDoc.Flat := True;
end;

procedure TNP01VN02Form1.btnSearchMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  medtKI.Color := clSkyBlue;
  medtChert.Color := medtKI.Color;
  medt1.Color := medtKI.Color;
  medt2.Color := medtKI.Color;
  medtTM.Color := medtKI.Color;
end;

procedure TNP01VN02Form1.btn5Click(Sender: TObject);
begin
  medtDate1.Clear;
  medtDate2.Clear;
  rg1.ItemIndex := -1;
  medtChert.Clear;
  medtKI.Clear;
  medtTM.Clear;
  medt2.Clear;
  medt1.Clear;
  btnQ1.Down := False;
  btnQ2.Down := False;
  btnQ3.Down := False;
  btnQ4.Down := False;
  btnDoc.Down := False;
  btnTable.Down := False;
end;

procedure TNP01VN02Form1.CompareFilterDate;
var
  s: string;
begin
  if Length(Trim(medtDate2.Text)) = 8 then
  begin
    try
      if DateUtils.CompareDate(StrToDate(medtDate1.Text),
        StrToDate(medtDate2.Text)) > -1 then
      begin
        s := medtDate2.text;
        medtDate2.Text := medtDate1.Text;
        medtDate1.Text := s;
      end;
    except
    end;
  end;
end;

procedure TNP01VN02Form1.medtDate2Change(Sender: TObject);

begin
  CompareFilterDate;
end;

procedure TNP01VN02Form1.btnFilterClick(Sender: TObject);
var
  s, s1: string;
  i: Integer;
begin
  i := 0;
  if ds1.DataSet.RecNo > 0 then
    i := ds1.DataSet.RecNo;
  if btnFilter.Down then
  begin
    s := GetFilter;
    s1 := Trim(medtTM.Text);
    if (s <> '') or (s1 <> '') then
    begin
      qry1.Filtered := False;
      qry1.Filter := s;
      qry1.Filtered := True;
      if (s1 <> '') and (n6.Checked) then
        txt1.Caption := txt1.Caption + 'TM*=' + QuotedStr(s1) + '; ';
      txt1.Visible := True;

    end;
  end
  else
  begin

    qry1.Filtered := False;
    qry1.Filter := '';
    txt1.Visible := False;
  end;
  if i > 0 then
    ds1.DataSet.RecNo := i;
end;

procedure TNP01VN02Form1.btnFilterMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  medtKI.Color := clSkyBlue;
  medtChert.Color := medtKI.Color;
  medt1.Color := medtKI.Color;
  medt2.Color := medtKI.Color;
  medtDate1.Color := medtKI.Color;
  medtDate2.Color := medtKI.Color;
  medtTM.Color := medtKI.Color;
  btnQ1.Flat := False;
  btnQ2.Flat := False;
  btnQ3.Flat := False;
  btnQ4.Flat := False;
  btnTable.Flat := False;
  btnDoc.Flat := False;
end;

procedure TNP01VN02Form1.btnFindClick(Sender: TObject);

  procedure TestEdit(const ed, field: string);
  begin
    if Trim(ed) <> '' then
      qry1.SQL.Text := qry1.SQL.Text + ' AND (' + field + ' like ''%' +
        Trim(ed) + '%'')';
  end;

begin
  if btnFind.Down then
  begin
    qry1.Close;
    qry1.SQL.Text := SQLDefault;
    TestEdit(edtPrimech.Text, 't2.Primech');
    TestEdit(edtTable.Text, 't1.Title');
    TestEdit(edtDoc.Text, 't0.Title');
    if Length(Trim(medtDocNumb.Text)) = 8 then
    begin
      if (medtDocDate.Enabled) and (Length(Trim(medtDocDate.Text)) = 8) then
        qry1.SQL.Text := qry1.SQL.Text + ' AND ( NameDoc = ''№ ' +
          medtDocNumb.Text + ' от ' + medtDocDate.Text + ''' )'
      else
        qry1.SQL.Text := qry1.SQL.Text + ' AND ( NameDoc like ''№ ' +
          medtDocNumb.Text + ' от %'')';
    end;
    qry1.Open;
  end
  else
  begin
    {  edtPrimech.Clear;
      edtTable.Clear;
      edtDoc.Clear;
      medtDocNumb.Clear;
      medtDocDate.Clear;}
    qry1.Close;
    qry1.SQL.Text := SQLDefault;
    qry1.Open;
  end;
end;

procedure TNP01VN02Form1.btnStructuraClick(Sender: TObject);
var
  FrmStruct: TNP01VN02Form2;
  procedure GetDoc;
  begin
    edtDoc.Text := FrmStruct.qry1.fieldbyname('Title').AsString;
    medtDocNumb.Text := Copy(FrmStruct.qry1.fieldbyname('NameDoc').AsString, 3,
      8);
    medtDocDate.Text := Copy(FrmStruct.qry1.fieldbyname('NameDoc').AsString, 15,
      8);
    medt1.Text := medtDocNumb.Text;
    medt2.Text := medtDocDate.Text;
    edtPrimech.Clear;
    edtTable.Clear;
    medtChert.Clear;
    medtKI.Clear;
  end;
  procedure GetTable;
  begin
    GetDoc;
    edtTable.Text := FrmStruct.qry2.fieldbyname('Title').AsString;
  end;
begin
  FrmStruct := TNP01VN02Form2.Create(Self);
  FrmStruct.qry1.DatabaseName := qry1.DatabaseName;
  FrmStruct.qry2.DatabaseName := FrmStruct.qry1.DatabaseName;
  FrmStruct.qry3.DatabaseName := FrmStruct.qry1.DatabaseName;
  FrmStruct.qry1.Open;
  FrmStruct.qry2.Open;
  FrmStruct.qry3.Open;
  FrmStruct.qry1.Last;
  case FrmStruct.ShowModal of
    101: GetDoc;
    102: GetTable;
    103:
      begin
        GetTable;
        edtPrimech.Text := FrmStruct.qry3.fieldbyname('Primech').AsString;
        medtKI.Text := FrmStruct.qry3.fieldbyname('Kod').AsString;
        medtChert.Text := FrmStruct.qry3.fieldbyname('Chert').AsString;
        medtTM.Text := GetNiceTM(FrmStruct.qry3);
      end;
  end;
  FrmStruct.qry3.Close;
  FrmStruct.qry2.Close;
  FrmStruct.qry1.Close;
  FreeAndNil(FrmStruct);
end;

function GetCurrentUserName: string;
var
  Size: Cardinal;
begin
  Size := MAXCHAR;
  SetLength(Result, Size);
  GetUserName(PChar(Result), Size);
  SetLength(Result, Size);
end;

procedure TNP01VN02Form1.SetTableFilter;
begin

end;

procedure TNP01VN02Form1.btn2Click(Sender: TObject);
var
  frm1: TNP01VN02Form3;
begin
  frm1 := TNP01VN02Form3.Create(Self);
  frm1.ShowModal;
  FreeAndNil(frm1);
end;

procedure TNP01VN02Form1.medtChertClick(Sender: TObject);
begin
  medtChert.SelStart := 0;
end;

procedure TNP01VN02Form1.medtKIClick(Sender: TObject);
begin
  medtKI.SelStart := 0;
end;

procedure TNP01VN02Form1.medt1Click(Sender: TObject);
begin
  medt1.SelStart := 0;
end;

procedure TNP01VN02Form1.medt2Click(Sender: TObject);
begin
  medt2.SelStart := 0;
end;

function TNP01VN02Form1.GetNiceTM(DatSet1: TDataSet): string;
var
  i: integer;
  b: boolean;
  s1, s2: string;
begin
  s1 := '';
  b := true;
  i := 1;
  while (i < 25) and b do
  begin
    s2 := DatSet1.FieldByName('TM' + inttostr(i)).AsString;
    b := s2 <> '';
    if b then
      s1 := s1 + ' ' + padl(s2, 2, '0');
    inc(i);
  end;
  Result := Trim(s1);
end;

procedure TNP01VN02Form1.NP01VN1Click(Sender: TObject);
var
  i, j: integer;
  Rows: TRows;
begin
  if dbgrdh1.SelectedRows.Count > 0 then
  begin
    SetLength(Rows.DBRecAr, dbgrdh1.SelectedRows.Count);
    with dbgrdh1.DataSource.DataSet do
      for i := 0 to dbgrdh1.SelectedRows.Count - 1 do
      begin
        GotoBookmark(pointer(dbgrdh1.SelectedRows.Items[i]));
        Rows.DBRecAr[i].Kod := FieldByName('ki').AsInteger;
        Rows.DBRecAr[i].Chert := FieldByName('chert').AsString;
        Rows.DBRecAr[i].Kol_1 := FieldByName('Kol_1').AsInteger;
        for j := 1 to 3 do
          Rows.DBRecAr[i].Kol[j] := FieldByName('kol' + IntToStr(j)).AsInteger;
        for j := 1 to 24 do
          Rows.DBRecAr[i].TM[j] := FieldByName('TM' + IntToStr(j)).AsString;
        if N4.Checked then
          Rows.DBRecAr[i].Primech := FieldByName('primech').AsString;
      end;
    CopyToClipboard(Rows);
  end;
end;

procedure TNP01VN02Form1.qry1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  i: integer;
  s, s2: string;
begin
  if N6.Checked then
  begin
    s := '';
    s2 := trim(medtTM.Text);
    if s2 <> '' then
    begin
      for i := 7 to 30 do
        s := s + qry1.Fields[i].AsString + ' ';
      Accept := pos(s2, s) > 0;
    end;
  end;
end;

procedure TNP01VN02Form1.SetTMCaption(const aTMCaption: string);
var
  i: integer;
begin
  for i := 1 to 24 do
    dbgrdh1.Columns[i + 12].Title.Caption := aTMCaption + inttostr(i);
end;

procedure TNP01VN02Form1.medtTMClick(Sender: TObject);
begin
  medtTM.SelStart := 0;
end;

procedure TNP01VN02Form1.btnChangeClick(Sender: TObject);
var
  FrmChange: TFrmChange;
  aItemID, aTableID: integer;
  aChert: string;

  procedure FillChangeForm(aDataSet: TDataSet);
  var
    i: integer;
  begin
    FrmChange.medtChert.Text := aDataSet.fieldbyname('Chert').AsString;
    FrmChange.edtPrimech.Text := aDataSet.fieldbyname('Primech').AsString;
    FrmChange.seKol_1.Value := aDataSet.fieldbyname('Kol_1').AsInteger;
    FrmChange.seKol1.Value := aDataSet.fieldbyname('Kol1').AsInteger;
    FrmChange.seKol2.Value := aDataSet.fieldbyname('Kol2').AsInteger;
    FrmChange.seKol3.Value := aDataSet.fieldbyname('Kol3').AsInteger;
    for i := 1 to 24 do
      (FrmChange.FindComponent('medtTM' + inttostr(i)) as TMaskEdit).Text :=
        aDataSet.fieldbyname('TM' + inttostr(i)).AsString;
  end;

  procedure ChangeAction;
  var
    j: integer;

    procedure SmartChangeUpdate(const ItemId_1: integer);
    var
      s: string;
    begin
      if tblChanges.fieldbyname('ItemID').AsInteger = 0 then
      begin
        tblChanges.Append;
        tblChanges.fieldbyname('ItemID').AsInteger := ItemId_1;
        tblChanges.fieldbyname('tableid').AsInteger := aTableID;
      end
      else
        tblChanges.Edit;
      s := dbgrdh1.DataSource.DataSet.FieldByName('NameDoc').AsString;
      if Length(s) > 4 then
        s := s[3] + s[4] + s[5];
      tblChanges.fieldbyname('changedate').AsDateTime := Date;
      tblChanges.fieldbyname('Primech').AsString := FrmChange.edtPrimech.Text;
      tblChanges.fieldbyname('WinUser').AsString := s + '\' +
        GetCurrentUserName;
    end;

  begin
    if FrmChange.ShowModal = mrOk then
    begin
      case FrmChange.rg1.ItemIndex of
        -1: // не выбрано
          begin
            ShowMessage('Не выбрано действие');
            ChangeAction;
          end;
        0: // изменение
          begin
            SmartChangeUpdate(aItemID);
            tblChanges.fieldbyname('chert').AsString :=
              FrmChange.medtChert.Text;
            tblChanges.fieldbyname('kod').AsInteger :=
              FrmChange.seKod.Value;
            tblChanges.fieldbyname('kol_1').AsInteger :=
              FrmChange.seKol_1.Value;
            tblChanges.fieldbyname('kol').AsString :=
              FrmChange.edtItogo.Text;
            tblChanges.fieldbyname('kol1').AsInteger :=
              FrmChange.seKol1.Value;
            tblChanges.fieldbyname('kol2').AsInteger :=
              FrmChange.seKol2.Value;
            tblChanges.fieldbyname('kol3').AsInteger :=
              FrmChange.seKol3.Value;
            for j := 1 to 24 do
              tblChanges.fieldbyname('tm' + inttostr(j)).AsString :=
                (FrmChange.FindComponent('medtTM' + inttostr(j)) as
                TMaskEdit).Text;
            tblChanges.Post;
            qryChangesUpd1.ParamByName('changed').AsString := 'И';
            qryChangesUpd1.ParamByName('itemid').AsInteger := aItemID;
            qryChangesUpd1.ExecSQL;
            dbgrdh1.DataSource.DataSet.Close;
            dbgrdh1.DataSource.DataSet.Open;
            dbgrdh1.DataSource.DataSet.Locate('ItemID', aItemID, [])
          end;
        1: // удаление
          begin
            SmartChangeUpdate(aItemID);
            tblChanges.Post;
            qryChangesUpd1.ParamByName('changed').AsString := 'У';
            qryChangesUpd1.ParamByName('itemid').AsInteger := aItemID;
            qryChangesUpd1.ExecSQL;
            dbgrdh1.DataSource.DataSet.Close;
            dbgrdh1.DataSource.DataSet.Open;
            dbgrdh1.DataSource.DataSet.Locate('ItemID', aItemID, [])
          end;
        2: // добавление
          begin
            qryChangesUpd2.ParamByName('changed').AsString := 'Д';
            qryChangesUpd2.ParamByName('kod').AsInteger :=
              FrmChange.seKod.Value;
            qryChangesUpd2.ParamByName('kol_1').AsInteger :=
              FrmChange.seKol_1.Value;
            qryChangesUpd2.ParamByName('kol').AsInteger :=
              StrToint(FrmChange.edtItogo.Text);
            qryChangesUpd2.ParamByName('kol1').AsInteger :=
              FrmChange.seKol1.Value;
            qryChangesUpd2.ParamByName('kol2').AsInteger :=
              FrmChange.seKol2.Value;
            qryChangesUpd2.ParamByName('kol3').AsInteger :=
              FrmChange.seKol3.Value;
            qryChangesUpd2.ParamByName('tableid').AsInteger := aTableID;
            for j := 1 to 24 do
              qryChangesUpd2.ParamByName('tm' + inttostr(j)).AsString :=
                (FrmChange.FindComponent('medtTM' + inttostr(j)) as
                TMaskEdit).Text;
            qryChangesUpd2.ParamByName('Primech').AsString :=
              FrmChange.edtPrimech.Text;
            qryChangesUpd2.ParamByName('chert').AsString :=
              FrmChange.medtChert.Text;
            qryChangesUpd2.Prepare;
            //showmessage(qryChangesUpd2.Params.ParseSQL(qryChangesUpd2.Text,  False));
            qryChangesUpd2.ExecSQL;
            dbgrdh1.DataSource.DataSet.Close;
            dbgrdh1.DataSource.DataSet.Open;
            if dbgrdh1.DataSource.DataSet.Locate('tableid;chert;ki;changed',
              VarArrayOf([aTableID, FrmChange.medtChert.Text,
              FrmChange.seKod.Text, 'Д']), []) then
            begin
              SmartChangeUpdate(dbgrdh1.DataSource.DataSet.FieldByName('ItemID').AsInteger);
              tblChanges.Post;
            end;
          end;
        {3:  // удаление инфы о корректировках
          begin
            if (dbgrdh1.DataSource.DataSet.fieldbyname('Changed').AsString = 'И')
              or (dbgrdh1.DataSource.DataSet.fieldbyname('Changed').AsString =
              'У') then
            begin
              qryChangesUpd1.ParamByName('changed').AsString := '';
              qryChangesUpd1.ParamByName('itemid').AsInteger := aItemID;
              qryChangesUpd1.ExecSQL;
              qryChangesUpd3.ParamByName('itemid').AsInteger := aItemID;
              qryChangesUpd3.ExecSQL;
              dbgrdh1.DataSource.DataSet.Close;
              dbgrdh1.DataSource.DataSet.Open;
              dbgrdh1.DataSource.DataSet.Locate('ItemID', aItemID, [])
            end
            else
              Showmessage('Удалить корректировку для текущей записи нельзя');
          end;}
      end;
    end;
  end;

begin
  FrmChange := TFrmChange.Create(Self);
  qryChangesUpd1.DatabaseName := qry1.DatabaseName;
  qryChangesUpd2.DatabaseName := qry1.DatabaseName;
  qryChangesUpd3.DatabaseName := qry1.DatabaseName;
  aItemID := dbgrdh1.DataSource.DataSet.FieldByName('ItemID').AsInteger;
  aTableID := dbgrdh1.DataSource.DataSet.FieldByName('TableID').AsInteger;
  aChert := dbgrdh1.DataSource.DataSet.FieldByName('Chert').AsString;
  if dbgrdh1.DataSource.DataSet.fieldbyname('Changed').AsString = 'И' then
  begin
    FillChangeForm(tblChanges);
    FrmChange.seKod.Value := tblChanges.fieldbyname('Kod').AsInteger;
  end
  else
  begin
    FillChangeForm(dbgrdh1.DataSource.DataSet);
    FrmChange.seKod.Value :=
      dbgrdh1.DataSource.DataSet.fieldbyname('KI').AsInteger;
  end;
  ChangeAction;
  FreeAndNil(FrmChange);
end;

procedure TNP01VN02Form1.dbgrdh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (dbgrdh1.DataSource.DataSet.Active) and
    (dbgrdh1.DataSource.DataSet.FieldByName('changed').AsString <> '') then
    case dbgrdh1.DataSource.DataSet.FieldByName('changed').AsString[1] of
      'И': //изменено
        Background := txtChanged.Color;
      'У':
        begin //удалено
          Background := txtDeleted.Color;
          AFont.Color := clWhite;
        end;
      'Д': //добавлено
        Background := txtAdded.Color;
    end;
end;

procedure TNP01VN02Form1.FormDestroy(Sender: TObject);
begin
 tblChanges.Close;
 qry1.Close;
 if PrivDir <> '' then
    RemoveDir(PrivDir);
end;

end.

