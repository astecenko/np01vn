unit U1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, DB, DBTables, GridsEh, Menus, VKDBFDataSet,
  StdCtrls, Buttons, Mask, ExtCtrls, DBGridEh, DBCtrls, EhLibBDE,
  DBGridEhImpExp, ComCtrls, Grids, DBGrids, CheckLst, MemTableDataEh,
  MemTableEh;

resourcestring
  csFormCaption = 'Просмотр корректировок лимита ТМЦ  ';
  csNS03 = 'ns03.dbf';
  csBases = 'bases.dbf';

  // csPDOXUSRS_Path = '\\nevz\nevz\ASUP_Data1\BD-ASU\NET\';
  csBasesPath_default = '\\nevz\nevz\ASUP_Data1\SYSTEM\';
  csNetPath_default = '\\nevz\nevz\ASUP_Data1\BD-ASU\NET\';
  // csArhivTMSPath_default = '\\nevz\nevz\Ceh\CEH-ASU\NP01\NP01VN01\';
  csNS03Path_default = '';

type
  TNP01VN01Form1 = class(TForm)
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
    medtShifr: TMaskEdit;
    medtCP: TMaskEdit;
    medtKI: TMaskEdit;
    btnSearch: TBitBtn;
    fltfldqry1Itog: TFloatField;
    strngfldqry1Cp: TStringField;
    strngfldqry1Shifr: TStringField;
    strngfldqry1KI: TStringField;
    strngfldqry1Eim: TStringField;
    strngfldqry1Kol: TStringField;
    strngfldqry1Kol2: TStringField;
    strngfldqry1Kol3: TStringField;
    strngfldqry1Znak: TStringField;
    strngfldqry1Primech: TStringField;
    strngfldqry1TableTitle: TStringField;
    strngfldqry1DocTitle: TStringField;
    dtfldqry1DocDate: TDateField;
    dtfldqry1SendDate: TDateField;
    dbmmoDocTitle: TDBMemo;
    lbl1: TLabel;
    dbmmoTable: TDBMemo;
    vkdbfNS03: TVKDBFNTX;
    smlntfldqry1Quart: TSmallintField;
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
    intgrfldqry1Kod: TIntegerField;
    strngfldqry1NameDoc: TStringField;
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
    intgrfldqry1TableID: TIntegerField;
    intgrfldqry1DocID: TIntegerField;
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
    strngfldqry1Vp: TStringField;
    intgrfldqry1Podrazd: TIntegerField;
    strngfldqry1Norma: TStringField;
    NP01VN2: TMenuItem;
    N4: TMenuItem;
    lbl14: TLabel;
    medtPodrazd: TMaskEdit;
    btn2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbbYearChange(Sender: TObject);
    procedure qry1CalcFields(DataSet: TDataSet);
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
    procedure NP01VN1Click(Sender: TObject);
    procedure NP01VN2Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure medtShifrClick(Sender: TObject);
    procedure medtCPClick(Sender: TObject);
    procedure medtKIClick(Sender: TObject);
    procedure medt1Click(Sender: TObject);
    procedure medt2Click(Sender: TObject);
  private
    { Private declarations }
  public
    function GetFilter: string;
    function GetShifrTitle(const number: string = ''): string;
    procedure SetRecCountInStatus(const DefaultValue: string = '');
    procedure ExportGrid(AllGrid: Boolean);
    procedure FieldSelect;
    procedure SetFormCaption(const s: string);
    function GetMonthNameFromQuartMonth(const Quart, Month: integer): string;
    procedure SetMonthTableDef;
    procedure CompareFilterDate;
    function ShowDebug(const aSource: string): string;
    procedure CopyToClipOst(const WithNorma: boolean = True);
    procedure SetTableFilter;
  end;

var
  NP01VN01Form1: TNP01VN01Form1;
  PrivDir, TMSDir, TMSDirArh, NS03Dir: string;
  ItemInd: Integer;
  SQLDefault: string;
  LocalStorage: string;
  //  CexNum: string;
    //параметры командной строки
  parExt, parTest: Boolean;
  parDir, parKi, parShifr, parCp, parPodrazd, parCex: string;

implementation
uses ASU_DBF, KoaUtils, SAVLib, SAVLib_DBF, SAVLib_DB, IniFiles, VKDBFNTX,
  DateUtils, U2, U3, ClipB, Constants, CommandLine;
{$R *.dfm}

procedure ArhivNotFound;
begin
  ShowMessage('Каталоги с архивами ТМЦ не обнаружены!');
  Application.Terminate;
end;

//

function TNP01VN01Form1.ShowDebug(const aSource: string): string;
begin
  if parTest then
    Result := aSource
  else
    Result := '';
end;

procedure TNP01VN01Form1.FormCreate(Sender: TObject);
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
      if table1.Locate('name', 'np01vn01', []) then
      begin
        TMSDir := table1.fieldbyname('path').AsString;
        TMSDirArh := table1.fieldbyname('arch').AsString;
        if table1.Locate('name', csNS03, []) then
        begin
          NS03Dir := table1.fieldbyname('path').AsString;
          if FileExists(NS03Dir + csNS03) then
          begin
            vkdbfNS03.DBFFileName := NS03Dir + csNS03;
            try
              vkdbfNS03.Open;
            except
              NS03Dir := '';
            end;
          end
          else
            NS03Dir := '';
        end;
        cbbYear.Items.Add('Текущий');
        SAVLib.GetDirList(cbbYear.Items, TMSDirArh);
        cbbYear.ItemIndex := 0; // текущий год определять!
        ItemInd := 0;
        {   if FileExists(TMSDir + 'NP01VN01_2.DB') then
           begin}
        qry1.DatabaseName := TMSDir;
        try
          qry1.Open;
        except
          ShowMessage('Нет доступа к архиву за ' + cbbYear.Text +
            ' год, выберите другой!' + ShowDebug(#10#13'Запрос: ' + qry1.SQL.Text
            + #10#13'БД: ' + qry1.DatabaseName));
          Exit;
        end;
        {  end
          else
            ShowMessage('Нет доступа к архиву за ' + cbbYear.Text +
              ', выберите другой год!');}
        NP01VN01Form1.Caption := csFormCaption;
        NP01VN01Form1.SetRecCountInStatus;
        if parExt and ((parKi <> '') or (parCp <> '') or (parShifr <> '') or
          (parPodrazd <> '')) then
        begin
          medtKI.Text := parKi;
          medtCP.Text := parCp;
          medtPodrazd.Text := parPodrazd;
          medtShifr.Text := parShifr;
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
  Cmd.AddBoolKey('T', False, 'TEST');
  Cmd.AddStrKey('D', '', 'DIR');
  Cmd.AddStrKey('K', '', 'KI');
  Cmd.AddStrKey('S', '', 'SHIFR');
  Cmd.AddStrKey('C', '', 'CP');
  Cmd.AddStrKey('P', '', 'PODRAZD');
  Cmd.AddStrKey('X', '', 'CEX');
  Cmd.RequirePaths(0, 8);
  Cmd.Parse;
  PrivDir := '';
  LocalStorage := SAVLib.GetSpecialFolderLocation(CSIDL_APPDATA,
    FOLDERID_RoamingAppData) + 'NEVZ\OASUP\NP01VN01';
  {if ParamCount > 0 then
  begin
    if ParamStr(1) = '/ext' then
    begin
      n3.Visible := True;
      NP01VN1.Visible := True;
      NP01VN2.Visible := True;
      if ParamCount > 1 then
        LocalStorage := LocalStorage + '\' + ParamStr(2);
    end
    else
      LocalStorage := LocalStorage + '\' + ParamStr(1);
  end; }
  parDir := '';
  parKi := '';
  parShifr := '';
  parCp := '';
  parPodrazd := '';
  parExt := False;
  parTest := False;
  parCex := '';
  if Cmd.IsValid then
  begin
    parExt := Cmd.BoolKey['E'];
    n3.Visible := parExt;
    NP01VN1.Visible := parExt;
    NP01VN2.Visible := parExt;
    N4.Visible := parExt;
    parDir := Cmd.StrKey['D'];
    if parDir <> '' then
      LocalStorage := IncludeTrailingPathDelimiter(LocalStorage) + parDir;
    parKi := Cmd.StrKey['K'];
    parShifr := Cmd.StrKey['S'];
    parCp := Cmd.StrKey['C'];
    parTest := Cmd.BoolKey['T'];
    parPodrazd := Cmd.StrKey['P'];
    parCex := Cmd.StrKey['X'];
  end;
  FreeAndNil(Cmd);
  if not (DirectoryExists(LocalStorage)) then
  begin
    if not (ForceDirectories(LocalStorage)) then
      ShowMessage('Нет доступа к каталогу пользовательских настроек');
  end;
  LocalStorage := IncludeTrailingPathDelimiter(LocalStorage);
  CopyConfigNew('NP01VN01.ini');
  Ini := TIniFile.Create(LocalStorage + 'NP01VN01.ini');
  NetFileDir := Ini.ReadString('location', 'netfiledir',
    csNetPath_default);
  FreeAndNil(ini);
  SetBDEConfig(NetFileDir, PrivDir);
  BasesPath := GetCurrentDir + '\cex.ini';
  if parCex = '' then
  begin
    ini := TIniFile.Create(BasesPath);
    parCex := Ini.ReadString('АСУ-Цех', '№ Цеха', '');
    FreeAndNil(ini);
  end;
  if parCex <> '' then
  begin
    qry1.SQL.Text := qry1.SQL.Text + ' and (t2.cp ="' + parCex + '") ';
    medtCP.Visible := False;
    parCex := ' Цех №' + parCex + ' ';
  end;
  SQLDefault := qry1.SQL.Text;
  NS03Dir := csNS03Path_default;
  BasesPath := GetCurrentDir + '\' + csBases;
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

procedure TNP01VN01Form1.SetFormCaption(const s: string);
begin
  NP01VN01Form1.Caption := csFormCaption + parCex + ' - ' + cbbYear.Text +
    ' год  - ' + s + ' стр.';
end;

procedure TNP01VN01Form1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry1.Close;
  if PrivDir <> '' then
    RemoveDir(PrivDir);
end;

procedure TNP01VN01Form1.SetRecCountInStatus(const DefaultValue: string = '');
begin
  if dbgrdh1.DataSource.DataSet.Active then
    SetFormCaption(IntToStr(dbgrdh1.DataSource.DataSet.RecordCount))
  else
    SetFormCaption(DefaultValue);
end;

function TNP01VN01Form1.GetShifrTitle(const number: string = ''): string;
var
  numb: string;
begin
  if number = '' then
    numb := dbgrdh1.DataSource.DataSet.fieldbyname('shifr').AsString
  else
    numb := number;
  if Poisk(vkdbfNS03, 'shm', numb) then
    Result := vkdbfNS03.fieldbyname('namm').AsString
  else
    Result := '';
end;

procedure TNP01VN01Form1.cbbYearChange(Sender: TObject);
var
  s: string;
begin
  if cbbYear.ItemIndex = 0 then
    s := TMSDir
  else
    s := TMSDirArh + cbbYear.Text + '\';
  if FileExists(s + 'NP01VN01_2.DB') then
  begin
    qry1.Close;
    qry1.DatabaseName := s;
    try
      qry1.Open;
    except
      ShowMessage('Нет доступа к архиву за ' + cbbYear.Text +
        ', выберите другой год!');
    end;
  end
  else
    ShowMessage('Нет доступа к архиву за ' + cbbYear.Text +
      ', выберите другой год!');
end;

function TNP01VN01Form1.GetFilter: string;
var
  i: Integer;
  q: Boolean;
  s, k: string;
  procedure FilterCaption(const s: string);
  begin
    txt1.Caption := txt1.Caption + s + '; ';
  end;

begin
  txt1.Caption := 'Фильтр: ';
  Result := '';
  if medtCP.Text <> '  ' then
  begin
    Result := '(Cp=''' + medtCP.Text + '*'')';
    FilterCaption('ЦП=' + medtCP.Text);
  end;
  if medtShifr.Text <> '        ' then
  begin
    if Result <> '' then
      Result := Result + ' AND ';
    Result := Result + '(Shifr=''' + Trim(medtShifr.Text) + ''')';
    FilterCaption('Шифр=' + medtShifr.Text);
  end;
  if medtKI.Text <> '    ' then
  begin
    if Result <> '' then
      Result := Result + ' AND ';
    Result := Result + '(KI=''' + Trim(medtKI.Text) + ''')';
    FilterCaption('КИ=' + medtKI.Text);
  end;
  if medtPodrazd.Text <> '   ' then
  begin
    if Result <> '' then
      Result := Result + ' AND ';
    Result := Result + '(Podrazd=''' + Trim(medtPodrazd.Text) + ''')';
    FilterCaption('Подр=' + medtPodrazd.Text);
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
    if (NP01VN01Form1.FindComponent('btnQ' + inttostr(i)) as TSpeedButton).Down
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
      FilterCaption('Реквизит=№ ' + medt1.Text + ' от ' + medt2.Text);
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

procedure TNP01VN01Form1.qry1CalcFields(DataSet: TDataSet);
begin
  fltfldqry1Itog.Value :=
    StrToFloatDef(DataSet.FieldByName('Kol').AsString, 0) +
    StrToFloatDef(DataSet.FieldByName('Kol2').AsString, 0) +
    StrToFloatDef(DataSet.FieldByName('Kol3').AsString, 0);
end;

procedure TNP01VN01Form1.SetMonthTableDef;
begin
  dbgrdh1.Columns[6].Title.Caption := '1 месяц';
  dbgrdh1.Columns[7].Title.Caption := '2 месяц';
  dbgrdh1.Columns[8].Title.Caption := '3 месяц';
end;

procedure TNP01VN01Form1.ds1DataChange(Sender: TObject; Field: TField);
begin
  if NS03Dir <> '' then
    lbl1.Caption := GetShifrTitle;
  NP01VN01Form1.SetRecCountInStatus;
  if dbgrdh1.DataSource.DataSet.FieldByName('Quart') <> nil then
  begin
    dbgrdh1.Columns[6].Title.Caption := '1 месяц ' +
      GetMonthNameFromQuartMonth(dbgrdh1.DataSource.DataSet.FieldByName('Quart').AsInteger, 1);
    dbgrdh1.Columns[7].Title.Caption := '2 месяц ' +
      GetMonthNameFromQuartMonth(dbgrdh1.DataSource.DataSet.FieldByName('Quart').AsInteger, 2);
    dbgrdh1.Columns[8].Title.Caption := '3 месяц ' +
      GetMonthNameFromQuartMonth(dbgrdh1.DataSource.DataSet.FieldByName('Quart').AsInteger, 3);
  end;
end;

function TNP01VN01Form1.GetMonthNameFromQuartMonth(const Quart, Month: integer):
  string;
begin
  try
    Result := LongMonthNames[3 * (Quart - 1) + Month];
  except
    Result := '';
  end;
end;

procedure TNP01VN01Form1.btnSearchClick(Sender: TObject);
var
  keyval, a: Variant;
  keyfields: string;
  list: TStringList;
  i: Integer;
begin
  if qry1.Active then
  begin
    list := TStringList.Create;
    if medtCP.Text <> '  ' then
      list.Add('cp=' + Trim(medtCP.Text));
    if medtShifr.Text <> '        ' then
      list.Add('Shifr=' + Trim(medtShifr.Text));
    if medtKI.Text <> '    ' then
      list.Add('KI=' + Trim(medtKI.Text));
    if medtPodrazd.Text <> '   ' then
      list.Add('Podrazd=' + Trim(medtPodrazd.Text));
    if (Length(Trim(medt1.Text)) = 8) and (Length(Trim(medt2.Text)) = 8) then
      list.Add('NameDoc=№ ' + medt1.Text + ' от ' + medt2.Text);
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

procedure TNP01VN01Form1.pnl1CanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if NewHeight > 135 then
    NewHeight := 135
  else if NewHeight < 25 then
    NewHeight := 25;
end;

procedure TNP01VN01Form1.pnl3CanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if NewHeight > 175 then
    NewHeight := 175
  else if NewHeight < 65 then
    NewHeight := 65;
end;

procedure TNP01VN01Form1.FieldSelect;
var
  frm1: TForm;
  chkb1: TCheckListbox;
  btn01, btn02: TButton;
  // chbx1: TCheckBox;
  i: Integer;
  // ini: TIniFile;
   //s: string;
begin
  // ini := TIniFile.Create(GetCurrentDir + '\NP01VN.INI');
 //  s := ini.ReadString('option', 'fieldlist', '');
  frm1 := TForm.Create(NP01VN01Form1);
  frm1.Position := poDesktopCenter;
  frm1.BorderStyle := bsDialog;
  frm1.Width := 200;
  frm1.Height := 400;
  frm1.Caption := 'Выберите поля';
  chkb1 := TCheckListBox.Create(frm1);
  btn01 := TButton.Create(frm1);
  btn02 := TButton.Create(frm1);
  //  chbx1 := TCheckBox.Create(frm1);
  chkb1.Parent := frm1;
  btn01.Parent := frm1;
  btn02.Parent := frm1;
  // chbx1.Parent := frm1;
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
  //  chbx1.Left := 5;
  //  chbx1.Top := 348;
  //  chbx1.Width := 20;
  //  chbx1.Hint := 'Сохранить настройки отображения полей';
  //  chbx1.ShowHint := True;
  {  if s = '' then   }
  for i := 0 to dbgrdh1.Columns.Count - 1 do
  begin
    chkb1.Items.Add(dbgrdh1.Columns[i].Title.Caption);
    chkb1.Checked[i] := dbgrdh1.Columns[i].Visible;
  end;
  {    else
        SAVLib.String2CheckList(s, chkb1);}
  if frm1.ShowModal = mrok then
  begin
    for i := 0 to chkb1.Count - 1 do
      dbgrdh1.Columns[i].Visible := chkb1.Checked[i];
    {    if chbx1.Checked then
        begin
          s := SAVLib.CheckList2String(chkb1);
          ini.WriteString('option', 'fieldlist', s);
        end;}
  end;
  FreeAndNil(frm1);
  // FreeAndNil(ini);
end;

procedure TNP01VN01Form1.ExportGrid(AllGrid: Boolean);
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
      //if Ext <> 'xls' then //?????? ????? ???????
      SaveDBGridEhToExportFile(ExpClass, dbgrdh1, dlgSave1.FileName, AllGrid);

      {if Ext = 'xls' then
      begin
      end;}
    end;
  end;
end;

procedure TNP01VN01Form1.btnExportClick(Sender: TObject);
begin
  SetMonthTableDef;
  ExportGrid(True);
end;

procedure TNP01VN01Form1.btn1Click(Sender: TObject);
begin
  FieldSelect
end;

procedure TNP01VN01Form1.N1Click(Sender: TObject);
begin
  SetMonthTableDef;
  ExportGrid(False);
end;

procedure TNP01VN01Form1.N2Click(Sender: TObject);
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

procedure TNP01VN01Form1.dbmmoTableDblClick(Sender: TObject);
begin
  edtTable.Text := dbmmoTable.Text;
end;

procedure TNP01VN01Form1.dbmmoDocTitleDblClick(Sender: TObject);
begin
  edtDoc.Text := dbmmoDocTitle.Text;
end;

procedure TNP01VN01Form1.lbl1DblClick(Sender: TObject);
begin
  if ds1.DataSet.RecordCount > 0 then
  begin
    medtCP.Text := ds1.DataSet.FieldByName('Cp').AsString;
    medtShifr.Text := ds1.DataSet.FieldByName('Shifr').AsString;
    medtKI.Text := ds1.DataSet.FieldByName('KI').AsString;
    edtPrimech.Text := ds1.DataSet.FieldByName('Primech').AsString;
    medtDocNumb.Text := Copy(ds1.DataSet.FieldByName('NameDoc').AsString, 3, 8);
    medtDocDate.Text := Copy(ds1.DataSet.FieldByName('NameDoc').AsString, 15,
      8);
    edtTable.Text := dbmmoTable.Text;
    edtDoc.Text := dbmmoDocTitle.Text;
    medt1.Text := medtDocNumb.Text;
    medt2.Text := medtDocDate.Text;
  end;
end;

procedure TNP01VN01Form1.FormCanResize(Sender: TObject; var NewWidth,
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

procedure TNP01VN01Form1.medtDocNumbChange(Sender: TObject);
begin
  medtDocDate.Enabled := SecondDateControl(medtDocNumb.Text);
end;

procedure TNP01VN01Form1.medt1Change(Sender: TObject);
begin
  medt2.Enabled := SecondDateControl(medt1.Text)
end;

procedure TNP01VN01Form1.medtDate1Change(Sender: TObject);
begin
  medtDate2.Enabled := SecondDateControl(medtDate1.Text);
  if medtDate2.Enabled then
    CompareFilterDate;
end;

procedure TNP01VN01Form1.btn3Click(Sender: TObject);
begin
  if pnl1.Height > 25 then
    pnl1.Height := 25
  else
    pnl1.Height := 135;
end;

procedure TNP01VN01Form1.pnl3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  medtCP.Color := clWindow;
  medtShifr.Color := clWindow;
  medtKI.Color := clWindow;
  medtPodrazd.Color := clWindow;
  medt1.Color := clWindow;
  medt2.Color := clWindow;
  medtDate1.Color := clWindow;
  medtDate2.Color := clWindow;
  btnQ1.Flat := True;
  btnQ2.Flat := True;
  btnQ3.Flat := True;
  btnQ4.Flat := True;
  btnTable.Flat := True;
  btnDoc.Flat := True;
end;

procedure TNP01VN01Form1.btnSearchMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  medtCP.Color := clSkyBlue;
  medtShifr.Color := medtCP.Color;
  medtPodrazd.Color := medtCP.Color;
  medtKI.Color := medtCP.Color;
  medt1.Color := medtCP.Color;
  medt2.Color := medtCP.Color;
end;

procedure TNP01VN01Form1.btn5Click(Sender: TObject);
begin
  medtDate1.Clear;
  medtDate2.Clear;
  rg1.ItemIndex := -1;
  medtCP.Clear;
  medtShifr.Clear;
  medtPodrazd.Clear;
  medtKI.Clear;
  medt2.Clear;
  medt1.Clear;
  btnQ1.Down := False;
  btnQ2.Down := False;
  btnQ3.Down := False;
  btnQ4.Down := False;
  btnDoc.Down := False;
  btnTable.Down := False;
end;

procedure TNP01VN01Form1.CompareFilterDate;
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

procedure TNP01VN01Form1.medtDate2Change(Sender: TObject);

begin
  CompareFilterDate;
end;

procedure TNP01VN01Form1.btnFilterClick(Sender: TObject);
var
  s: string;
  i: Integer;
begin
  i := 0;
  if ds1.DataSet.RecNo > 0 then
    i := ds1.DataSet.RecNo;
  if btnFilter.Down then
  begin
    s := GetFilter;
    if s <> '' then
    begin
      qry1.Filtered := False;
      qry1.Filter := s;
      qry1.Filtered := True;
      txt1.Visible := (qry1.Filter <> '');
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

procedure TNP01VN01Form1.btnFilterMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  medtCP.Color := clSkyBlue;
  medtShifr.Color := medtCP.Color;
  medtKI.Color := medtCP.Color;
  medtPodrazd.Color := medtCP.Color;
  medt1.Color := medtCP.Color;
  medt2.Color := medtCP.Color;
  medtDate1.Color := medtCP.Color;
  medtDate2.Color := medtCP.Color;
  btnQ1.Flat := False;
  btnQ2.Flat := False;
  btnQ3.Flat := False;
  btnQ4.Flat := False;
  btnTable.Flat := False;
  btnDoc.Flat := False;
end;

procedure TNP01VN01Form1.btnFindClick(Sender: TObject);

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
    edtPrimech.Clear;
    edtTable.Clear;
    edtDoc.Clear;
    medtDocNumb.Clear;
    medtDocDate.Clear;
    qry1.Close;
    qry1.SQL.Text := SQLDefault;
    qry1.Open;
  end;
end;

procedure TNP01VN01Form1.btnStructuraClick(Sender: TObject);
var
  FrmStruct: TNP01VN01Form2;
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
    medtCP.Clear;
    medtShifr.Clear;
    medtKI.Clear;
  end;
  procedure GetTable;
  begin
    GetDoc;
    edtTable.Text := FrmStruct.qry2.fieldbyname('Title').AsString;
  end;
begin
  FrmStruct := TNP01VN01Form2.Create(Self);
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
        medtCP.Text := FrmStruct.qry3.fieldbyname('CP').AsString;
        medtKI.Text := FrmStruct.qry3.fieldbyname('KI').AsString;
        medtShifr.Text := FrmStruct.qry3.fieldbyname('Shifr').AsString;
      end;
  end;
  FrmStruct.qry3.Close;
  FrmStruct.qry2.Close;
  FrmStruct.qry1.Close;
  FreeAndNil(FrmStruct);
end;

procedure TNP01VN01Form1.CopyToClipOst(const WithNorma: boolean = True);
var
  i: integer;
  Rows: TRowsOst;
begin
  if dbgrdh1.SelectedRows.Count > 0 then
  begin
    SetLength(Rows.DBRecAr, dbgrdh1.SelectedRows.Count);
    with dbgrdh1.DataSource.DataSet do
      for i := 0 to dbgrdh1.SelectedRows.Count - 1 do
      begin
        GotoBookmark(pointer(dbgrdh1.SelectedRows.Items[i]));
        Rows.DBRecAr[i].Vp := FieldByName(csField_VP).Asstring[1];
        Rows.DBRecAr[i].Cp := FieldByName(csField_Cp).AsString;
        Rows.DBRecAr[i].Shifr := FieldByName(csField_Shifr).AsString;
        Rows.DBRecAr[i].KI := FieldByName(csField_Ki).AsString;
        Rows.DBRecAr[i].Kol := FieldByName(csField_Kol).AsString;
        //Rows.DBRecAr[i].Podrazd := FieldByName(csField_Shifr).AsInteger;
        Rows.DBRecAr[i].Znak := FieldByName(csField_Znak).AsString[1];
        Rows.DBRecAr[i].Eim := FieldByName(csField_Eim).AsString;
        Rows.DBRecAr[i].Kol2 := FieldByName(csField_Kol2).AsString;
        if N4.Checked then
          Rows.DBRecAr[i].Primech := FieldByName(csField_Primech).AsString;
        Rows.DBRecAr[i].Kol3 := FieldByName(csField_Kol3).AsString;
        if WithNorma then
          Rows.DBRecAr[i].Norma := FieldByName(csField_norma).AsString;
        {Rows.DBRecAr[i].Kol_m := FieldByName(csField_kol_m).AsString;
        Rows.DBRecAr[i].Kol_m2 := FieldByName(csField_kol_m2).AsString;
        Rows.DBRecAr[i].Kol_m3 := FieldByName(csField_kol_m3).AsString;}
        {for j := 1 to 3 do
          Rows.DBRecAr[i].Kol[j] := FieldByName('kol' + IntToStr(j)).AsInteger;
        for j := 1 to 10 do
          Rows.DBRecAr[i].TM[j] := FieldByName('TM' + IntToStr(j)).AsString;}
      end;
    CopyToClipboardOst(Rows);
  end;
end;

procedure TNP01VN01Form1.NP01VN1Click(Sender: TObject);
begin
  CopyToClipOst
end;

procedure TNP01VN01Form1.NP01VN2Click(Sender: TObject);
begin
  CopyToClipOst(False);
end;

procedure TNP01VN01Form1.SetTableFilter;
begin

end;

procedure TNP01VN01Form1.btn2Click(Sender: TObject);
var
  frm1: TNP01VN01Form3;
begin
  frm1 := TNP01VN01Form3.Create(Self);
  frm1.ShowModal;
  FreeAndNil(frm1);
end;

procedure TNP01VN01Form1.medtShifrClick(Sender: TObject);
begin
  medtShifr.SelStart := 0;
end;

procedure TNP01VN01Form1.medtCPClick(Sender: TObject);
begin
  medtCP.SelStart := 0;
end;

procedure TNP01VN01Form1.medtKIClick(Sender: TObject);
begin
  medtKI.SelStart := 0;
end;

procedure TNP01VN01Form1.medt1Click(Sender: TObject);
begin
  medt1.SelStart := 0;
end;

procedure TNP01VN01Form1.medt2Click(Sender: TObject);
begin
  medt2.SelStart := 0;
end;

end.

