library tank_dic_form;

uses
  SysUtils,
  Classes,
  forms,
  u_tankdic in 'u_tankdic.pas',
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_edit_tank_param in 'U_edit_tank_param.pas' {edit_tank_param};

{$R *.res}

function tank_dic_show:boolean;
begin
try
 Application.CreateForm(Tdm, dm);
 Application.CreateForm(Ttank_dic, tank_dic);
 tank_dic.ShowModal;
 tank_dic.Free;
 dm.Free;
 Result:=true;
except
 Result:=False;
end;
end;

exports
 tank_dic_show;
begin
end.
