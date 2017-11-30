unit U_tankMnemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Gauges, ComCtrls, U_tankSelfMnemo;

type
  TfrmTankMnemo = class(TForm)
    TabControl1: TTabControl;
    TtankSelfMnemo1: TtankSelfMnemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTankMnemo: TfrmTankMnemo;

implementation

{$R *.dfm}

end.
