library new_uppg_akt;

uses
  SysUtils,
  Classes,
  Forms,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_frmAddUppgAkt in 'U_frmAddUppgAkt.pas' {frmAddUppgAkt};

{$R *.res}

function add_uppg_akt:boolean;
begin
try
 Application.CreateForm(Tdm, dm);
 Application.CreateForm(tfrmAddUppgAkt, frmAddUppgAkt);
 frmAddUppgAkt.ShowModal;
 frmAddUppgAkt.Free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 add_uppg_akt;
begin
end.
