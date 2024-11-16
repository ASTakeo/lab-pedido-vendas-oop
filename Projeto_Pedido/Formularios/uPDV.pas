unit uPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.Imaging.pngimage,uLoginPDV, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXCtrls;

type
  TfPDV = class(TForm)
    pnlPrincipal: TPanel;
    pnlHeader: TPanel;
    pnlButton: TPanel;
    pnlFechar: TPanel;
    shpFechar: TShape;
    btnFechar: TSpeedButton;
    pnlOpcoes: TPanel;
    shpOpcoes: TShape;
    btnOpcoes: TSpeedButton;
    pnlCancelarVenda: TPanel;
    shpCancelarVenda: TShape;
    btnCancelarVenda: TSpeedButton;
    pnlAbrirCaixa: TPanel;
    shpAbrirCaixa: TShape;
    btnAbrirCaixa: TSpeedButton;
    pnlConsultarPreco: TPanel;
    shpConsultarPreco: TShape;
    btnConsultarPreco: TSpeedButton;
    pnlCancelarOperacao: TPanel;
    shpCancelarOperacao: TShape;
    btnCancelarOperacao: TSpeedButton;
    pnlTotais: TPanel;
    pnlTotalCompra: TPanel;
    shpTotalCompra: TShape;
    pnlProduto: TPanel;
    shpProduto: TShape;
    pnlPreco: TPanel;
    shpPreco: TShape;
    pnlQtde: TPanel;
    shpQtde: TShape;
    pnlSubTotal: TPanel;
    shpSubTotal: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Image1: TImage;
    pnlMaster: TPanel;
    grdItem: TDBGrid;
    spwOpcao: TSplitView;
    Panel1: TPanel;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    pnlPagar: TPanel;
    shpPagar: TShape;
    btnPagar: TSpeedButton;
    Panel3: TPanel;
    Shape3: TShape;
    SpeedButton3: TSpeedButton;
    Panel4: TPanel;
    Shape4: TShape;
    SpeedButton4: TSpeedButton;
    pnlConsultarCliente: TPanel;
    shpConsultarCliente: TShape;
    btnConsultarCliente: TSpeedButton;
    Panel6: TPanel;
    Shape6: TShape;
    SpeedButton6: TSpeedButton;
    pnlGridItem: TPanel;
    spwPagamento: TSplitView;
    pnlPagamento: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnOpcoesClick(Sender: TObject);
    procedure btnConsultarClienteClick(Sender: TObject);
  private
    { Private declarations }
    FLogin : TfLoginPDV;

    procedure SplitView (Value: TSplitView);

  public
    { Public declarations }
  end;

var
  fPDV: TfPDV;

implementation

uses
  uPagamento, uConsultarCliente;


{$R *.dfm}

procedure TfPDV.btnOpcoesClick(Sender: TObject);
begin
  SplitView(spwOpcao);
end;

procedure TfPDV.btnConsultarClienteClick(Sender: TObject);
var
  ConsultarCliente: TfConsultarCliente;
begin
  ConsultarCliente        := TfConsultarCliente.Create(nil);
  ConsultarCliente.Parent := pnlMaster;
  ConsultarCliente.Align  := alClient;
  ConsultarCliente.Show;
end;

procedure TfPDV.btnFecharClick(Sender: TObject);
begin
  fPDV.Close;
end;

procedure TfPDV.btnPagarClick(Sender: TObject);
var
  Pagamento : TfPagamento;
begin
  Pagamento        := TfPagamento.Create(nil);
  Pagamento.Parent := pnlPagamento;
  //Pagamento.Align  := alClient;
  Pagamento.Show;
  SplitView(spwPagamento);
end;

procedure TfPDV.Button1Click(Sender: TObject);
begin
  pnlMaster.visible := False;
end;

procedure TfPDV.FormCreate(Sender: TObject);
begin
  FLogin := TfLoginPDV.Create(nil);
  FLogin.Parent := pnlmaster;
  FLogin.show;
end;

procedure TfPDV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Pagamento : TfPagamento;
  begin
  case key of
    VK_ESCAPE: ShowMessage('Tecla ESC pressionada');
    VK_F2    : ShowMessage('Tecla F2 pressionada');
    VK_F3    : ShowMessage('Tecla F3 pressionada');
    VK_F5    : ShowMessage('Tecla F5 pressionada');
    VK_F4    : btnFecharClick(Sender);
    VK_F12   : btnOpcoesClick(Sender);
    VK_F7    : btnPagarClick(Sender);
  end;
end;

procedure TfPDV.FormShow(Sender: TObject);
begin
  //
end;

procedure TfPDV.SplitView(Value: TSplitView);
begin
  Value.Opened := not(Value.Opened);
end;

end.



//--Application.CreateForm(TfLoginPDV, fLoginPDV);
