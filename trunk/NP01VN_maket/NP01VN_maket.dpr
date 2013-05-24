program NP01VN_maket;

uses
  FastMM4,
  Fastcode,
  FastMove,
  VCLFixPack,
  Forms,
  Unit3 in 'Unit3.pas' {Form3},
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6},
  Unit7 in 'Unit7.pas' {Form7},
  Unit8 in 'Unit8.pas' {Form8},
  Journal in 'Journal.pas' {FmJournal},
  Start in 'Start.pas' {FormEdit},
  Unit9 in 'Unit9.pas' {FmDept},
  ArcDir in 'ArcDir.pas' {FormArcDir},
  TMClass in 'TMClass.pas',
  ClipB in 'ClipB.pas',
  Constants in 'Constants.pas',
  Ost in 'Ost.pas' {frm42},
  Param in 'Param.pas' {FmParam};

//  Param in 'Param.pas' {FmParam};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'NP01VN Макет';
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.

