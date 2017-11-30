library new_lab_akt;

{%TogetherDiagram 'ModelSupport_new_lab_akt\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_new_lab_akt\U_newLabAkt\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_new_lab_akt\U_newLabAkt\default.txvpck'}
{%TogetherDiagram 'ModelSupport_new_lab_akt\new_lab_akt\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_new_lab_akt\new_lab_akt\default.txvpck'}

uses
  SysUtils,
  forms,
  Classes,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_newLabAkt in 'U_newLabAkt.pas' {frmNewLabAkt};

{$R *.res}

function show_new_lab_akt:boolean;
begin
try
 Application.CreateForm(Tdm, dm);
 Application.CreateForm(TfrmNewLabAkt, frmNewLabAkt);
 frmNewLabAkt.ShowModal;
 frmNewLabAkt.Free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 show_new_lab_akt;
begin
end.
