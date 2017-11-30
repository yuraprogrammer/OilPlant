library level_to_volume;

uses
  SysUtils,
  Classes,
  Forms,
  U_oil_calc in 'U_oil_calc.pas' {oil_calc},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}

function show_calc_form:boolean;
begin
  try
    Application.CreateForm(Tdm, dm);
    Application.CreateForm(Toil_calc, oil_calc);
    oil_calc.ShowModal;
    oil_calc.Free;
    dm.Free;
    Result:=true;
  except
    Result:=false;
  end;
end;

exports
  show_calc_form;
begin
end.
