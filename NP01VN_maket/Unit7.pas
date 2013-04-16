unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges;

type
  TForm7 = class(TForm)
    Gauge1: TGauge;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit5, DB, Unit1;

{$R *.dfm}

procedure TForm7.FormActivate(Sender: TObject);
begin
Gauge1.MaxValue:=form5.Table_DPLN.RecordCount;
Gauge1.Progress:=form5.Table_DPLN.RecNo;
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form7.Visible:=False;
if MessageDlg('Запись файла завершена',mtInformation,
[mbOK],0)=mrOK then
form1.SendToBack;
end;

end.
