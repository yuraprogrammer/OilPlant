library edituppgakt;

uses
  SysUtils,
  Classes,
  forms,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_frmEditUppgAkt in 'U_frmEditUppgAkt.pas' {frmEditUppgAkt};

{$R *.res}
function EditUppgAkts:boolean;
begin
try
 application.CreateForm(tdm, dm);
 application.CreateForm(tfrmEditUppgAkt, frmEditUppgAkt);
 frmEditUppgAkt.ShowModal;
 frmEditUppgAkt.Free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 EditUppgAkts;
begin
end.
