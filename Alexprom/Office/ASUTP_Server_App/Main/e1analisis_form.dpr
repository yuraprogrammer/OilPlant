library e1analisis_form;

uses
  SysUtils,
  Classes,
  forms,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_e1analisis in 'U_e1analisis.pas' {frm_e1analisis};

{$R *.res}
function e1analisis(tbl:byte):boolean;
begin
try
 application.CreateForm(tdm, dm);
 application.CreateForm(tfrm_e1analisis, frm_e1analisis);
 case tbl of
 0:begin
  frm_e1analisis.tblname:='dbo.e1';
  frm_e1analisis.Caption:='Анализ по е1';
 end;
 1:begin
  frm_e1analisis.tblname:='dbo.p25';
  frm_e1analisis.Caption:='Анализ по р25';
 end;
 2:begin
  frm_e1analisis.tblname:='dbo.td';
  frm_e1analisis.Caption:='Анализ по тд';
 end;
 end;
 frm_e1analisis.ShowModal;
 frm_e1analisis.free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 e1analisis;
begin
end.
