unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls,
  DBCtrls;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Table_NP01FN: TTable;
    Table_NP01FNNum: TIntegerField;
    Table_NP01FNKod: TIntegerField;
    Table_NP01FNChert: TStringField;
    Table_NP01FNKol: TIntegerField;
    Table_NP01FNKol1: TIntegerField;
    Table_NP01FNKol2: TIntegerField;
    Table_NP01FNKol3: TIntegerField;
    Table_NP01FNTM1: TStringField;
    Table_NP01FNTM2: TStringField;
    Table_NP01FNTM3: TStringField;
    Table_NP01FNTM4: TStringField;
    Table_NP01FNTM5: TStringField;
    Table_NP01FNTM6: TStringField;
    Table_NP01FNTM7: TStringField;
    Table_NP01FNTM8: TStringField;
    Table_NP01FNTM9: TStringField;
    Table_NP01FNTM10: TStringField;
    Table_NP01FNPrimech: TStringField;
    BitBtn1: TBitBtn;
    EditMarsh: TEdit;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    Table_NP01FNTM11: TStringField;
    Table_NP01FNTM12: TStringField;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  id_mess: integer;
implementation

uses Unit4, Unit1, Unit3, Unit5;

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Table_NP01FN.Active := False;
  Table_NP01FN.TableName := '';
  MaskEdit1.Text := '';
end;

procedure TForm2.MaskEdit1Change(Sender: TObject);
begin
  //Table_NP01FN.Locate('chert',trim(MaskEdit1.Text),[loPartialKey]);
  //DBGrid1.SetFocus;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  id_mess := 0;
  Name_tDPLN := 'DPL' + IntToStr(Num_tNP01FN) + '.db';
  if form1.Table_NP01F0.FieldByName('data').AsString <> '' then
  begin
    id_mess := MessageDlg('Вы хотите пересоздать макет?',
      mtInformation, [mbYes, mbNo, mbCancel], 0);
    if id_mess = 6 then //yes
    begin
      // Form2.Close;
      form4.ShowModal;
    end;
    if id_mess = 7 then //no
    begin
      form5.Table_DPLN.DatabaseName := pyt;
      Form5.Table_DPLN.TableName := Name_tDPLN;
      Form2.Visible := false;
      Form2.Close;
      Form5.ShowModal;
    end;
  end
  else
    form4.ShowModal;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  Table_NP01FN.Locate('chert', trim(MaskEdit1.Text), [loPartialKey]);

  DBGrid1.SetFocus;
end;

end.

