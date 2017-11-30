unit uPrivateDict;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, StdCtrls, Buttons, ComCtrls;

type
  TbtnNew = class(TForm)
    ListView1: TListView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    ActionList1: TActionList;
    ImageList1: TImageList;
    actionNewPrivate: TAction;
    actionEditPrivate: TAction;
    actionDeletePrivate: TAction;
    actionClose: TAction;
    procedure actionCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  btnNew: TbtnNew;

implementation

{$R *.dfm}

procedure TbtnNew.actionCloseExecute(Sender: TObject);
begin
 close;
end;

end.
