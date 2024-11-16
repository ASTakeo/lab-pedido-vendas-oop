unit uCadastrarPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.Imaging.pngimage,
  Vcl.NumberBox, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Async, FireDAC.DApt, uConsultarPedido,
  System.ImageList, Vcl.ImgList;

type
  TfCadastrarPedido = class(TForm)
    pnlMaster: TPanel;
    pnlPedidoResumo: TPanel;
    Panel2: TPanel;
    pnlInfoVenda: TPanel;
    Shape1: TShape;
    Panel3: TPanel;
    Label2: TLabel;
    edtAcrescimo: TEdit;
    Panel4: TPanel;
    lblTotalProdutos: TLabel;
    Label3: TLabel;
    Panel5: TPanel;
    Label4: TLabel;
    Edit1: TEdit;
    Panel7: TPanel;
    lblTotalPedido: TLabel;
    Label9: TLabel;
    pnlPedidoDados: TPanel;
    pnlPedidoCliente: TPanel;
    Label7: TLabel;
    Label1: TLabel;
    pnlCancelar: TPanel;
    pnlSalvar: TPanel;
    btnNovo: TSpeedButton;
    edtCodigoCliente: TEdit;
    edtDataEmissao: TEdit;
    pnlPedidoItem: TPanel;
    edtCliente: TEdit;
    pnlPedidoItemNav: TPanel;
    Label14: TLabel;
    edtCodigoProduto: TEdit;
    edtDescricaoProduto: TEdit;
    edtQtdeProduto: TEdit;
    edtValorUnitario: TEdit;
    btnCancelar: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    pnlRemoveProduto: TPanel;
    btnRemoveProduto: TSpeedButton;
    pnlAddProduto: TPanel;
    btnAddProduto: TSpeedButton;
    grdPedidoItem: TDBGrid;
    qryCadastro: TFDQuery;
    dsCadastro: TDataSource;
    qryCadastroID_PedidoItem: TFDAutoIncField;
    qryCadastroID_Pedido: TIntegerField;
    qryCadastroNM_Produto: TStringField;
    qryCadastroID_Produto: TIntegerField;
    qryCadastroQT_Produto: TBCDField;
    qryCadastroVL_Unitario: TBCDField;
    qryCadastroVL_Total: TBCDField;
    pnlHeader: TPanel;
    pnlFechar: TPanel;
    btnFechar: TSpeedButton;
    lblTitulo: TLabel;
    pnlLocalizarCliente: TPanel;
    shpLocalizarCliente: TShape;
    btnLocalizarCliente: TSpeedButton;
    ImageList1: TImageList;
    pnlLocalizarProduto: TPanel;
    shpLocalizarProduto: TShape;
    btnLocalizarProduto: TSpeedButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoClienteExit(Sender: TObject);
    procedure edtCodigoProdutoExit(Sender: TObject);
    procedure edtQtdeProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure Atualizar();
    procedure grdPedidoItemDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdPedidoItemDblClick(Sender: TObject);
    procedure btnRemoveProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLocalizarClienteClick(Sender: TObject);
    procedure btnLocalizarProdutoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Operacao: Integer;      // 1. Inclusao - 2. Alteração
    ID_Pedido, ID_PedidoItem: Integer;
    TConsultarPedido: TfConsultarPedido;
    VL_Total_Pedido: Currency;
  end;

var
  fCadastrarPedido: TfCadastrarPedido;

implementation

uses
  uProduto, uCliente, uPedido, uLocalizarCliente, uLocalizarProduto;

{$R *.dfm}

procedure TfCadastrarPedido.Atualizar;
var
  Pedido : TForm;
begin
  try
    qryCadastro.Close;
    qryCadastro.ParamByName('ID_Pedido').Value := ID_Pedido;
    qryCadastro.Open;

    edtCodigoProduto.Text    := '';
    edtDescricaoProduto.Text := '';
    edtQtdeProduto.Text      := '';
    edtValorUnitario.Text    := '';
    ID_PedidoItem            := 0;
    lblTotalProdutos.Caption := FormatFloat('#,##0.00',VL_Total_Pedido);
    lblTotalPedido.Caption   := FormatFloat('#,##0.00',VL_Total_Pedido);

    TConsultarPedido.Atualizar();

    case Operacao of
      1:  begin
            if (edtCodigoCliente.CanFocus) then
              edtCodigoCliente.SetFocus;
          end;
      2:  begin
            if (edtCodigoProduto.CanFocus) then
              edtCodigoProduto.SetFocus;
          end;
    end;
  except
    ShowMessage('Erro ao tentar abrir a tabela itens do pedido');
  end;
end;

procedure TfCadastrarPedido.btnAddProdutoClick(Sender: TObject);
var
  PedidoItem: TPedidoItem;
begin
  PedidoItem := TPedidoItem.Create;

  try
    PedidoItem.ID_Pedido     := ID_Pedido;
    PedidoItem.ID_PedidoItem := ID_PedidoItem;
    PedidoItem.ID_Produto    := StrToInt(edtCodigoProduto.Text);
    PedidoItem.QT_Produto    := StrToCurr(edtQtdeProduto.Text);
    PedidoItem.VL_Unitario   := StrToCurr(edtValorUnitario.Text);

    case ID_PedidoItem of
      0:    begin
              PedidoItem.Inserir;
            end;
      else  begin
              PedidoItem.Alterar;
            end;
    end;

    VL_Total_Pedido := PedidoItem.TotalPedido();

    PedidoItem.AtualizarValorPedido(VL_Total_Pedido);

    Atualizar();

  finally
    FreeAndNil(PedidoItem);
  end;
end;

procedure TfCadastrarPedido.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfCadastrarPedido.btnLocalizarClienteClick(Sender: TObject);
begin
  if (Operacao = 1) then
  begin
    try
      Application.CreateForm(TfLocalizarCliente,fLocalizarCliente);
      fLocalizarCliente.ShowModal;

      edtCodigoCliente.Text := FormatFloat('00000', fLocalizarCliente.ID_Cliente);
      edtCliente.Text       := fLocalizarCliente.NM_Cliente;
    finally
      FreeAndNil(fLocalizarCliente);
    end;
  end;
end;

procedure TfCadastrarPedido.btnLocalizarProdutoClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfLocalizarProduto,fLocalizarProduto);
    fLocalizarProduto.ShowModal;

    edtCodigoProduto.Text    := FormatFloat('00000', fLocalizarProduto.ID_Produto);
    edtDescricaoProduto.Text := fLocalizarProduto.NM_Produto;
    edtQtdeProduto.Text      := '1,00';
    edtValorUnitario.Text    := FormatFloat('0.00', fLocalizarProduto.VL_Unitario);
  finally
    FreeAndNil(fLocalizarCliente);
  end;

end;

procedure TfCadastrarPedido.btnNovoClick(Sender: TObject);
var
  Pedido: TPedido;
begin
  if (Operacao = 1) then
  begin
    Pedido := TPedido.Create;

    try
      Pedido.ID_Pedido  := ID_Pedido;
      Pedido.ID_Cliente := StrToInt(edtCodigoCliente.Text);
      Pedido.VL_Total   := 0;

      Pedido.Inserir;

      ID_Pedido           := Pedido.ID_Pedido;
      lblTitulo.Caption   := 'Novo Pedido: ' + FormatFloat('00000', ID_Pedido);
      edtDataEmissao.Text := FormatDateTime('DD/MM/YYYY', Now);

      if (edtCodigoProduto.CanFocus) then
        edtCodigoProduto.SetFocus;

      TConsultarPedido.Atualizar();

    finally
      FreeAndNil(Pedido);
    end;
  end;
end;

procedure TfCadastrarPedido.btnRemoveProdutoClick(Sender: TObject);
var
  PedidoItem: TPedidoItem;
begin
  PedidoItem := TPedidoItem.Create;

  try
    PedidoItem.ID_PedidoItem := qryCadastro.FieldByName('ID_PedidoItem').AsInteger;

    if (MessageBox(Handle, PChar('Deseja realmente excluir o item :' + #13 + #13 +
                                qryCadastro.FieldByName('NM_Produto').AsString),
                               'Exclusão', MB_YESNO + MB_ICONINFORMATION + MB_DEFBUTTON2) = ID_YES) then
    begin
      PedidoItem.Excluir;
      //ShowMessage('Registro excluído com sucesso.');
      Atualizar();
    end;
  finally
    FreeAndNil(PedidoItem);
  end;
end;

procedure TfCadastrarPedido.grdPedidoItemDblClick(Sender: TObject);
begin
  edtCodigoProduto.Text    := FormatFloat('00000',qryCadastro.FieldByName('ID_Produto').AsInteger);
  edtDescricaoProduto.Text := qryCadastro.FieldByName('NM_Produto').AsString;
  edtQtdeProduto.Text      := FormatFloat('0.00',qryCadastro.FieldByName('QT_Produto').AsCurrency);
  edtValorUnitario.Text    := FormatFloat('0.00',qryCadastro.FieldByName('VL_Unitario').AsCurrency);
  ID_PedidoItem            := qryCadastro.FieldByName('ID_PedidoItem').AsInteger;

  if (edtQtdeProduto.CanFocus) then
    edtQtdeProduto.SetFocus;
end;

procedure TfCadastrarPedido.grdPedidoItemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle,SB_HORZ,False); //Remove barra Horizontal
end;

procedure TfCadastrarPedido.edtCodigoClienteExit(Sender: TObject);
var
  ConsultarCliente: TCliente;
begin
  ConsultarCliente := TCliente.Create;

  try
    ConsultarCliente.ID_Cliente := StrToInt(edtCodigoCliente.Text);
    ConsultarCliente.Localizar();

    edtCodigoCliente.Text := FormatFloat('00000', ConsultarCliente.ID_Cliente);
    edtCliente.Text       := ConsultarCliente.NM_Cliente;
  finally
    FreeAndNil(ConsultarCliente);
  end;
end;

procedure TfCadastrarPedido.edtCodigoProdutoExit(Sender: TObject);
var
  ConsultarProduto: TProduto;
begin
  if edtCodigoProduto.Text <> '' then
  begin
    ConsultarProduto := TProduto.Create;

    try
      ConsultarProduto.ID_Produto:= StrToInt(edtCodigoProduto.Text);
      ConsultarProduto.Localizar();

      edtCodigoProduto.Text    := FormatFloat('00000', ConsultarProduto.ID_Produto);
      edtDescricaoProduto.Text := ConsultarProduto.NM_Produto;
      edtQtdeProduto.Text      := '1,00';
      edtValorUnitario.Text    := FormatFloat('0.00', ConsultarProduto.VL_Unitario);
    finally
      FreeAndNil(ConsultarProduto);
    end;
  end;
end;

procedure TfCadastrarPedido.edtQtdeProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9', ',']) then
  begin
     ShowMessage('Valor inválido: ' + Key);
     Key := #0;
  end
  else
  if (Key = '.') and (Pos(Key, edtQtdeProduto.Text) > 0) then
  begin
    ShowMessage('Valor inválido: ' + Key);
    Key := #0;
  end;
end;

procedure TfCadastrarPedido.edtValorUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9', ',']) then
  begin
     ShowMessage('Valor inválido: ' + Key);
     Key := #0;
  end
  else
  if (Key = '.') and (Pos(Key, edtValorUnitario.Text) > 0) then
  begin
    ShowMessage('Valor inválido: ' + Key);
    Key := #0;
  end;
end;

procedure TfCadastrarPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //TConsultarPedido.Free;
  Self.Destroy;
end;

procedure TfCadastrarPedido.FormCreate(Sender: TObject);
begin
  TConsultarPedido := TfConsultarPedido.Create(nil);
end;

procedure TfCadastrarPedido.FormShow(Sender: TObject);
begin
  ID_PedidoItem := 0;
  Atualizar();
end;

end.
