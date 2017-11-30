library akts_form;

uses
  SysUtils,
  Forms,
  Classes,
  u_frmAkts in 'u_frmAkts.pas' {frmAkts},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}
function show_akts_form:boolean;
begin
try
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmAkts, frmAkts);
  frmAkts.ShowModal;
  frmAkts.Free;
  dm.Free;
  Result:=True;
except
  Result:=False;
end;
end;

exports
  show_akts_form;
begin
end.
