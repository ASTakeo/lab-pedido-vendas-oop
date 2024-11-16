unit uConsultarCliente;

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
  TfConsultarCliente = class(TForm)
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
    FLogin : TfLoginPDV;

  public
    { Public declarations }
  end;

var
  fConsultarCliente: TfConsultarCliente;

implementation

uses
  uDMConexao, uCliente, uCadastrarCliente;

{$R *.dfm}

procedure TfConsultarCliente.btnEditarClick(Sender: TObject);
var
  CadastroCliente : TfCadastrarCliente;
begin
  if (qryCadastro.RecordCount > 0) then
  begin
    CadastroCliente                   := TfCadastrarCliente.Create(nil);
    CadastroCliente.lblTitulo.Caption := 'Editar Cliente';
    CadastroCliente.Operacao          := 2;
    CadastroCliente.ID_Cliente        := qryCadastro.FieldByName('ID_Cliente').AsInteger;
    CadastroCliente.edtNome.Text      := qryCadastro.FieldByName('NM_Cliente').AsString;
    CadastroCliente.edtCidade.Text    := qryCadastro.FieldByName('NM_Cidade').AsString;
    CadastroCliente.edtUF.Text        := qryCadastro.FieldByName('NM_UF').AsString;
    CadastroCliente.Parent            := pnlMaster;
    CadastroCliente.Align             := alClient;
    CadastroCliente.Show;
  end;
end;

procedure TfConsultarCliente.btnExcluirClick(Sender: TObject);
var
  Cliente: TCliente;
begin
  if (qryCadastro.RecordCount > 0) then
  begin
    Cliente := TCliente.Create;

    try
      Cliente.ID_Cliente := qryCadastro.FieldByName('ID_Cliente').AsInteger;

      if (MessageBox(Handle, PChar('Deseja realmente excluir :' + #13 + #13 +
                                  qryCadastro.FieldByName('NM_Cliente').AsString),
                                 'Exclusão', MB_YESNO + MB_ICONINFORMATION + MB_DEFBUTTON2) = ID_YES) then
      begin
        Cliente.Excluir;
        ShowMessage('Registro excluído com sucesso.');
        qryCadastro.Refresh;
      end;
    finally
      FreeAndNil(Cliente);
    end;
  end;
end;

procedure TfConsultarCliente.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfConsultarCliente.btnInserirClick(Sender: TObject);
var
  CadastroCliente : TfCadastrarCliente;
begin
  CadastroCliente                   := TfCadastrarCliente.Create(nil);
  CadastroCliente.lblTitulo.Caption := 'Novo Cliente';
  CadastroCliente.Operacao          := 1;
  CadastroCliente.Parent            := pnlMaster;
  CadastroCliente.Align             := alClient;
  CadastroCliente.Show;
end;

procedure TfConsultarCliente.btnPesquisarClick(Sender: TObject);
var
  SearchOptions: TLocateOptions;
  LocateSuccess: Boolean;
begin
  grdItem.SetFocus;
  SearchOptions := [loPartialKey];
  qryCadastro.Locate('NM_Cliente', edtFiltro.Text, SearchOptions);
end;

procedure TfConsultarCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
  case key of
    VK_ESCAPE: ShowMessage('Tecla ESC pressionada');
    VK_F2    : ShowMessage('Tecla F2 pressionada');
    VK_F3    : ShowMessage('Tecla F3 pressionada');
    VK_F5    : ShowMessage('Tecla F5 pressionada');
  end;
end;

procedure TfConsultarCliente.FormShow(Sender: TObject);
begin
  try
    qryCadastro.Close;
    qryCadastro.Open;
  except
    raise Exception.Create('Erro ao tentar abrir tabela cliente.');
  end;
end;

procedure TfConsultarCliente.grdItemDblClick(Sender: TObject);
begin
  btnEditarClick(Sender);
end;

end.
