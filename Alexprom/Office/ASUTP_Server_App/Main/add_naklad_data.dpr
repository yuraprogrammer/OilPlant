library add_naklad_data;

uses
  SysUtils,
  Classes,
  Forms,
  u_addNaklad in 'u_addNaklad.pas' {frmAddNaklad},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}
function show_add_naklad_form:boolean;
begin
try
  Application.CreateForm(Tdm,dm);
  Application.CreateForm(TfrmAddNaklad, frmAddNaklad);
  frmAddNaklad.ShowModal;
  frmAddNaklad.Free;
  dm.Free;
  Result:=true;
except
  Result:=false;
end;
end;

exports
  show_add_naklad_form;
begin
end.
