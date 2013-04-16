unit DocName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask;

type
  TfrmDocName = class(TForm)
    meNDoc: TMaskEdit;
    dtpDateDoc: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure meNDocChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDocName: TfrmDocName;

implementation

{$R *.dfm}
         uses Main;
procedure TfrmDocName.meNDocChange(Sender: TObject);
begin
  Button1.Enabled := Trim(meNDoc.Text) > '';
end;

procedure TfrmDocName.FormShow(Sender: TObject);
begin
Label2.Caption:='¹ '+UsrAcs.DivisionStr+'-';
end;

end.
