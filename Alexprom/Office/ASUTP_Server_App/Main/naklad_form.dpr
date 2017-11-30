library naklad_form;

uses
  SysUtils,
  Forms,
  Classes,
  u_showNaklad in 'u_showNaklad.pas' {frmShowNaklad},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}

function show_naklad_form:boolean;
begin
try
  Application.CreateForm(Tdm,dm);
  Application.CreateForm(TfrmShowNaklad, frmShowNaklad);
  frmShowNaklad.ShowModal;
  frmShowNaklad.Free;
  dm.Free;
  Result:=True;
finally
  Result:=False;
end;
end;

exports
  show_naklad_form;
begin
end.
