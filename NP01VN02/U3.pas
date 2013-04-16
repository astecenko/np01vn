unit U3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles;

type
  TNP01VN02Form3 = class(TForm)
    lst1: TListBox;
    btn1: TButton;
    btn2: TButton;
    edt1: TEdit;
    btn3: TButton;
    btn4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lst1DblClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    FFilterList: TMemIniFile;
    FFilterChange: Boolean;
    procedure SetFilterList(const Value: TMemIniFile);
    procedure SetFilterChange(const Value: Boolean);
  public
    property FilterList: TMemIniFile read FFilterList write SetFilterList;
    property FilterChange: Boolean read FFilterChange write SetFilterChange;
    procedure SetFilter;
  end;

implementation
uses U1;

const
  FilterFile = 'filter.ini';

{$R *.dfm}

procedure TNP01VN02Form3.FormCreate(Sender: TObject);
var

  s: string;
begin
  FFilterChange := False;
  s := U1.LocalStorage + FilterFile;
  FFilterList := TMemIniFile.Create(s);
  if FileExists(s) then
  begin
    FFilterList.ReadSections(lst1.Items);
  end;
end;

procedure TNP01VN02Form3.SetFilterChange(const Value: Boolean);
begin
  FFilterChange := Value;
end;

procedure TNP01VN02Form3.SetFilterList(const Value: TMemIniFile);
begin
  FFilterList := Value;
end;

procedure TNP01VN02Form3.btn3Click(Sender: TObject);
var
  i: Integer;
begin
  i := 0;
  if lst1.Items.Count > 0 then
    while (i < lst1.Items.Count) and (lst1.Items[i] <> edt1.Text) do
      Inc(i);
  if i = lst1.Items.Count then
  begin
    FFilterChange := True;
    lst1.Items.Add(edt1.Text);
    FFilterList.WriteString(edt1.Text, 'ki', U1.NP01VN02Form1.medtKI.Text);
    FFilterList.WriteString(edt1.Text, 'chert',
      U1.NP01VN02Form1.medtChert.Text);
    FFilterList.WriteString(edt1.Text, 'docnum', U1.NP01VN02Form1.medt1.Text);
    FFilterList.WriteString(edt1.Text, 'docdate', U1.NP01VN02Form1.medt2.Text);
    FFilterList.WriteInteger(edt1.Text, 'dategr',
      U1.NP01VN02Form1.rg1.ItemIndex);
    FFilterList.WriteString(edt1.Text, 'date1',
      U1.NP01VN02Form1.medtDate1.Text);
    FFilterList.WriteString(edt1.Text, 'date2',
      U1.NP01VN02Form1.medtDate2.Text);
    FFilterList.WriteBool(edt1.Text, 'q1', U1.NP01VN02Form1.btnQ1.Down);
    FFilterList.WriteBool(edt1.Text, 'q2', U1.NP01VN02Form1.btnQ2.Down);
    FFilterList.WriteBool(edt1.Text, 'q3', U1.NP01VN02Form1.btnQ3.Down);
    FFilterList.WriteBool(edt1.Text, 'q4', U1.NP01VN02Form1.btnQ4.Down);
    FFilterList.WriteBool(edt1.Text, 'table', U1.NP01VN02Form1.btnTable.Down);
    FFilterList.WriteBool(edt1.Text, 'doc', U1.NP01VN02Form1.btnDoc.Down);
  end
  else
  begin
    ShowMessage('Фильтр с таким именем уже существует!');
    lst1.Selected[i] := True;
    edt1.SetFocus;
    edt1.SelectAll;
  end;

end;

procedure TNP01VN02Form3.btn4Click(Sender: TObject);
begin
  if lst1.ItemIndex > -1 then
  begin
    FilterChange := True;
    FilterList.EraseSection(lst1.Items[lst1.itemIndex]);
    lst1.DeleteSelected;
  end;
end;

procedure TNP01VN02Form3.FormDestroy(Sender: TObject);
begin
  try
    if FFilterChange then
      FFilterList.UpdateFile;
  finally
    FreeAndNil(FFilterList);
  end;
end;

procedure TNP01VN02Form3.SetFilter;
begin
  if lst1.ItemIndex > -1 then
  begin
    U1.NP01VN02Form1.medtKI.Text :=
      FFilterList.ReadString(lst1.Items[lst1.itemIndex], 'ki', '');
    U1.NP01VN02Form1.medtChert.Text :=
      FFilterList.ReadString(lst1.Items[lst1.itemIndex], 'chert', '');
    U1.NP01VN02Form1.medt1.Text :=
      FFilterList.ReadString(lst1.Items[lst1.itemIndex], 'docnum', '');
    U1.NP01VN02Form1.medt2.Text :=
      FFilterList.ReadString(lst1.Items[lst1.itemIndex], 'docdate', '');
    U1.NP01VN02Form1.rg1.ItemIndex :=
      FFilterList.ReadInteger(lst1.Items[lst1.itemIndex], 'dategr', -1);
    U1.NP01VN02Form1.medtDate1.Text :=
      FFilterList.ReadString(lst1.Items[lst1.itemIndex], 'date1', '');
    U1.NP01VN02Form1.medtDate2.Text :=
      FFilterList.ReadString(lst1.Items[lst1.itemIndex], 'date2', '');
    U1.NP01VN02Form1.btnQ1.Down :=
      FFilterList.ReadBool(lst1.Items[lst1.itemIndex], 'q1', False);
    U1.NP01VN02Form1.btnQ2.Down :=
      FFilterList.ReadBool(lst1.Items[lst1.itemIndex], 'q2', False);
    U1.NP01VN02Form1.btnQ3.Down :=
      FFilterList.ReadBool(lst1.Items[lst1.itemIndex], 'q3', False);
    U1.NP01VN02Form1.btnQ4.Down :=
      FFilterList.ReadBool(lst1.Items[lst1.itemIndex], 'q4', False);
    U1.NP01VN02Form1.btnTable.Down :=
      FFilterList.ReadBool(lst1.Items[lst1.itemIndex], 'table', False);
    U1.NP01VN02Form1.btnDoc.Down :=
      FFilterList.ReadBool(lst1.Items[lst1.itemIndex], 'doc', False);
  end;
end;

procedure TNP01VN02Form3.lst1DblClick(Sender: TObject);
begin
  SetFilter;
  Self.Close;
end;

procedure TNP01VN02Form3.btn1Click(Sender: TObject);
begin
  SetFilter;
  Self.Close;
end;

procedure TNP01VN02Form3.btn2Click(Sender: TObject);
begin
  Self.Close;
end;

end.

