unit newZay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ADODB, RpDefine, RpRave, RpRender, RpRenderHTML,
  RpCon, RpConDS, DB, RpBase, RpSystem, ExtCtrls, mainfunctions, Mask;

type
  TForm1 = class(TForm)

    procedure FormCreate(Sender: TObject);




  private
    procedure initForm;
  public

  end;

var
  Form1: TForm1;
  query,query_s:TADOQuery;
  e,r:integer;

  // procedure ProcStr(var e: integer); stdcall; external 'lib\update_zay.dll' name 'ProcStr';



implementation


{$R *.dfm}
uses
  u_dm, main;



procedure TForm1.FormCreate(Sender: TObject);
begin
 query_s:=TADOQuery.Create(nil);
 query_s.Connection:=dm.alexpromCon;
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 InitForm;
end;

//procedure TfrmTSP.addMatClick(Sender: TObject);
//begin
// DllHandle:=SafeLoadLibrary('lib\input_mat.dll');
// if DLLHandle = 0 then
//    begin
//      if GetLastError = ERROR_DLL_NOT_FOUND then
//        ShowMessage('Ошибка загрузки DLL');
//        Close;
//    end;
// show_loader_form:=GetProcAddress(DllHandle,'show_loader_form');
// if show_loader_form=true then
//  FreeLibrary(DllHandle);
//  InitForm;
//end;



procedure TForm1.initForm;
var
  r:integer;
begin

  query_s.Close;
  query_s.SQL.Clear;
  query_s.SQL.Add('select max(nomerzay) from dbo.zay');
  query_s.Open;
  r:=query_s.Fields[0].AsInteger;
  e:=r+1;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('insert into dbo.zay(nomerzay) values (:nz)');
  query.Parameters[0].Value:=e;
  query.ExecSQL;

   //query_s.Fields[0].AsString;
  //
  //ProcStr(e);
  DllHandle:=SafeLoadLibrary('lib\update_zay.dll');
 if DLLHandle = 0 then
    begin
      if GetLastError = ERROR_DLL_NOT_FOUND then
        ShowMessage('Ошибка загрузки DLL');
        Close;
    end;
 show_loader_form:=GetProcAddress(DllHandle,'updZ');
 if show_loader_form=true then
  FreeLibrary(DllHandle);
  close;
  end;
 // FormClose;
end.
