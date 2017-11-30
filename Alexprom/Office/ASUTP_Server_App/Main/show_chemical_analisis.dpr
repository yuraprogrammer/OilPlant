library show_chemical_analisis;

uses
  SysUtils,
  Classes,
  forms,
  U_analisisreport in 'U_analisisreport.pas' {analisisreport},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}

function showanalisisreport:boolean;
begin
try
 application.createform(tdm, dm);
 application.CreateForm(tanalisisreport, analisisreport);
 analisisreport.ShowModal;
 analisisreport.Free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 showanalisisreport;
begin
end.
