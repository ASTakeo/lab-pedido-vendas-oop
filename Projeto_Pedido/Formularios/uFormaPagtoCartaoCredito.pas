unit uFormaPagtoCartaoCredito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList;

type
  TfFormaPagtoCartaoCredito = class(TFrame)
    pnlPrincipal: TPanel;
    pnlOpcapFormaPagto: TPanel;
    pnlCartaoDebito: TPanel;
    shpCartaoDebito: TShape;
    btnCartaoDebito: TSpeedButton;
    pnlCartaoCredito: TPanel;
    shpCartaoCredito: TShape;
    btnCartaoCredito: TSpeedButton;
    edtValorRecebido: TEdit;
    Label1: TLabel;
    pnlSeparador: TPanel;
    Shape2: TShape;
    ImageList1: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
