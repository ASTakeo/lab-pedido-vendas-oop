unit uConsultarPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.Imaging.pngimage,uLoginPDV, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXCtrls, System.ImageList, Vcl.ImgList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfConsultarPedido = class(TForm)
    pnlPrincipal: TPanel;
    pnlHeader: TPanel;
    pnlMaster: TPanel;
    grdItem: TDBGrid;
    pnlGridItem: TPanel;
    spwPagamento: TSplitView;
    pnlPagamento: TPanel;
    pnlFechar: TPanel;
    Panel1: TPanel;
    btnFechar: TSpeedButton;
    ImageList1: TImageList;
    pnlConsulta: TPanel;
    pnlFiltro: TPanel;
    shpFiltro: TShape;
    pnlPesquisar: TPanel;
    shpPesquisar: TShape;
    btnPesquisar: TSpeedButton;
    pnlExcluir: TPanel;
    shpExcluir: TShape;
    btnExcluir: TSpeedButton;
    pnlEditar: TPanel;
    shpEditar: TShape;
    btnEditar: TSpeedButton;
    pnlInserir: TPanel;
    shpInserir: TShape;
    btnInserir: TSpeedButton;
    qryCadastro: TFDQuery;
    dsCadastro: TDataSource;
    edtFiltro: TEdit;
    qryCadastroID_Pedido: TFDAutoIncField;
    qryCadastroDT_Pedido: TDateField;
    qryCadastroVL_Total: TBCDField;
    qryCadastroNM_Cliente: TStringField;
    qryCadastroID_Cliente: TIntegerField;
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure grdItemDblClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);

    procedure Atualizar();
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    FLogin : TfLoginPDV;

  public
    { Public declarations }
  end;

var
  fConsultarPedido: TfConsultarPedido;

implementation

uses
  uDMConexao, uCliente, uCadastrarPedido, uPedido;

{$R *.dfm}

procedure TfConsultarPedido.Atualizar;
begin
  try
    qryCadastro.Close;
    qryCadastro.Open;
  except
    raise Exception.Create('Erro ao tentar abrir tabela pedido.');
  end;
end;

procedure TfConsultarPedido.btnEditarClick(Sender: TObject);
var
  CadastroPedido : TfCadastrarPedido;
begin
  if (qryCadastro.RecordCount > 0) then
  begin
    CadastroPedido                       := TfCadastrarPedido.Create(nil);
    CadastroPedido.lblTitulo.Caption     := 'Editar Pedido: ' + FormatFloat('00000', qryCadastro.FieldByName('ID_Pedido').AsInteger);
    CadastroPedido.Operacao              := 2;
    CadastroPedido.ID_Pedido             := qryCadastro.FieldByName('ID_Pedido').AsInteger;
    CadastroPedido.edtCodigoCliente.Text := FormatFloat('00000', qryCadastro.FieldByName('ID_Cliente').AsInteger);
    CadastroPedido.edtCliente.Text       := qryCadastro.FieldByName('NM_Cliente').AsString;
    CadastroPedido.edtDataEmissao.Text   := FormatDateTime('DD/MM/YYYY', qryCadastro.FieldByName('DT_Pedido').AsDateTime);
    CadastroPedido.Parent                := pnlMaster;
    CadastroPedido.Align                 := alClient;
    CadastroPedido.Show;
  end;
end;

procedure TfConsultarPedido.btnExcluirClick(Sender: TObject);
var
  Pedido: TPedido;
begin
  if (qryCadastro.RecordCount > 0) then
  begin
    Pedido := TPedido.Create;

    try
      Pedido.ID_Pedido := qryCadastro.FieldByName('ID_Pedido').AsInteger;

      if (MessageBox(Handle, PChar('Deseja realmente excluir o pedido de :' + #13 + #13 +
                                  FormatFloat('000000',qryCadastro.FieldByName('ID_Pedido').AsInteger) + '-' +
                                  qryCadastro.FieldByName('NM_Cliente').AsString),
                                 'Exclusão', MB_YESNO + MB_ICONINFORMATION + MB_DEFBUTTON2) = ID_YES) then
      begin
        Pedido.Excluir;
        ShowMessage('Pedido excluído com sucesso.');
        qryCadastro.Refresh;
      end;
    finally
      FreeAndNil(Pedido);
    end;
  end;
end;

procedure TfConsultarPedido.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfConsultarPedido.btnInserirClick(Sender: TObject);
var
  CadastroPedido : TfCadastrarPedido;
begin
  CadastroPedido                   := TfCadastrarPedido.Create(self);
  CadastroPedido.TConsultarPedido  := Self;
  CadastroPedido.lblTitulo.Caption := 'Pedido:';
  CadastroPedido.Operacao          := 1;
  CadastroPedido.ID_Pedido         := 0;
  CadastroPedido.Parent            := pnlMaster;
  CadastroPedido.Align             := alClient;
  CadastroPedido.Show;
end;

procedure TfConsultarPedido.btnPesquisarClick(Sender: TObject);
var
  SearchOptions: TLocateOptions;
  LocateSuccess: Boolean;
begin
  grdItem.SetFocus;
  SearchOptions := [loPartialKey];
  qryCadastro.Locate('NM_Cliente', edtFiltro.Text, SearchOptions);
end;

procedure TfConsultarPedido.FormShow(Sender: TObject);
begin
  Atualizar();
end;

procedure TfConsultarPedido.grdItemDblClick(Sender: TObject);
begin
  btnEditarClick(Sender);
end;

end.
