library plotncalc;

uses
  SysUtils,
  Classes,
  forms,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_calcform in 'U_calcform.pas' {frmplotncalc};

{$R *.res}
function plotncalcform:boolean;
begin
try
 application.CreateForm(tdm, dm);
 application.CreateForm(tfrmplotncalc, frmplotncalc);
 frmplotncalc.ShowModal;
 frmplotncalc.Free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 plotncalcform;
begin
end.
