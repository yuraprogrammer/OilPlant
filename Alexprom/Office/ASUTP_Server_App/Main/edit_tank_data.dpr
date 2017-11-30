library edit_tank_data;

uses
  SysUtils,
  Forms,
  Classes,
  U_inputTankData in 'U_inputTankData.pas' {frmInputTankData},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}

function show_edit_tank_data:boolean;
begin
try
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmInputTankData, frmInputTankData);
  frmInputTankData.ShowModal;
  frmInputTankData.Free;
  dm.Free;
  Result:=True;
except
  Result:=False;
end;
end;
exports
  show_edit_tank_data;
begin
end.
