program guard;

uses
  Forms,
  main in 'main.pas' {frmZayView},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmZayView, frmZayView);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
