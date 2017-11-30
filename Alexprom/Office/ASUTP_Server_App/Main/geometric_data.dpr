library geometric_data;

uses
  SysUtils,
  Forms,
  Classes,
  U_geometric in 'U_geometric.pas' {GeometricData},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}
function show_geometric_data:boolean;
begin
try
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TGeometricData, GeometricData);
  GeometricData.ShowModal;
  GeometricData.Free;
  dm.Free;
  Result:=True;
except
  Result:=False;
end;
end;

exports
  show_geometric_data;
begin
end.
