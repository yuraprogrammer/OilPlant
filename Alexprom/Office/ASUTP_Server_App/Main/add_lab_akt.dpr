library add_lab_akt;

uses
  SysUtils,
  Classes,
  Forms,
  u_addLabAkt in 'u_addLabAkt.pas' {frmAddLabAkt},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}

function add_akt_lab:boolean;
begin
try
 Application.CreateForm(Tdm, dm);
 Application.CreateForm(TfrmAddLabAkt, frmAddLabAkt);
 frmAddLabAkt.ShowModal;
 frmAddLabAkt.Free;
 dm.Free;
 Result:=true;
except
 Result:=false;
end;
end;

exports
 add_akt_lab;
begin
end.
