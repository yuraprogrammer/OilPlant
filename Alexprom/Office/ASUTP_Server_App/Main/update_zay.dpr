library update_zay;

uses
  SysUtils,
  Forms,
  Types,
  Messages,
  Dialogs,
  Windows,
  Classes,
   updatezay in 'updateZay.pas' {Form1},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}
procedure ProcStr(var number : integer); stdcall;
begin
 r:=number;
end;

function updZ: boolean;
begin
    try
      Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Form1.ShowModal;
      Form1.Free;
      dm.Free;
      Result:=true;
      except
      Result:=false;
    end;
end;



exports
  updZ;//, ProcStr;
begin
end.


