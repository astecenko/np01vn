unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, Gauges, shellApi;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    lst1: TListBox;
    btn1: TButton;
    btn2: TButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure lst1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;
function del_prob(field: string): string;
var
  Form6: TForm6;
implementation
{$R *.dfm}
uses Unit1, Unit2, Unit5, Unit7, StrUtils, Unit3, Journal;

function chisla(st: string): Boolean;
var
  i: integer;
const
  chisla_mas: array[0..9] of char = ('0', '1', '2', '3', '4', '5', '6', '7',
    '8',
    '9');
begin
  chisla := False;
  for i := 0 to 9 do
  begin
    if st = chisla_mas[i] then
    begin
      chisla := True;
      Exit;
    end
  end;
end;

function Prov_PO(ch: char; st: string): Boolean;

begin
  //ln:=Length(st);
  if Length(st) < 4 then
  begin
    if Length(st) = 0 then
    begin
      if (ch >= '0') and (ch <= '9') or (ch = #13) or (ch = #8) or (ch = 'k')
        then
      begin
        Prov_PO := True; // символ верный
        Exit; // выход из функции
      end;
    end
    else
      Prov_PO := False;
    if (Length(st) = 1) or (Length(st) = 2) then
    begin
      if (ch >= '0') and (ch <= '9') or (ch = #8) or (ch = 'k') then
      begin
        Prov_PO := True; // символ верный
        Exit; // выход из функции
      end;
    end
    else
      Prov_PO := False;
    if Length(st) = 3 then
    begin
      if (ch = 'd') or (ch = #13) or (ch = #8) then
      begin
        Prov_PO := True; // символ верный
        Exit; // выход из функции
      end;
    end
    else
      Prov_PO := False;
  end
  else
    Prov_PO := False;
end;

function add_nol(field: string; len_field: integer; left_right: string): string;
var
  nol: string;
  len, raznost: integer;
begin
  if left_right = 'left' then
  begin
    nol := '0000000000000';
    len := 0;
    len := length(field);
    raznost := len_field - len;
    if raznost <> 0 then
      add_nol := copy(nol, 1, raznost) + field
    else
      add_nol := field;
  end;
  if left_right = 'right' then
  begin
    nol := '000000000000000000000000';
    len := 0;
    len := length(field);
    raznost := len_field - len;
    if raznost <> 0 then
      add_nol := field + copy(nol, len, raznost)
    else
      add_nol := field;
  end;
end;

function del_prob(field: string): string;
begin
  while Pos(' ', field) <> 0 do
    delete(field, Pos(' ', field), 1);
  del_prob := field;
end;

procedure TForm6.FormActivate(Sender: TObject);
var
  reKv_P0 {, Kod_naz, Text_naz}: string;
begin
  if UseJournal = False then
    reKv_P0 := Form1.Table_NP01F0.FieldByName('rekv_P0').AsString
  else
    reKv_P0 := FmJournal.tbl1.FieldByName('rekv_P0').AsString;

  if id_mess = 7 then
  begin
    MaskEdit1.Text := copy(reKv_P0, 1, 4);
    Edit1.Text := copy(reKv_P0, 5, 80);
  end;
  try
    lst1.Items.LoadFromFile(LocalStorage + 'NaznachList.txt');
  except
  end;
end;

procedure TForm6.BitBtn2Click(Sender: TObject);
var
  str: string;
  oshibka: Boolean;
  a0, a1, a2, a3: set of Char;
  //  f: textfile;
  //  rez_mass_file, i: integer;

   { VolName: array[0..255] of char;
    FSName: array[0..100] of char;
    MaxCompLen, FSFlags: Cardinal;
    FC, SPC, BPS, NC: DWORD;}

begin
  //ShowMessage('dfdf');
  oshibka := False;
  a0 := ['0'..'9'];
  a1 := a0 + ['/'];
  a2 := a0 + ['D', ' '];
  a3 := a0 + ['K'];
  str := MaskEdit1.Text;
  if (not (str[1] in a3)) or (not (str[2] in a1)) or (not (str[3] in a0)) or
    (not (str[4] in a2)) or (Length(Edit1.Text) > 74) then
    oshibka := True;
  { if (str[1] <> 'K') then
     if chisla(str[1]) = false then
       oshibka := True;

  if (not (str[2] in a1)) or  (not (str[3]in a0)) then
    oshibka := True;
  oshibka := not (str[4] in a2);
    if (str[4] <> 'D') and (str[4] <> ' ') then
      oshibka := True;
  if Length(Edit1.Text) > 74 then
    oshibka := True;  }
  if oshibka = true then
    MessageDlg('Неверный код назначения,или текст назначения', mtError, [mbOK],
      0)
  else
  begin
    Form5.ZapMak('yes');

    { if (GetVolumeInformation(PChar('A:\'),VolName,255,
  nil,   MaxCompLen, FSFlags,FSName,100)) then
  begin

    Form1.Table_NP01F0.Edit;
    form1.Table_NP01F0.FieldByName('rekv_P0').AsString:=MaskEdit1.Text+Edit1.Text;
    Form1.Table_NP01F0.FieldByName('data').AsString:=DateToStr(Date);
    Form1.Table_NP01F0.Post;

    AssignFile(f, 'a:\DPL.txt');
{$I-}//если исп-ся reset
  //Rewrite(f); // создает файл если нет в директории
  {reset(f);   //открывает файл и сопров-ся append или rewrite
   {$I+}
  {if IOResult = 0 then
     begin
  rez_mass_file:=MessageDlg('Файл DPL.txt на дискете создан! Перезаписать его?',
                   mtInformation,[mbYes,mbNo],0);
  if rez_mass_file=6 then
  Rewrite(f);
  if rez_mass_file=7 then begin  CloseFile(f);
  Exit; end;
            end
            else
            Rewrite(f);
     form5.Table_DPLN.First;
     Form7.Gauge1.MaxValue:=Form5.Table_DPLN.RecordCount;

     Form6.Visible:=False;
     Form5.SendToBack;
     Form5.Visible:=False;
     form7.Show;
     for i:=1 to Form5.Table_DPLN.RecordCount do begin
  Form7.Gauge1.Progress:=i;
     maket:='';
     maket:=Form5.Table_DPLN.FieldByName('NM').AsString+
     Form5.Table_DPLN.FieldByName('PMak').AsString+
     add_nol(Form5.Table_DPLN.FieldByName('KI').AsString,4,'left')+
     del_prob(Form5.Table_DPLN.FieldByName('chert').AsString)+
     Form5.Table_DPLN.FieldByName('PMod').AsString+'0'+
     add_nol(Form5.Table_DPLNSumKol.AsString,9,'left')+
     add_nol(Form5.Table_DPLN.FieldByName('Kol1').AsString,9,'left')+
     add_nol(Form5.Table_DPLN.FieldByName('Kol2').AsString,9,'left')+
     add_nol(Form5.Table_DPLN.FieldByName('Kol3').AsString,9,'left');
     if (Form5.Table_DPLN.FieldByName('PMak').AsInteger<>1) and
     (Form5.Table_DPLN.FieldByName('PMak').AsInteger<>3) then
     maket:=maket+add_nol(del_prob(Form5.Table_DPLN.FieldByName('Marshryt').AsString),24,'right')
     else begin
     if length(del_prob(Form5.Table_DPLN.FieldByName('Marshryt').AsString))<=4 then begin
      str_prom:=add_nol(del_prob(Form5.Table_DPLN.FieldByName('Marshryt').AsString),4,'right');
      str_prom:=str_prom+copy('                        ',1,24-length(str_prom));
      maket:=maket+str_prom;
      end;
       if length(del_prob(Form5.Table_DPLN.FieldByName('Marshryt').AsString))>4 then begin
       str_prom:=copy(del_prob(Form5.Table_DPLN.FieldByName('Marshryt').AsString),
       length(del_prob(Form5.Table_DPLN.FieldByName('Marshryt').AsString))-3,4);
        str_prom:=str_prom+copy('                        ',1,24-length(str_prom));
         maket:=maket+str_prom;
       end;
     end;
      Write(f,maket);
      Form5.Table_DPLN.Next;
     end;
     maket:='';
     str_prom:=LeftStr(Edit1.Text+dupestring(' ',74),74);
     s1:=str_prom;
     chartooem(Pchar(s1),Pchar(s1));
      maket:='P0'+MaskEdit1.Text+s1;
      Write(f,maket);
  CloseFile(f);
  AssignFile(f,'SPRAVKA.txt');
  Rewrite(f);
  Writeln(f,'* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *');
  Writeln(f,'   Дата '+datetostr(Date)+'               Время   '+timetostr(Time));
  Writeln(f,'   Макеты для директивного плана  *DPL.txt*');
  Writeln(f,'');
  Writeln(f,'   Всего записей за '+datetostr(Date)+'   -        '+inttostr(Form5.Table_DPLN.RecordCount+1));
  Writeln(f,'       в том числе:');
  Writeln(f,'         макет Р0  -   1');
  Writeln(f,'         макет Р1  -   '+inttostr(Form5.Table_DPLN.RecordCount));
  Writeln(f,'* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *');
  CloseFile(f);
  Form7.Close;
  Form6.Close;
  Form5.Close;
  ShellExecute(Handle,nil,'SPRAVKA.txt',nil,nil,SW_RESTORE);
  end
  else
  MessageDlg('Вставьте дискету!!!',mtError,[mbOK],0); }
  end;

end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MaskEdit1.Text := '';
  Edit1.Text := '';
  try
    lst1.Items.SaveToFile(LocalStorage + 'NaznachList.txt');
  except
  end;
end;

procedure TForm6.lst1Click(Sender: TObject);
begin
  Edit1.Text := lst1.Items[lst1.ItemIndex];
end;

procedure TForm6.btn1Click(Sender: TObject);
begin
  if Edit1.Text <> '' then
  begin
    lst1.Items.Add(Edit1.Text);
  end;
end;

procedure TForm6.btn2Click(Sender: TObject);
begin
  if (lst1.ItemIndex > -1) and (lst1.Count > 0) then
  begin
    lst1.Items.Delete(lst1.ItemIndex);
  end;
end;

end.

