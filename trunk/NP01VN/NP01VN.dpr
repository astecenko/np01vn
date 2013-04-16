program NP01VN;

uses
  FastMM4,
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Fastcode,
  VCLFixPack,
  Forms,
  Windows,
  Dialogs,
  Main in 'Main.pas' {Form1},
  Index in 'Index.pas' {FormIndex},
  NewString in 'NewString.pas' {FormNewString},
  Start in 'Start.pas' {FormEdit},
  ClipB in 'ClipB.pas',
  TMClass in 'TMClass.pas',
  DocName in 'DocName.pas' {frmDocName},
  Ost in 'Ost.pas' {frm42},
  Journal in 'Journal.pas' {FmJournal},
  Constants in 'Constants.pas',
  Param in 'Param.pas' {FmParam},
  USendOASUP in 'USendOASUP.pas' {SendOASUP},
  PasteFromMSO in 'PasteFromMSO.pas' {PasteMSO},
  UserAccess in 'UserAccess.pas',
  Arhiv in 'Arhiv.pas';

{$R *.res}
var
	hwndMain, hwndBat : HWND;
  dwProcessId, hProcess : Cardinal;

begin
  Application.Initialize;
  hwndBat := FindWindow(Nil, 'Корректировка планов');
  if (hwndBat > 0) then begin
    GetWindowThreadProcessID(hwndBat, @dwProcessId);
    hProcess := OpenProcess(PROCESS_TERMINATE, FALSE, dwProcessId);
  	TerminateProcess(hProcess, 0);
  end;
  hwndMain := FindWindow('TForm1', PChar(MainFrmCaption));
  if (hwndMain > 0) then begin
    ShowWindow(hwndMain, SW_SHOWNORMAL);
    BringWindowToTop(hwndMain);
  	Application.Terminate;
  end;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormIndex, FormIndex);
  Application.CreateForm(TFormNewString, FormNewString);
  Application.CreateForm(TfrmDocName, frmDocName);
  Application.CreateForm(TFmJournal, FmJournal);
  Application.CreateForm(TPasteMSO, PasteMSO);
  Application.Run;
end.

