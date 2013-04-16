unit U2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, Grids, DBGrids, ToolWin, ComCtrls,
  DBGridEhGrouping, GridsEh, DBGridEh, StdCtrls;

type
  TNP01VN02Form2 = class(TForm)
    tlb1: TToolBar;
    ds1: TDataSource;
    ds2: TDataSource;
    pnl1: TPanel;
    spl1: TSplitter;
    pnl2: TPanel;
    spl2: TSplitter;
    pnl3: TPanel;
    ds3: TDataSource;
    qry1: TQuery;
    qry2: TQuery;
    qry3: TQuery;
    dbgrdh1: TDBGridEh;
    dbgrdh2: TDBGridEh;
    dbgrdh3: TDBGridEh;
    lbl1: TLabel;
    intgrfldqry3TableID: TIntegerField;
    intgrfldqry3Kod: TIntegerField;
    strngfldqry3Chert: TStringField;
    intgrfldqry3Kol_1: TIntegerField;
    intgrfldqry3Kol: TIntegerField;
    intgrfldqry3Kol1: TIntegerField;
    intgrfldqry3Kol2: TIntegerField;
    intgrfldqry3Kol3: TIntegerField;
    strngfldqry3TM1: TStringField;
    strngfldqry3TM2: TStringField;
    strngfldqry3TM3: TStringField;
    strngfldqry3TM4: TStringField;
    strngfldqry3TM5: TStringField;
    strngfldqry3TM6: TStringField;
    strngfldqry3TM7: TStringField;
    strngfldqry3TM8: TStringField;
    strngfldqry3TM9: TStringField;
    strngfldqry3TM10: TStringField;
    strngfldqry3TM11: TStringField;
    strngfldqry3TM12: TStringField;
    strngfldqry3TM13: TStringField;
    strngfldqry3TM14: TStringField;
    strngfldqry3TM15: TStringField;
    strngfldqry3TM16: TStringField;
    strngfldqry3TM17: TStringField;
    strngfldqry3TM18: TStringField;
    strngfldqry3TM19: TStringField;
    strngfldqry3TM20: TStringField;
    strngfldqry3TM21: TStringField;
    strngfldqry3TM22: TStringField;
    strngfldqry3TM23: TStringField;
    strngfldqry3TM24: TStringField;
    strngfldqry3Primech: TStringField;
    procedure FormShow(Sender: TObject);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure ds2DataChange(Sender: TObject; Field: TField);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure dbgrd2DblClick(Sender: TObject);
    procedure dbgrd3DblClick(Sender: TObject);
    procedure dbgrdh1DblClick(Sender: TObject);
    procedure dbgrdh2DblClick(Sender: TObject);
    procedure dbgrdh3DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation
uses U1;

{$R *.dfm}

procedure TNP01VN02Form2.FormShow(Sender: TObject);
begin
  qry1.DatabaseName := U1.NP01VN02Form1.qry1.DatabaseName;

end;

procedure TNP01VN02Form2.ds1DataChange(Sender: TObject; Field: TField);
begin
if qry1.RecordCount>0 then
  begin
    qry2.Close;
    qry2.Params[0].AsInteger:=qry1.fieldbyname('DocID').AsInteger;
    qry2.Open;
  end;
end;

procedure TNP01VN02Form2.ds2DataChange(Sender: TObject; Field: TField);
begin
if qry2.RecordCount>0 then
  begin
    qry3.Close;
    qry3.Params[0].AsInteger:=qry2.fieldbyname('TableID').AsInteger;
    qry3.Open;
  end;

end;

procedure TNP01VN02Form2.dbgrd1DblClick(Sender: TObject);
begin
Self.ModalResult:=101;
end;

procedure TNP01VN02Form2.dbgrd2DblClick(Sender: TObject);
begin
Self.ModalResult:=102;
end;

procedure TNP01VN02Form2.dbgrd3DblClick(Sender: TObject);
begin
Self.ModalResult:=103;
end;

procedure TNP01VN02Form2.dbgrdh1DblClick(Sender: TObject);
begin
Self.ModalResult:=101;
end;

procedure TNP01VN02Form2.dbgrdh2DblClick(Sender: TObject);
begin
Self.ModalResult:=102;
end;

procedure TNP01VN02Form2.dbgrdh3DblClick(Sender: TObject);
begin
Self.ModalResult:=103;
end;

end.

