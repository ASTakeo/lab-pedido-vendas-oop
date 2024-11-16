unit uLocalizarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfLocalizarProduto = class(TForm)
    pnlGrid: TPanel;
    pnlHeader: TPanel;
    lblTitulo: TLabel;
    grdLocalizar: TDBGrid;
    qryLocalizar: TFDQuery;
    dsLocalizar: TDataSource;
    qryLocalizarID_Produto: TFDAutoIncField;
    qryLocalizarNM_Produto: TStringField;
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
    qryLocalizarVL_Unitario: TBCDField;

    procedure btnPesquisarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);

    procedure Atualizar();
    procedure grdLocalizarDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    ID_Produto: Integer;
    NM_Produto: string;
    VL_Unitario: Currency;
  end;

var
  fLocalizarProduto: TfLocalizarProduto;

implementation

uses
  uDMConexao;

{$R *.dfm}

procedure TfLocalizarProduto.Atualizar;
begin
  try
    qryLocalizar.Close;
    qryLocalizar.Open;
  except
    raise Exception.Create('Erro ao tentar abrir tabela cliente.');
  end;
end;

procedure TfLocalizarProduto.btnFecharClick(Sender: TObject);
begin
  ID_Produto  := qryLocalizar.FieldByName('ID_Produto').AsInteger;
  NM_Produto  := qryLocalizar.FieldByName('NM_Produto').AsString;
  VL_Unitario := qryLocalizar.FieldByName('VL_Unitario').AsCurrency;

  fLocalizarProduto.Close;
end;

procedure TfLocalizarProduto.btnPesquisarClick(Sender: TObject);
var
  SearchOptions: TLocateOptions;
  LocateSuccess: Boolean;
begin
  grdLocalizar.SetFocus;
  SearchOptions := [loPartialKey];
  qryLocalizar.Locate('NM_Produto', edtFiltro.Text, SearchOptions);
end;

procedure TfLocalizarProduto.FormShow(Sender: TObject);
begin
  Atualizar();

  if (edtFiltro.CanFocus) then
    edtFiltro.SetFocus;
end;

procedure TfLocalizarProduto.grdLocalizarDblClick(Sender: TObject);
begin
  btnFecharClick(Self);
end;

end.
