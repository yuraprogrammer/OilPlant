library add_akt_form;

uses
  SysUtils,
  Forms,
  Classes,
  u_frmAddAkt in 'u_frmAddAkt.pas' {frmAddAkt},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}
function show_add_akt_form:boolean;
begin
try
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmAddAkt, frmAddAkt);
  frmAddAkt.ShowModal;
  frmAddAkt.Free;
  dm.Free;
  Result:=True;
except
  Result:=False;
end;
end;

exports
  show_add_akt_form;
begin
end.
