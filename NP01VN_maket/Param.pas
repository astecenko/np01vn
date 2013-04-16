unit Param;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin, IdBaseComponent, IdComponent,
  IdUDPBase, IdUDPClient, IdSNTP;

type
  TFmParam = class(TForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    btn2: TButton;
    se1: TSpinEdit;
    lbl3: TLabel;
    btn3: TBitBtn;
    chk1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  {var
    FmParam: TFmParam;
   }
implementation

{$R *.dfm}
uses Unit3, IniFiles;

procedure TFmParam.FormCreate(Sender: TObject);
begin
  edt1.Text := NetDirP1;
  edt2.Text := NetDir42;
  se1.Value:=linecount;
  chk1.Checked:=SheetMultiSelect;
end;

procedure TFmParam.btnOkClick(Sender: TObject);
var
  ini: TMemIniFile;
begin
  BaseNetDirP1 := edt1.Text;
  BaseNetDir42 := edt2.Text;
  linecount:=se1.Value;
  SheetMultiSelect:=chk1.Checked;
  try
    ini := TMemIniFile.Create(LocalStorage + 'np01vn.ini');
    Ini.WriteString('location', 'netdir42', NetDir42);
    Ini.WriteString('location', 'netdirp1', NetDirP1);
    ini.WriteInteger('sheet','linecount',se1.Value);
    ini.WriteBool('sheet','multiselect',chk1.Checked);
    ini.UpdateFile;
  finally
    FreeAndNil(ini);
  end;
  Close;
end;

procedure TFmParam.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFmParam.btn1Click(Sender: TObject);

begin
 edt1.Text:=Unit3.Form3.SelDirParam(edt1.Text)
end;

procedure TFmParam.btn2Click(Sender: TObject);
begin
 edt2.Text:=Unit3.Form3.SelDirParam(edt2.Text)
end;

procedure TFmParam.btn3Click(Sender: TObject);
begin
Unit3.Form3.Top:=100;
Unit3.Form3.Left:=100;
Unit3.Form3.Width:=440;
Unit3.Form3.Height:=250;
end;

end.

