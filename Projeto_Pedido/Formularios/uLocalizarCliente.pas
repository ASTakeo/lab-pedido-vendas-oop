unit uLocalizarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfLocalizarCliente = class(TForm)
    pnlGrid: TPanel;
    pnlHeader: TPanel;
    lblTitulo: TLabel;
    grdLocalizar: TDBGrid;
    qryLocalizar: TFDQuery;
    dsLocalizar: TDataSource;
    qryLocalizarID_Cliente: TFDAutoIncField;
    qryLocalizarNM_Cliente: TStringField;
    pnlConsulta: TPanel;
    pnlFiltro: TPanel;
    shpFiltro: TShape;
    edtFiltro: TEdit;
    pnlPesquisar: TPanel;
    shpPesquisar: TShape;
    btnPesquisar: TSpeedButton;
    pnlFechar: TPanel;
    shpFechar: TShape;
    btnFechar: TSpeedButton;

    procedure btnPesquisarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);

    procedure Atualizar();
    procedure grdLocalizarDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    ID_Cliente: Integer;
    NM_Cliente: string;
  end;

var
  fLocalizarCliente: TfLocalizarCliente;

implementation

uses
  uDMConexao;

{$R *.dfm}

procedure TfLocalizarCliente.Atualizar;
begin
  try
    qryLocalizar.Close;
    qryLocalizar.Open;
  except
    raise Exception.Create('Erro ao tentar abrir tabela cliente.');
  end;
end;

procedure TfLocalizarCliente.btnFecharClick(Sender: TObject);
begin
  ID_Cliente := qryLocalizar.FieldByName('ID_Cliente').AsInteger;
  NM_Cliente := qryLocalizar.FieldByName('NM_Cliente').AsString;

  fLocalizarCliente.Close;
end;

procedure TfLocalizarCliente.btnPesquisarClick(Sender: TObject);
var
  SearchOptions: TLocateOptions;
  LocateSuccess: Boolean;
begin
  grdLocalizar.SetFocus;
  SearchOptions := [loPartialKey];
  qryLocalizar.Locate('NM_Cliente', edtFiltro.Text, SearchOptions);
end;

procedure TfLocalizarCliente.FormShow(Sender: TObject);
begin
  Atualizar();

  if (edtFiltro.CanFocus) then
    edtFiltro.SetFocus;
end;

procedure TfLocalizarCliente.grdLocalizarDblClick(Sender: TObject);
begin
  btnFecharClick(Self);
end;

end.
