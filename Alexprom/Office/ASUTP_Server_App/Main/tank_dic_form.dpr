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
  Application.CreateForm(Tedit_tank_param, edit_tank_param);
  tank_dic.ShowModal;
 tank_dic.free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 tank_dic_show;
begin
end.
