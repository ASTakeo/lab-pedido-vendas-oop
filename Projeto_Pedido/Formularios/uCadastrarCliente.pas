unit uCadastrarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.Imaging.pngimage;

type
  TfCadastrarCliente = class(TForm)
    pnlMaster: TPanel;
    lblTitulo: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    pnlSalvar: TPanel;
    btnSalvar: TSpeedButton;
    edtCidade: TEdit;
    edtUF: TEdit;
    edtNome: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Operacao: Integer;      // 1. Inclusao - 2. Alteração
    ID_Cliente: Integer;
  end;

var
  fCadastrarCliente: TfCadastrarCliente;

implementation

uses
  uCliente;

{$R *.dfm}

procedure TfCadastrarCliente.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfCadastrarCliente.btnSalvarClick(Sender: TObject);
var
  Cliente: TCliente;
begin
  Cliente := TCliente.Create;

  try
    Cliente.ID_Cliente := ID_Cliente;
    Cliente.NM_Cliente := UpperCase(edtNome.Text);
    Cliente.NM_Cidade  := UpperCase(edtCidade.Text);
    Cliente.NM_UF      := UpperCase(edtUF.Text);

    case Operacao of
      1:  begin
            Cliente.Inserir;
          end;
      2:  begin
            Cliente.Alterar;
          end;
    end;

    ShowMessage('Registro incluído/alterado com sucesso.');
    btnCancelarClick(Self);
  finally
    FreeAndNil(Cliente);
  end;
end;

procedure TfCadastrarCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Self.Destroy;
end;

procedure TfCadastrarCliente.FormShow(Sender: TObject);
begin
  if (edtNome.CanFocus) then
    edtNome.SetFocus;
end;

end.
