unit Param;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls, Buttons, Spin, Mask, ComCtrls, Grids, JvExMask,
  JvSpin;

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
    ts5: TTabSheet;
    lbl17: TLabel;
    jvspined1: TJvSpinEdit;
    jvspined2: TJvSpinEdit;
    jvspined3: TJvSpinEdit;
    jvspined4: TJvSpinEdit;
    jvspined5: TJvSpinEdit;
    jvspined6: TJvSpinEdit;
    jvspined7: TJvSpinEdit;
    jvspined8: TJvSpinEdit;
    jvspined9: TJvSpinEdit;
    jvspined10: TJvSpinEdit;
    jvspined11: TJvSpinEdit;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    jvspined12: TJvSpinEdit;
    cbbHAlign1: TComboBox;
    cbbHAlign2: TComboBox;
    cbbHAlign3: TComboBox;
    cbbHAlign4: TComboBox;
    cbbHAlign5: TComboBox;
    cbbHAlign6: TComboBox;
    cbbHAlign7: TComboBox;
    cbbHAlign8: TComboBox;
    cbbHAlign9: TComboBox;
    cbbHAlign10: TComboBox;
    cbbHAlign11: TComboBox;
    cbbHAlign12: TComboBox;
    lbl15: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure chkExchenPrimechClick(Sender: TObject);
    procedure chkExchenTitleClick(Sender: TObject);
    procedure chkAutoSaveClick(Sender: TObject);
    procedure btnSaveTemplateClick(Sender: TObject);
    procedure ts5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbl18MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbl18MouseLeave(Sender: TObject);
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
var
  i:integer;
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
  for i := 1 to 12 do
  begin
    ExcelColumnWidth[i] :=(Self.FindComponent('jvspined' + inttostr(i)) as TJvSpinEdit).Value;
    ExcelColumnHAlign[i]:=(Self.FindComponent('cbbHAlign' + inttostr(i)) as TComboBox).ItemIndex;
  end;
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

procedure TFmParam.ts5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
lbl15.Caption:='';
end;

procedure TFmParam.lbl18MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
lbl15.Caption:=(Sender as TLabel).Hint;
end;

procedure TFmParam.lbl18MouseLeave(Sender: TObject);
begin
lbl15.Caption:='';
end;

end.

