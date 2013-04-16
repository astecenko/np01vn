unit Unit4;
                                                                               
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Query_create_DPLN: TQuery;
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Name_tDPLN: string;
implementation

uses Unit5, Math, Unit1, Unit2, Unit3,Journal;

{$R *.dfm}

function Is0_5(ch: char; st: string; priznak: integer): Boolean;
{var
  text: string;}
begin

  if Length(st) = 0 then
  begin
    if (ch >= '0') and (ch <= inttostr(priznak)) // цифры
    or (ch = #13) // клавиша <Enter>
    or (ch = #8) {// клавиша <Back Space>} then
    begin
      Is0_5 := True; // символ верный
      Exit; // выход из функции
    end;

  end
  else
    Is0_5 := False;

end;

procedure TForm4.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin

  if Key = Char(VK_RETURN) then
    ComboBox2.SetFocus
  else if not Is0_5(Key, ComboBox1.Text, 4) then
    Key := Chr(0);
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ComboBox1.ItemIndex := 0;
  ComboBox2.ItemIndex := 0;
end;

procedure TForm4.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  if not Is0_5(Key, ComboBox2.Text, 5) then
    Key := Chr(0);
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
var
  str_show: string;
begin
  Form2.Visible := False;
  Form2.Close;
  Form4.Visible := False;
  Form4.Close;
  str_show := '';
  if (ComboBox1.Text <> '') and (ComboBox2.Text <> '') then
  begin
    //Name_tDPLN:='DPL'+IntToStr(Num_tNP01FN)+'.db';
    //if form1.Table_NP01F0.FieldByName('data').AsString='' then
    if (id_mess = 0) or (FileExists(pyt+'\'+Name_tDPLN)=False) then //таблица еще не создана
    begin
      Query_create_DPLN.DatabaseName := pyt;
      if FileExists(pyt+'\'+Name_tDPLN) then
        DeleteFile(pyt+'\'+Name_tDPLN);
      with Query_create_DPLN do
      begin
        close;
        SQL.clear;
        SQL.Add('create table "' + Name_tDPLN + '"');
        SQL.Add('( NM char(2),Pmak char(1),KI char(4),Chert char(13),');
        SQL.Add('Pmod char(1),kol int,kol1 int,kol2 int,kol3 int,marshryt char(35))');
        ExecSQL;
      end;
      Query_create_DPLN.Close;
      Query_create_DPLN.DatabaseName := '';
      if UseJournal = True then
      begin
        FmJournal.tbl1.Edit;
        FmJournal.tbl1.FieldByName('PDate').AsDateTime := Date;
        FmJournal.tbl1.Post;
      end
      else
      begin
        Form1.Table_NP01F0.Edit;
        Form1.Table_NP01F0.FieldByName('data').AsString := DateToStr(Date);
        Form1.Table_NP01F0.Post;
      end;
    end;
    form5.Table_DPLN.DatabaseName := pyt;
    Form5.Table_DPLN.TableName := Name_tDPLN;
    form5.ShowModal;
  end
  else
  begin
    if ComboBox1.Text = '' then
      str_show := 'признак макета ' + #13;
    if ComboBox2.Text = '' then
      str_show := str_show + 'признак модификации ';
    ShowMessage('Введите: ' + #13 + str_show);
  end;
end;

end.

