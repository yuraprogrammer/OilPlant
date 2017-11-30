library backupServerData;

uses
  Forms,
  SysUtils,
  Windows,
  U_backupServerData in 'U_backupServerData.pas' {DBloadData};

{$R *.res}
  function showBackupForm:boolean;
  begin
   try
    Application.CreateForm(TDBloadData, DBloadData);
    DBLoadData.ShowModal;
    DBLoadData.Free;
    Result:=true;
   except
    Result:=False;
   end;
  end;

  exports
    showBackupForm;
begin
end.
