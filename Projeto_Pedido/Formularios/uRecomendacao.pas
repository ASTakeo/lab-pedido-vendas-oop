unit uRecomendacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TfRecomendacao = class(TFrame)
    Panel2: TPanel;
    ListBox1: TListBox;
    pnlHeader: TPanel;
    pnlFechar: TPanel;
    btnFechar: TSpeedButton;
    Panel1: TPanel;
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfRecomendacao.btnFecharClick(Sender: TObject);
begin
  Self.Destroy;
end;

end.
