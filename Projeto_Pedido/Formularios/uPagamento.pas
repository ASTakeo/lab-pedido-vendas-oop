unit uPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.Buttons;

type
  TfPagamento = class(TForm)
    pnlPrincipal: TPanel;
    pnlInformacao: TPanel;
    pnlFormaPagto: TPanel;
    Panel1: TPanel;
    pnlInfoVenda: TPanel;
    btnCancelar: TPanel;
    pnlEdit: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    lblTotalVenda: TLabel;
    Label3: TLabel;
    edtAcrescimo: TEdit;
    Panel4: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel5: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Shape1: TShape;
    Panel6: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Panel7: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Panel8: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    pnlFormaPagtoHeader: TPanel;
    pnlSeparador: TPanel;
    Shape2: TShape;
    Panel11: TPanel;
    Panel9: TPanel;
    pnlOpcapFormaPagto: TPanel;
    pnlPagtoDinheiro: TPanel;
    shpPagtoDinheiro: TShape;
    pnlPagtoPix: TPanel;
    shpPagtoPix: TShape;
    pnlPagtoCartao: TPanel;
    shpPagtoCartao: TShape;
    pnlFormaPagtoFrame: TPanel;
    pnlSeparador1: TPanel;
    Shape6: TShape;
    ImageList1: TImageList;
    btnPagtoCartao: TSpeedButton;
    btnPagtoPix: TSpeedButton;
    btnPagtoDinheiro: TSpeedButton;
    pnlConvenio: TPanel;
    shpConvenio: TShape;
    btnConvenio: TSpeedButton;
    procedure btnPagtoPixClick(Sender: TObject);
    procedure btnPagtoDinheiroClick(Sender: TObject);
    procedure btnPagtoCartaoClick(Sender: TObject);
    procedure btnConvenioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPagamento: TfPagamento;

implementation

uses
  uFormaPagtoQRCode
 ,uFormaPagtoDinheiro
 ,uFormaPagtoCartaoCredito, uFormaPagtoConvenio;

{$R *.dfm}

procedure TfPagamento.btnConvenioClick(Sender: TObject);
var
  PagtoConvenio: TfFormaPagtoConvenio;
begin
  PagtoConvenio        := TfFormaPagtoConvenio.Create(nil);
  PagtoConvenio.Align  := alClient;
  PagtoConvenio.Parent := pnlFormaPagtoFrame;
end;

procedure TfPagamento.btnPagtoCartaoClick(Sender: TObject);
var
  PagtoCartao: TfFormaPagtoCartaoCredito;
begin
  PagtoCartao        := TfFormaPagtoCartaoCredito.Create(nil);
  PagtoCartao.Align  := alClient;
  PagtoCartao.Parent := pnlFormaPagtoFrame
end;

procedure TfPagamento.btnPagtoDinheiroClick(Sender: TObject);
var
  PagtoDinheiro: TfFormaPagtoDinheiro;
begin
  PagtoDinheiro        := TfFormaPagtoDinheiro.Create(nil);
  PagtoDinheiro.Align  := alClient;
  PagtoDinheiro.Parent := pnlFormaPagtoFrame;
end;

procedure TfPagamento.btnPagtoPixClick(Sender: TObject);
Var
  PagtoQRCode: TfFormaPagtoQRCode;
begin
  PagtoQRCode        := TfFormaPagtoQRCode.Create(nil);
  PagtoQRCode.Align  := alClient;
  PagtoQRCode.Parent := pnlFormaPagtoFrame;
end;

end.


