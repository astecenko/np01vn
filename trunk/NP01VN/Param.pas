unit Param;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls, Buttons, Spin, Mask, ComCtrls, Grids;

type
  TFmParam = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    se1: TSpinEdit;
    se2: TSpinEdit;
    btn1: TBitBtn;
    btn2: TBitBtn;
    lbl5: TLabel;
    cbb1: TComboBox;
    lbl6: TLabel;
    cbb2: TComboBox;
    chk1: TCheckBox;
    chk2: TCheckBox;
    lbl7: TLabel;
    se3: TSpinEdit;
    lbl8: TLabel;
    edt3: TEdit;
    chk3: TCheckBox;
    chkPrintShifr: TCheckBox;
    chkExchenPrimech: TCheckBox;
    lbl9: TLabel;
    edtPrimech: TEdit;
    chkExchenTitle: TCheckBox;
    lbl10: TLabel;
    edtTitle: TEdit;
    chkAutoSave: TCheckBox;
    seAutoSave: TSpinEdit;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    grp1: TGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    edtDolgnostAdres: TEdit;
    edtFIOAdres: TEdit;
    edtDolgnostPodpis: TEdit;
    edtFIOPodpis: TEdit;
    ts3: TTabSheet;
    chkTest: TCheckBox;
    lbl13: TLabel;
    ts4: TTabSheet;
    strngrd1: TStringGrid;
    btnSaveTemplate: TBitBtn;
    lbl14: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure chkExchenPrimechClick(Sender: TObject);
    procedure chkExchenTitleClick(Sender: TObject);
    procedure chkAutoSaveClick(Sender: TObject);
    procedure btnSaveTemplateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmParam: TFmParam;

implementation

{$R *.dfm}

procedure TFmParam.btn1Click(Sender: TObject);
begin
  FontSize := se1.Value;
  ChertFontSize := se2.Value;
  if cbb1.ItemIndex = 0 then
    PaperOrientation := 1
  else
    PaperOrientation := 2;
  if cbb2.ItemIndex = 0 then
    PaperSize := 9
  else
    PaperSize := 8;
  PageBreakTMC := chk1.Checked;
  ShowExcel := chk2.Checked;
  ShowTips:= chk3.Checked;
  bPrintShifr:=chkPrintShifr.Checked;
  bExchTitle:=chkExchenTitle.Checked;
  bExchPrimech:=chkExchenPrimech.Checked;
  sExchPrimech:= edtPrimech.Text;
  sExchTitle:=edtTitle.Text;
  bAutoSave:=chkAutoSave.Checked;
  sDocHead_1:=edtDolgnostAdres.Text;
  sDocHead_2:=edtFIOAdres.Text;
  sDocHead_3:=edtDolgnostPodpis.Text;
  sDocHead_4:=edtFIOPodpis.Text;
  isTest:=chkTest.Checked;
  iAutoSaveSec:=seAutoSave.Value;
  UsrAcs.Division := se3.Value;
  ExtApplication := edt3.Text;
  if ExtApplication = '' then
    Main.Form1.btnRun.Visible := False
  else
    Main.Form1.btnRun.Visible := True;
  Main.Form1.Caption := MainFrmCaption+'  Подразделение: '+UsrAcs.DivisionStr;
  isChangeOpt:=True;
  Close;
end;

procedure TFmParam.chkExchenPrimechClick(Sender: TObject);
begin
edtPrimech.Enabled:=chkExchenPrimech.Checked;
end;

procedure TFmParam.chkExchenTitleClick(Sender: TObject);
begin
edtTitle.Enabled:=chkExchenTitle.Checked;
end;

procedure TFmParam.chkAutoSaveClick(Sender: TObject);
begin
seAutoSave.Enabled:=chkAutoSave.Checked;
end;

procedure TFmParam.btnSaveTemplateClick(Sender: TObject);
var
  i:Integer;
begin
TemplateList.Clear;
for i:=0 to 7 do
  TemplateList.Add(strngrd1.Cells[1,i]);
TemplateList.SaveToFile(LocalStorage + 'NP01VN-01.txt');
end;

end.

