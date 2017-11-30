library show_weight_report;

uses
  SysUtils,
  Forms,
  Dialogs,
  Messages,
  Classes,
  Types,
  Windows,
  u_NewWeightingReport in 'u_NewWeightingReport.pas' {frmNewWeightingReport},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}
function show_frm_weight_report:boolean;
begin
try
 Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmNewWeightingReport, frmNewWeightingReport);
  frmNewWeightingReport.ShowModal;
 frmNewWeightingReport.Free;
 dm.Free;
 Result:=true;
except
 Result:=false;
end;
end;

exports
  show_frm_weight_report;

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
