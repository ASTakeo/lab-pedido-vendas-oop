program ProjetoPedido;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  uPDV in 'uPDV.pas' {fPDV},
  uLoginPDV in 'uLoginPDV.pas' {fLoginPDV},
  uPagamento in 'uPagamento.pas' {fPagamento},
  uFormaPagtoQRCode in 'uFormaPagtoQRCode.pas' {fFormaPagtoQRCode: TFrame},
  uFormaPagtoDinheiro in 'uFormaPagtoDinheiro.pas' {fFormaPagtoDinheiro: TFrame},
  uFormaPagtoCartaoCredito in 'uFormaPagtoCartaoCredito.pas' {fFormaPagtoCartaoCredito: TFrame},
  uFormaPagtoConvenio in 'uFormaPagtoConvenio.pas' {fFormaPagtoConvenio: TFrame},
  uConsultarCliente in 'uConsultarCliente.pas' {fConsultarCliente},
  uDMConexao in 'uDMConexao.pas' {fDMConexao: TDataModule},
  uCliente in 'uCliente.pas',
  uCadastrarCliente in 'uCadastrarCliente.pas' {fCadastrarCliente},
  uConsultarProduto in 'uConsultarProduto.pas' {fConsultarProduto},
  uProduto in 'uProduto.pas',
  uCadastrarProduto in 'uCadastrarProduto.pas' {fCadastrarProduto},
  uConsultarPedido in 'uConsultarPedido.pas' {fConsultarPedido},
  uCadastrarPedido in 'uCadastrarPedido.pas' {fCadastrarPedido},
  uPedido in 'uPedido.pas',
  uLocalizarCliente in 'uLocalizarCliente.pas' {fLocalizarCliente},
  uLocalizarProduto in 'uLocalizarProduto.pas' {fLocalizarProduto},
  uRecomendacao in 'uRecomendacao.pas' {fRecomendacao: TFrame};

{$R *.res}

begin
  Application.Initialize;
  //ReportMemoryLeaksOnShutdown   := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TfDMConexao, fDMConexao);
  Application.Run;
end.
