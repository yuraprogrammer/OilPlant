library showLabAkt;

uses
  SysUtils,
  Classes,
  Forms,
  U_labakts in 'U_labakts.pas' {frmLabAkts},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}
function view_LabAkt:boolean;
begin
try
 Application.CreateForm(Tdm, dm);
 Application.CreateForm(TfrmLabAkts, frmlabAkts);
 frmLabAkts.ShowModal;
 frmLabAkts.Free;
 dm.Free;
 Result:=true;
except
 Result:=false;
end;
end;

exports
 view_LabAkt;
begin
end.
