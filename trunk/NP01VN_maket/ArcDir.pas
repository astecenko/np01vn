unit ArcDir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

const
  csDescript = 'descript.ion';

type
  TFormArcDir = class(TForm)
    pnl1: TPanel;
    spl1: TSplitter;
    pnl2: TPanel;
    lst1: TListBox;
    pnl3: TPanel;
    mmo1: TMemo;
    btn1: TBitBtn;
    btn2: TBitBtn;
    Button1: TButton;
    procedure lst1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FPodrazdDir: string;
    procedure SetPodrazdDir(const Value: string);
  public
    property PodrazdDir: string read FPodrazdDir write SetPodrazdDir;
  end;

implementation
uses SAVLib;

{$R *.dfm}

{ TFormArcDir }

procedure TFormArcDir.SetPodrazdDir(const Value: string);
begin
  FPodrazdDir := Value;
end;

procedure TFormArcDir.lst1Click(Sender: TObject);
var
  s: string;
begin
  if lst1.ItemIndex > -1 then
  begin
    mmo1.Clear;
    s := PodrazdDir + lst1.Items[lst1.itemindex] + '\' + csDescript;
    if FileExists(s) then
      try
        mmo1.Lines.LoadFromFile(s);
      except
      end
    else
      mmo1.Text := 'Описание отсутствует';
  end;
end;

procedure TFormArcDir.Button1Click(Sender: TObject);
var
  s: string;
begin
  s := '';
  if InputQuery('Создание нового архивного каталога', 'B ' + PodrazdDir, s) then
  begin
    ForceDirectories(PodrazdDir+s);
    
  end;
end;

procedure TFormArcDir.FormShow(Sender: TObject);
begin
 SAVLib.GetDirList(Self.lst1.Items, PodrazdDir);
end;

end.

