library TMC_dic;

uses
  SysUtils,
  Classes,
  Forms,
  U_sirie_dic in 'U_sirie_dic.pas' {sirie_dic},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}

function show_tmc_form:boolean;
begin
try
  Application.CreateForm(Tdm,dm);
  Application.CreateForm(Tsirie_dic, sirie_dic);
  sirie_dic.ShowModal;
  sirie_dic.Free;
  dm.Free;
  Result:=true;
except
  Result:=False;
end;
end;

exports
  show_tmc_form;
begin
end.
