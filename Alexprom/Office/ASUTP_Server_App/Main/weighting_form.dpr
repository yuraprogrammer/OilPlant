library weighting_form;

uses
  SysUtils,
  Classes,
  Forms,
  tsp_weight in 'tsp_weight.pas' {frmTSP},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}
function show_weighting_form:boolean;
begin
try
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmTsp, frmTSP);
  frmTSP.ShowModal;
  frmTSP.Free;
  dm.Free;
  Result:=True;
except
  Result:=False;
end;
end;

exports
  show_weighting_form;
begin
end.
