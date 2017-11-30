library show_cur_tank_data;

uses
  SysUtils,
  Forms,
  Types,
  Messages,
  Dialogs,
  WIndows,
  Classes,
  U_editTankMat in 'U_editTankMat.pas' {editTankMat},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}
function show_form_tank_data:boolean;
begin
try
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TeditTankMat, editTankMat);
  editTankMat.ShowModal;
  editTankMat.Free;
  dm.Free;
  Result:=true;
except
  Result:=false;
end;
end;

exports
  show_form_tank_data;
begin
end.
