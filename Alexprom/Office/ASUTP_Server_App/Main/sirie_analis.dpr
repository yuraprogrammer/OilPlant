library sirie_analis;

uses
  SysUtils,
  Classes,
  forms,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_sirieanalisform in 'U_sirieanalisform.pas' {sirieAnalisForm};

{$R *.res}

function sirie_analis_form:boolean;
begin
try
 application.CreateForm(tdm, dm);
 application.CreateForm(tsirieanalisform, sirieanalisform);
 sirieanalisform.ShowModal;
 sirieanalisform.Free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 sirie_analis_form;
begin
end.
