library addZay;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Forms,
  Types,
  Messages,
  Dialogs,
  Windows,
  Classes,
  newZay in 'newZay.pas' {Form1},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}

function addZ: boolean;
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

function nomer:integer;
begin
  result:=e;
end;

exports
  addZ, e;
begin
end.
