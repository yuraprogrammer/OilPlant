library transfer_resolve;

uses
  SysUtils,
  forms,
  Classes,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_frmResolveTransfers in 'U_frmResolveTransfers.pas' {frmResolveTransfers};

{$R *.res}

function resolve_form:boolean;
begin
try
 Application.CreateForm(Tdm, dm);
 Application.CreateForm(TfrmResolveTransfers, frmResolveTransfers);
 frmResolveTransfers.ShowModal;
 frmResolveTransfers.Free;
 dm.Free;
 Result:=true;
except
 Result:=false;
end;
end;

exports
 resolve_form;
begin
end.
