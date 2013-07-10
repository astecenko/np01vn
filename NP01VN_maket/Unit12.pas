unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls;

type
  TFormNP01 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    dbgrd1: TDBGrid;
    ds1: TDataSource;
    dbnvgr1: TDBNavigator;
    lblFullPath: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

end.
