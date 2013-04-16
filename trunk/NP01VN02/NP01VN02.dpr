program NP01VN02;

uses
  FastMM4,
  Fastcode,
  RtlVclOptimize,
  VCLFixPack,
  Forms,
  U1 in 'U1.pas' {NP01VN02Form1},
  U2 in 'U2.pas' {NP01VN02Form2},
  U3 in 'U3.pas' {NP01VN02Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Просмотр архива чертежей';
  Application.CreateForm(TNP01VN02Form1, NP01VN02Form1);
  Application.Run;
end.

