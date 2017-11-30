program UserMonitor;

uses
  Forms,
  U_userMonitor in 'U_userMonitor.pas' {mainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TmainForm, mainForm);
  Application.Run;
end.
