unit USendOASUP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TSendOASUP = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    dtp1: TDateTimePicker;
    btn1: TBitBtn;
    btn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SendOASUP: TSendOASUP;

implementation
  uses Constants,Index ;
{$R *.dfm}

procedure TSendOASUP.FormShow(Sender: TObject);
begin
dtp1.Date:=Date;
end;

procedure TSendOASUP.btn2Click(Sender: TObject);
begin
Close;
end;

procedure TSendOASUP.btn1Click(Sender: TObject);
begin
 SendOASUPDate:=dtp1.Date;
 Close;
end;

end.
