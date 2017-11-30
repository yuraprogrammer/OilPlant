library showInventarizationReports;

uses
  SysUtils,
  forms,
  u_dm,
  Classes,
  U_invReports in 'U_invReports.pas' {invReports};

{$R *.res}
function showInventarizationRep:boolean;
begin
try
 Application.CreateForm(Tdm, dm);
 Application.CreateForm(TinvReports, invReports);
 invReports.ShowModal;
 invReports.Free;
 Result:=true;
except
  Result:=false;
end;
end;

exports
  showInventarizationRep;
begin
end.
