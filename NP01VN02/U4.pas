unit U4;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB, DBTables, Mask, ExtCtrls, Spin, Buttons;

type
  TFrmChange = class(TForm)
    rg1: TRadioGroup;
    medtChert: TMaskEdit;
    medtTM1: TMaskEdit;
    medtTM2: TMaskEdit;
    medtTM3: TMaskEdit;
    medtTM4: TMaskEdit;
    medtTM5: TMaskEdit;
    medtTM6: TMaskEdit;
    medtTM7: TMaskEdit;
    medtTM8: TMaskEdit;
    medtTM9: TMaskEdit;
    medtTM10: TMaskEdit;
    medtTM11: TMaskEdit;
    medtTM12: TMaskEdit;
    medtTM13: TMaskEdit;
    medtTM14: TMaskEdit;
    medtTM15: TMaskEdit;
    medtTM16: TMaskEdit;
    medtTM17: TMaskEdit;
    medtTM18: TMaskEdit;
    medtTM19: TMaskEdit;
    medtTM20: TMaskEdit;
    medtTM21: TMaskEdit;
    medtTM22: TMaskEdit;
    medtTM23: TMaskEdit;
    medtTM24: TMaskEdit;
    bvl1: TBevel;
    txt1: TStaticText;
    txt2: TStaticText;
    txt3: TStaticText;
    txt4: TStaticText;
    txt5: TStaticText;
    txt6: TStaticText;
    txt7: TStaticText;
    txt8: TStaticText;
    txt9: TStaticText;
    txt10: TStaticText;
    txt11: TStaticText;
    txt12: TStaticText;
    txt13: TStaticText;
    txt14: TStaticText;
    txt15: TStaticText;
    txt16: TStaticText;
    txt17: TStaticText;
    txt18: TStaticText;
    txt19: TStaticText;
    txt20: TStaticText;
    txt21: TStaticText;
    txt22: TStaticText;
    txt23: TStaticText;
    txt24: TStaticText;
    txt25: TStaticText;
    txt26: TStaticText;
    txt27: TStaticText;
    txt28: TStaticText;
    edtPrimech: TEdit;
    seKol_1: TSpinEdit;
    txt29: TStaticText;
    seKol1: TSpinEdit;
    seKol2: TSpinEdit;
    seKol3: TSpinEdit;
    txt30: TStaticText;
    txt31: TStaticText;
    txt32: TStaticText;
    edtItogo: TEdit;
    btn1: TBitBtn;
    btn2: TBitBtn;
    seKod: TSpinEdit;
    txt33: TStaticText;
    procedure seKol_1Change(Sender: TObject);
    procedure rg1Click(Sender: TObject);
  private
    FTableID, FItemID: integer;
    procedure SetItemID(const Value: integer);
    procedure SetTableID(const Value: integer);
  public
    property TableID:integer read FTableID write SetTableID;
    property ItemID:integer read FItemID write SetItemID;
  end;

implementation

{$R *.DFM}

procedure TFrmChange.seKol_1Change(Sender: TObject);
begin
  edtItogo.Text := inttostr(seKol1.Value + seKol2.Value + seKol3.Value);
end;

procedure TFrmChange.rg1Click(Sender: TObject);
  procedure ChangeFrmComponent(const aValue: boolean);
  var
    i: integer;
  begin
    for i := 1 to 24 do
      (Self.FindComponent('medtTM' + inttostr(i)) as TMaskEdit).Enabled :=
        aValue;
    seKol_1.Enabled := aValue;
    seKol1.Enabled := aValue;
    seKol2.Enabled := aValue;
    seKol3.Enabled := aValue;
    medtChert.Enabled := aValue;
    seKod.Enabled := aValue;
  end;

begin
  if (rg1.ItemIndex = 0) or (rg1.ItemIndex = 2) then
    ChangeFrmComponent(True)
  else
    ChangeFrmComponent(False);

end;

procedure TFrmChange.SetItemID(const Value: integer);
begin
  FItemID := Value;
end;

procedure TFrmChange.SetTableID(const Value: integer);
begin
  FTableID := Value;
end;

end.

