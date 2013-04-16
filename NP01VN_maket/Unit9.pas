unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFmDept = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    edt6: TEdit;
    lbl6: TLabel;
    btn7: TButton;
    lbl7: TLabel;
    edt7: TEdit;
    btn8: TButton;
    lbl8: TLabel;
    edt8: TEdit;
    btn9: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmDept: TFmDept;

implementation
uses Unit3, IniFiles;
{$R *.dfm}

procedure TFmDept.btn1Click(Sender: TObject);
begin
  edt2.Text := Unit3.Form3.SelDirParam(edt2.Text);
end;

procedure TFmDept.btn2Click(Sender: TObject);
begin
  edt3.Text := Unit3.Form3.SelDirParam(edt3.Text);
end;

procedure TFmDept.btn3Click(Sender: TObject);
begin
  edt4.Text := Unit3.Form3.SelDirParam(edt4.Text);
end;

procedure TFmDept.btn4Click(Sender: TObject);
begin
  edt5.Text := Unit3.Form3.SelDirParam(edt5.Text);
end;

procedure TFmDept.btn6Click(Sender: TObject);
begin
  Close;
end;

procedure TFmDept.btn5Click(Sender: TObject);
var
  IniDept: TMemIniFile;
begin
  if (edt1.Text = '') or (edt2.Text = '') or (edt3.Text = '') then
    ShowMessage('Первые 3 поля обязательны для заполнения!')
  else
  begin
    IniDept := TMemIniFile.Create(LocalStorage +
      'np01vn_dept.ini');
    IniDept.WriteString(edt1.Text, 'netdir', edt2.Text);
    IniDept.WriteString(edt1.Text, 'journaldir', edt3.Text);
    if edt4.Text <> '' then
      IniDept.WriteString(edt1.Text, 'netdir_arc', edt4.Text);
    if edt5.Text <> '' then
      IniDept.WriteString(edt1.Text, 'journaldir_arc', edt5.Text);
    if edt6.Text <> '' then
      IniDept.WriteString(edt1.Text, 'backup_dir', edt6.Text);
    if edt7.Text <> '' then
      IniDept.WriteString(edt1.Text, 'mak42_dir', edt7.Text);
    if edt8.Text <> '' then
      IniDept.WriteString(edt1.Text, 'makP1_dir', edt8.Text);
    if Tag = 1 then
    begin
      if edt1.Text <> Unit3.Form3.lst1.Items[Unit3.Form3.lst1.ItemIndex] then
        IniDept.EraseSection(Unit3.Form3.lst1.Items[Unit3.Form3.lst1.ItemIndex]);
    end;
    IniDept.UpdateFile;
    FreeAndNil(IniDept);
    Close;
  end;
end;

procedure TFmDept.btn7Click(Sender: TObject);
begin
edt6.Text := Unit3.Form3.SelDirParam(edt6.Text);

end;

procedure TFmDept.btn9Click(Sender: TObject);
begin
edt8.Text := Unit3.Form3.SelDirParam(edt8.Text);
end;

procedure TFmDept.btn8Click(Sender: TObject);
begin
edt7.Text := Unit3.Form3.SelDirParam(edt7.Text);
end;

end.

