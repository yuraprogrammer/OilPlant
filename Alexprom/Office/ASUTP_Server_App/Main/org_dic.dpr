library org_dic;

uses
  SysUtils,
  Forms,
  Classes,
  u_dm in 'u_dm.pas' {dm},
  u_frm_organizations in 'u_frm_organizations.pas' {frm_organizations};

{$R *.res}

function show_org_dic:boolean;
begin
try
 Application.CreateForm(Tdm, dm);
 Application.CreateForm(Tfrm_organizations, frm_organizations);
  frm_organizations.ShowModal;
 frm_organizations.Free;
 dm.Free;
 Result:=True;
except
 Result:=False;
end;
end;

exports
  show_org_dic;
begin
end.
