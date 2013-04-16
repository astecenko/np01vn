program NP01VN01;

uses
  FastMM4,
  Fastcode,
  RtlVclOptimize,
  VCLFixPack,
  Forms,
  U1 in 'U1.pas' {NP01VN01Form1},
  U2 in 'U2.pas' {NP01VN01Form2},
  U3 in 'U3.pas' {NP01VN01Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Просмотр архива ТМЦ';
  Application.CreateForm(TNP01VN01Form1, NP01VN01Form1);
  Application.Run;
end.

