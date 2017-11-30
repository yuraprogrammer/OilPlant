library new_compound;

uses
  SysUtils,
  Classes,
  Forms,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  u_newcompound in 'u_newcompound.pas' {new_compound_form};

{$R *.res}

function show_compound_form(k_num:longint; date:TDate):boolean;
begin
try
 Application.CreateForm(Tdm, dm);
 Application.CreateForm(Tnew_compound_form, new_compound_form);
 new_compound_form.comp_date:=date;
 new_compound_form.comp_num:=k_num;
 new_compound_form.ShowModal;
 new_compound_form.Free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 show_compound_form;
begin
end.
