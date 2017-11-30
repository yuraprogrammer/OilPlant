library input_mat;

uses
  SysUtils,
  Forms,
  Classes,
  u_frm_Loaders in 'u_frm_Loaders.pas' {frm_editLoaders},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}
function show_loader_form:boolean;
begin
try
  Application.CreateForm(Tdm,dm);
  Application.CreateForm(Tfrm_editLoaders, frm_editLoaders);
  frm_editLoaders.ShowModal;
  frm_editLoaders.Free;
  dm.Free;
  Result:=true;
except
  Result:=false;
end;
end;

exports
  show_loader_form;
begin
end.
