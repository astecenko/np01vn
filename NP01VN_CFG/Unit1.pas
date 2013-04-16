unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdActns, ActnList, ComCtrls, ToolWin, ActnMan, ActnCtrls,
  ActnMenus, XPStyleActnCtrls, StdCtrls, ExtCtrls, IniFiles;

type
  TForm1 = class(TForm)
    actmgr1: TActionManager;
    stat1: TStatusBar;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    actLoadFile: TAction;
    actFileSave: TAction;
    flxt1: TFileExit;
    pnl1: TPanel;
    spl1: TSplitter;
    pnl2: TPanel;
    mmo1: TMemo;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    actmmb1: TActionMainMenuBar;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    edtBases: TEdit;
    edtNetFileDir: TEdit;
    edtStartDir: TEdit;
    edtDivisions: TEdit;
    edtDivision: TEdit;
    edtNetDir: TEdit;
    edtJournalDir: TEdit;
    edtTMSArhiv: TEdit;
    edtLogDir: TEdit;
    lbl10: TLabel;
    btn1: TButton;
    procedure actLoadFileExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ini: TMemIniFile;

implementation

{$R *.dfm}
const
  csIniLocation = 'location';
  csIniOption = 'option';
  csIniBases = 'basespdo';
  csIniNetFileDir = 'netfiledir';
  csIniStartDir = 'startdir';
  csIniDivisions = 'divisions';
  csIniDivision = 'division';
  csIniNetDir = 'netdir';
  csIniJournalDir = 'journaldir';
  csIniTMSArhiv = 'tms_arhiv2';
  csIniLogDir = 'log_dir';

procedure TForm1.actLoadFileExecute(Sender: TObject);

begin
  if dlgOpen1.Execute then
  begin
    if Assigned(ini) then
      FreeAndNil(ini);
    ini := TMemIniFile.Create(dlgOpen1.FileName);
    edtBases.Text := ini.ReadString(csIniLocation, csIniBases,
      'K:\SYSTEM\Bases.dbf');
    edtNetFileDir.Text := ini.ReadString(csIniLocation, csIniNetFileDir,
      '\\nevz\nevz\ASUP_Data1\BD-ASU\NET\');
    edtStartDir.Text := ini.ReadString(csIniLocation, csIniStartDir, '');
    edtDivisions.Text := ini.ReadString(csIniLocation, csIniDivisions, '');
    edtDivision.Text := ini.ReadString(csIniOption, csIniDivision, '0');
    edtNetDir.Text := ini.ReadString(csIniLocation, csIniNetDir,
      '\\nevz\nevz\ASUP_Public\NP01VN\xxx\Data\');
    edtJournalDir.Text := ini.ReadString(csIniLocation, csIniJournalDir,
      '\\nevz\nevz\ASUP_Public\NP01VN\xxx\Jrnl\');
    edtTMSArhiv.Text := ini.ReadString(csIniLocation, csIniTMSArhiv,
      '\\nevz\nevz\ASUP_Data1\BD-ASU\NET\NP01VN\');
    edtLogDir.Text := ini.ReadString(csIniLocation, csIniLogDir,
      '\\nevz\nevz\ASUP_Public\NP01VN\LOG\xxx\');
  end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Assigned(ini) then
    FreeAndNil(ini);
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  if Assigned(ini) then
    FreeAndNil(ini);
  ini := TMemIniFile.Create('010.010');
  ini.WriteString(csIniLocation, csIniBases, edtBases.Text);
  ini.WriteString(csIniLocation, csIniNetFileDir, edtNetFileDir.Text);
  ini.WriteString(csIniLocation, csIniStartDir, edtStartDir.Text);
  ini.WriteString(csIniLocation, csIniDivisions, edtDivisions.Text);
  ini.WriteString(csIniOption, csIniDivision, edtDivision.Text);
  ini.WriteString(csIniLocation, csIniNetDir, edtNetDir.Text);
  ini.WriteString(csIniLocation, csIniJournalDir, edtJournalDir.Text);
  ini.WriteString(csIniLocation, csIniTMSArhiv, edtTMSArhiv.Text);
  ini.WriteString(csIniLocation, csIniLogDir, edtLogDir.Text);
  mmo1.Clear;
  ini.GetStrings(mmo1.Lines);
end;

end.

