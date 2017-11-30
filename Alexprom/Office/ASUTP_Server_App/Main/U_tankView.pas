unit U_tankView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TfrmTankView = class(TForm)
    Chart1: TChart;
    Series1: TAreaSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTankView: TfrmTankView;

implementation

{$R *.dfm}

end.
