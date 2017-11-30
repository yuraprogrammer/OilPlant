library sirie_analisis_report;


uses
  SysUtils,
  Classes,
  forms,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  Usirieanalisreport in 'Usirieanalisreport.pas' {sirieanalisreport};

{$R *.res}

function sirie_analisis_report_form(al:byte):boolean;
begin
try
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tsirieanalisreport, sirieanalisreport);
  if ((al=1) or (al=0)) then
   sirieanalisreport.button3.enabled:=true
  else
   sirieanalisreport.button3.enabled:=false;
  if (al=0) then
    sirieanalisreport.button4.enabled:=true
  else
    sirieanalisreport.button4.enabled:=false;
  sirieanalisreport.ShowModal;
  sirieanalisreport.Free;
  dm.Free;
  result:=true;
except
  result:=false;
end;
end;

exports
 sirie_analisis_report_form;
begin
end.
