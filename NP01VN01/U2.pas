unit U2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, Grids, DBGrids, ToolWin, ComCtrls,
  DBGridEhGrouping, GridsEh, DBGridEh, StdCtrls;

type
  TNP01VN01Form2 = class(TForm)
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
    intgrfldqry3TableID: TIntegerField;
    strngfldqry3Vp: TStringField;
    strngfldqry3Cp: TStringField;
    strngfldqry3Shifr: TStringField;
    strngfldqry3KI: TStringField;
    strngfldqry3Kol: TStringField;
    intgrfldqry3Podrazd: TIntegerField;
    strngfldqry3Znak: TStringField;
    strngfldqry3Eim: TStringField;
    strngfldqry3Kol2: TStringField;
    strngfldqry3Primech: TStringField;
    strngfldqry3Norma: TStringField;
    strngfldqry3Kol_m: TStringField;
    strngfldqry3Kol_m2: TStringField;
    strngfldqry3Kol_m3: TStringField;
    strngfldqry3Kol3: TStringField;
    fltfldqry3Itog: TFloatField;
    dbgrdh1: TDBGridEh;
    dbgrdh2: TDBGridEh;
    dbgrdh3: TDBGridEh;
    lbl1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure qry3CalcFields(DataSet: TDataSet);
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

procedure TNP01VN01Form2.FormShow(Sender: TObject);
begin
  qry1.DatabaseName := U1.NP01VN01Form1.qry1.DatabaseName;

end;

procedure TNP01VN01Form2.qry3CalcFields(DataSet: TDataSet);
begin

  fltfldqry3Itog.Value :=
    StrToFloatDef(qry3.FieldByName('Kol').AsString, 0) +
    StrToFloatDef(qry3.FieldByName('Kol2').AsString, 0) +
    StrToFloatDef(qry3.FieldByName('Kol3').AsString, 0);
end;

procedure TNP01VN01Form2.ds1DataChange(Sender: TObject; Field: TField);
begin
if qry1.RecordCount>0 then
  begin
    qry2.Close;
    qry2.Params[0].AsInteger:=qry1.fieldbyname('DocID').AsInteger;
    qry2.Open;
  end;
end;

procedure TNP01VN01Form2.ds2DataChange(Sender: TObject; Field: TField);
begin
if qry2.RecordCount>0 then
  begin
    qry3.Close;
    qry3.Params[0].AsInteger:=qry2.fieldbyname('TableID').AsInteger;
    qry3.Open;
  end;

end;

procedure TNP01VN01Form2.dbgrd1DblClick(Sender: TObject);
begin
Self.ModalResult:=101;
end;

procedure TNP01VN01Form2.dbgrd2DblClick(Sender: TObject);
begin
Self.ModalResult:=102;
end;

procedure TNP01VN01Form2.dbgrd3DblClick(Sender: TObject);
begin
Self.ModalResult:=103;
end;

procedure TNP01VN01Form2.dbgrdh1DblClick(Sender: TObject);
begin
Self.ModalResult:=101;
end;

procedure TNP01VN01Form2.dbgrdh2DblClick(Sender: TObject);
begin
Self.ModalResult:=102;
end;

procedure TNP01VN01Form2.dbgrdh3DblClick(Sender: TObject);
begin
Self.ModalResult:=103;
end;

end.

