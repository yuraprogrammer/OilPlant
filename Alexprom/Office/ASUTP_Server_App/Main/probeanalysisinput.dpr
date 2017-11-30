library probeanalysisinput;

uses
  SysUtils,
  Classes,
  forms,
  u_inputChemical in 'u_inputChemical.pas' {inputChemicalData},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}

function inputprobeanalysis:boolean;
begin
try
 application.CreateForm(tdm,dm);
 application.CreateForm(tinputchemicaldata,inputchemicaldata );
 inputchemicaldata.ShowModal;
 inputchemicaldata.Free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 inputprobeanalysis;
begin
end.
