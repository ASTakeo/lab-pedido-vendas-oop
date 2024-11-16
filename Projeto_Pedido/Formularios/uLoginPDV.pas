unit uLoginPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TfLoginPDV = class(TForm)
    pnlPrincipal: TPanel;
    pnlCentral: TPanel;
    pnlAcesso: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnAcessar: TButton;
    pnlLogomarca: TPanel;
    imgLogomarca: TImage;
    procedure btnAcessarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  fLoginPDV: TfLoginPDV;

implementation

{$R *.dfm}

procedure TfLoginPDV.btnAcessarClick(Sender: TObject);
begin
  if not ((edtUsuario.Text = 'PDV') AND
          (edtSenha.Text = '1234')) then
  begin
    ShowMessage('Usuário/Senha Inválido!');
    Exit
  end;

  Close;
end;

end.
