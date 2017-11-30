library load_grad_table;

uses
  SysUtils,
  Forms,
  Classes,
  Types,
  Windows,
  Messages,
  Dialogs,
  U_frmLoadGradTable in 'U_frmLoadGradTable.pas' {grad_table_load_form},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}
function showGradTableLoading:boolean;
begin
try
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tgrad_table_load_form, grad_table_load_form);
  grad_table_load_form.ShowModal;
  grad_table_load_form.Free;
  dm.Free;
  Result:=true;
except
  Result:=false;
end;
end;

exports
  showGradTableLoading;
  type
    TSomeObject = class(TObject)
    Fieldl: String;
  end;
  var FirstObj: TSomeObject;

procedure DLLEntryPoint(Reason: Word); 
begin
  case Reason of
    DLL_PROCESS_ATTACH: begin
    FirstObj := TSomeObject.Create;
    FirstObj.Fieldl := 'Объект создан';
    //ShowMessage(FirstObj.Fieldl);
    end;
    DLL_PROCESS_DETACH:
    FirstObj.Free;
    DLL_THREAD_ATTACH:;
    //ShowMessage('Создан новый поток');
    DLL_THREAD_DETACH:;
end;

  end; 

begin 

DLLProc := @DLLEntryPoint; 

DLLEntryPoint(DLL_PROCESS_ATTACH);  

end.

