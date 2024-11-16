unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.CategoryButtons,
  Vcl.WinXCtrls, System.Actions, Vcl.ActnList, System.Notification, System.Generics.Collections;

type
  TfPrincipal = class(TForm)
    Panel1: TPanel;
    imgUsuario: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    spwPrincipal: TSplitView;
    CategoryButtons1: TCategoryButtons;
    ActionList1: TActionList;
    actInicio: TAction;
    actVenda: TAction;
    actCadastro: TAction;
    actPerfil: TAction;
    actConfigurar: TAction;
    Image1: TImage;
    CategoryButtons2: TCategoryButtons;
    actFechar: TAction;
    actNotificacao: TAction;
    Notification: TNotificationCenter;
    spwCadastros: TSplitView;
    CategoryButtons3: TCategoryButtons;
    pnlContainer: TPanel;
    spwVenda: TSplitView;
    CategoryButtons4: TCategoryButtons;
    procedure Image1Click(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actNotificacaoExecute(Sender: TObject);
    procedure actCadastroExecute(Sender: TObject);
    procedure CategoryButtons3Categories0Items0Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CategoryButtons3Categories0Items1Click(Sender: TObject);
    procedure CategoryButtons4Categories0Items1Click(Sender: TObject);
    procedure actVendaExecute(Sender: TObject);
    procedure CategoryButtons4Categories0Items0Click(Sender: TObject);

    procedure Conexao();
    procedure HabilitarMenu(Menu: TSplitView);
    procedure CategoryButtons1Categories0Items3Click(Sender: TObject);
  private
    { Private declarations }
    ListNun : TList<Integer>;
  public
    { Public declarations }
    pNotify : Boolean;
    MenuAtivo: TSplitView;

  end;

var
  fPrincipal: TfPrincipal;

implementation

uses
  uPDV, uConsultarCliente, uDMConexao, uConsultarProduto, uConsultarPedido, uRecomendacao;

{$R *.dfm}

procedure TfPrincipal.CategoryButtons1Categories0Items3Click(
  Sender: TObject);
var
  Recomendacao: TfRecomendacao;
begin
  Recomendacao        := TfRecomendacao.Create(nil);
  Recomendacao.Parent := pnlContainer;
  Recomendacao.Align  := alClient;
  Recomendacao.Show;
end;

procedure TfPrincipal.CategoryButtons3Categories0Items0Click(
  Sender: TObject);
var
  ConsultarCliente: TfConsultarCliente;
begin
  ConsultarCliente        := TfConsultarCliente.Create(nil);
  ConsultarCliente.Parent := pnlContainer;
  ConsultarCliente.Align  := alClient;
  ConsultarCliente.Show;
end;

procedure TfPrincipal.CategoryButtons3Categories0Items1Click(
  Sender: TObject);
var
  ConsultarProduto: TfConsultarProduto;
begin
  ConsultarProduto        := TfConsultarProduto.Create(nil);
  ConsultarProduto.Parent := pnlContainer;
  ConsultarProduto.Align  := alClient;
  ConsultarProduto.Show;
end;

procedure TfPrincipal.CategoryButtons4Categories0Items0Click(
  Sender: TObject);
var
  ConsultarPedido: TfConsultarPedido;
begin
  ConsultarPedido        := TfConsultarPedido.Create(nil);
  ConsultarPedido.Parent := pnlContainer;
  ConsultarPedido.Align  := alClient;
  ConsultarPedido.Show;
end;

procedure TfPrincipal.CategoryButtons4Categories0Items1Click(
  Sender: TObject);
begin
  Application.CreateForm(TfPDV, fPDV);

  try
    fPDV.ShowModal;
  finally
    fPDV.Free;
  end;
end;

procedure TfPrincipal.Conexao;
begin
  try
    fDMConexao.Conecta.Connected := True;
  except
    ShowMessage('Erro ao conectar com o banco de dados')
  end;
end;

procedure TfPrincipal.FormShow(Sender: TObject);
begin
  Conexao;
end;

procedure TfPrincipal.HabilitarMenu(Menu: TSplitView);
var
  I: Integer;
begin
  for I := 0 to fPrincipal.ControlCount - 1 do
  begin
    if (fPrincipal.Controls[I] is TSplitView) then
    begin
      if (fPrincipal.Controls[I].Name <> Menu.Name) then
      begin
        TSplitView(fPrincipal.Controls[I]).Close;
      end
      else
      begin
        TSplitView(fPrincipal.Controls[I]).Open;
      end;
    end;
  end;
end;


procedure TfPrincipal.actCadastroExecute(Sender: TObject);
begin
  HabilitarMenu(spwCadastros);
end;

procedure TfPrincipal.actFecharExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfPrincipal.actNotificacaoExecute(Sender: TObject);
var
  Notify: TNotification;
begin
  // Notification.CancelNotification('Projeto Pedido');  //-- Nome da Notificação - Cancelar

  Notify  := Notification.CreateNotification;
  pNotify := False;

  try
    try
      Notify.Name      := 'Projeto Pedido';                  //-- Nome da Notificação
      Notify.Title     := 'Projeto Pedido';                  //-- Título
      Notify.AlertBody := 'Notificação: Mensagem de Teste';  //-- Conteúdo da Mensagem
      Notification.PresentNotification(Notify);              //-- Execução
      pNotify          := True
    finally
      Notify.Free;
    end;
  except
    pNotify := False;
  end;
end;

procedure TfPrincipal.actVendaExecute(Sender: TObject);
begin
  HabilitarMenu(spwVenda);
end;

procedure TfPrincipal.Image1Click(Sender: TObject);
begin
  HabilitarMenu(spwPrincipal);
end;

end.


//-- https://icons8.com/icons
