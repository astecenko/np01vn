unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  fl_disk:integer;

implementation

{$R *.dfm}


procedure TForm8.BitBtn1Click(Sender: TObject);
begin
fl_disk:=3;   //выход
close;
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
fl_disk:=1;  //дописать
close;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
fl_disk:=2;  //перезаписать
close;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
Button1.SetFocus;
end;

end.
