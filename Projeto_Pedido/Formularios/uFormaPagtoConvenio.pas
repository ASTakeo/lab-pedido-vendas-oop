unit uFormaPagtoConvenio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, System.ImageList, Vcl.ImgList;

type
  TfFormaPagtoConvenio = class(TFrame)
    pnlPrincipal: TPanel;
    Label1: TLabel;
    edtValorRecebido: TEdit;
    pnlSeparador: TPanel;
    Shape2: TShape;
    pnlCliente: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    Panel1: TPanel;
    ImageList1: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
