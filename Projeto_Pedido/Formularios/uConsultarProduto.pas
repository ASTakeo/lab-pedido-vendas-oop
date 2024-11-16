unit uConsultarProduto;

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
  TfConsultarProduto = class(TForm)
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
    qryCadastroID_Produto: TFDAutoIncField;
    qryCadastroNM_Produto: TStringField;
    qryCadastroVL_Unitario: TBCDField;

    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure grdItemDblClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    ID_Last: Integer;

    procedure Atualizar();
  end;

var
  fConsultarProduto: TfConsultarProduto;

implementation

uses
  uDMConexao, uProduto, uCadastrarProduto;

{$R *.dfm}

procedure TfConsultarProduto.Atualizar;
begin
  try
    qryCadastro.Close;
    qryCadastro.Open;
  except
    raise Exception.Create('Erro ao tentar abrir tabela produto.');
  end;
end;

procedure TfConsultarProduto.btnEditarClick(Sender: TObject);
var
  CadastrarProduto : TfCadastrarProduto;
begin
  if (qryCadastro.RecordCount > 0) then
  begin
    CadastrarProduto                        := TfCadastrarProduto.Create(nil);
    CadastrarProduto.lblTitulo.Caption      := 'Editar Produto';
    CadastrarProduto.Operacao               := 2;
    CadastrarProduto.ID_Produto             := qryCadastro.FieldByName('ID_Produto').AsInteger;
    CadastrarProduto.edtDescricao.Text      := qryCadastro.FieldByName('NM_Produto').AsString;
    CadastrarProduto.edtValorUnitario.Text  := qryCadastro.FieldByName('VL_Unitario').AsString;
    CadastrarProduto.Parent                 := pnlMaster;
    CadastrarProduto.Align                  := alClient;
    CadastrarProduto.Show;
  end;
end;

procedure TfConsultarProduto.btnExcluirClick(Sender: TObject);
var
  Produto: TProduto;
begin
  if (qryCadastro.RecordCount > 0) then
  begin
    Produto := TProduto.Create;

    try
      Produto.ID_Produto := qryCadastro.FieldByName('ID_Produto').AsInteger;

      if (MessageBox(Handle, PChar('Deseja realmente excluir o produto :' + #13 + #13 +
                                  qryCadastro.FieldByName('NM_Produto').AsString),
                                 'Exclusão', MB_YESNO + MB_ICONINFORMATION + MB_DEFBUTTON2) = ID_YES) then
      begin
        Produto.Excluir;
        ShowMessage('Produto excluído com sucesso.');
        Atualizar();
      end;
    finally
      FreeAndNil(Produto);
    end;
  end;
end;

procedure TfConsultarProduto.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfConsultarProduto.btnInserirClick(Sender: TObject);
var
  CadastrarProduto : TfCadastrarProduto;
begin
  CadastrarProduto                   := TfCadastrarProduto.Create(nil);
  CadastrarProduto.lblTitulo.Caption := 'Novo Produto';
  CadastrarProduto.Operacao          := 1;
  CadastrarProduto.Parent            := pnlMaster;
  CadastrarProduto.Align             := alClient;
  CadastrarProduto.Show;
end;

procedure TfConsultarProduto.btnPesquisarClick(Sender: TObject);
var
  SearchOptions: TLocateOptions;
  LocateSuccess: Boolean;
begin
  grdItem.SetFocus;
  SearchOptions := [loPartialKey];
  qryCadastro.Locate('NM_Produto', edtFiltro.Text, SearchOptions);
end;

procedure TfConsultarProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
//  case key of
//    VK_ESCAPE: ShowMessage('Tecla ESC pressionada');
//    VK_F2    : ShowMessage('Tecla F2 pressionada');
//    VK_F3    : ShowMessage('Tecla F3 pressionada');
//    VK_F5    : ShowMessage('Tecla F5 pressionada');
//  end;
end;

procedure TfConsultarProduto.FormShow(Sender: TObject);
begin
  Atualizar();
end;

procedure TfConsultarProduto.grdItemDblClick(Sender: TObject);
begin
  btnEditarClick(Sender);
end;

end.
