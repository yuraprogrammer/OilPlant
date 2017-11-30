library tank_chem_data;

uses
  SysUtils,
  Classes,
  forms,
  U_inputChemTankData in 'U_inputChemTankData.pas' {frmInputTankChemData},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}
function inptankchemdata:boolean;
begin
try
 application.CreateForm(tdm, dm);
 application.CreateForm(tfrmInputTankChemData,frmInputTankChemData);
 frmInputTankChemData.ShowModal;
 frmInputTankChemData.Free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
  inptankchemdata;
begin
end.
