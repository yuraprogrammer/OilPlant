library lightsOutputReport;

uses
  SysUtils,
  Classes,
  forms,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_lightsoutputreport in 'U_lightsoutputreport.pas' {lightoutputreport};

{$R *.res}

function showlightsoutputreport:boolean;
begin
try
 Application.CreateForm(Tdm, dm);
 application.CreateForm(tlightoutputreport, lightoutputreport);
 lightoutputreport.ShowModal;
 lightoutputreport.Free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 showlightsoutputreport;
begin
end.
