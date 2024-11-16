unit uCadastrarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.Imaging.pngimage,
  Vcl.NumberBox;

type
  TfCadastrarProduto = class(TForm)
    pnlMaster: TPanel;
    lblTitulo: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    pnlSalvar: TPanel;
    btnSalvar: TSpeedButton;
    edtDescricao: TEdit;
    edtValorUnitario: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Operacao: Integer;      // 1. Inclusao - 2. Alteração
    ID_Produto: Integer;
  end;

var
  fCadastrarProduto: TfCadastrarProduto;

implementation

uses
  uProduto, uConsultarProduto;

{$R *.dfm}

procedure TfCadastrarProduto.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfCadastrarProduto.btnSalvarClick(Sender: TObject);
var
  Produto: TProduto;
  UltimoID: Integer;
begin
  Produto := TProduto.Create;

  try
    Produto.ID_Produto  := ID_Produto;
    Produto.NM_Produto  := UpperCase(edtDescricao.Text);
    Produto.VL_Unitario := StrToCurr(edtValorUnitario.Text);

    case Operacao of
      1:  begin
            Produto.Inserir;
            UltimoID := Produto.UltimoID();
          end;
      2:  begin
            Produto.Alterar;
          end;
    end;

    ShowMessage('Produto incluído/alterado com sucesso.');

    //fConsultarProduto.qryCadastro.Refresh;
    btnCancelarClick(Self);
  finally
    FreeAndNil(Produto);
  end;
end;

procedure TfCadastrarProduto.edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in [#8, '0'..'9', ',']) then
  begin
     ShowMessage('Valor inválido: ' + Key);
     Key := #0;
  end
  else
  if (Key = ',') and (Pos(Key, edtValorUnitario.Text) > 0) then
  begin
    ShowMessage('Valor inválido: ' + Key);
    Key := #0;
  end;
end;

procedure TfCadastrarProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Self.Destroy;
end;

procedure TfCadastrarProduto.FormShow(Sender: TObject);
begin
  if (edtDescricao.CanFocus) then
    edtDescricao.SetFocus;
end;

end.
