unit uDMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client;

type
  TfDMConexao = class(TDataModule)
    Conecta: TFDConnection;
    procedure ConectaBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure Conexao(Connection: TFDConnection);
  end;

var
  fDMConexao: TfDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TfDMConexao }

procedure TfDMConexao.ConectaBeforeConnect(Sender: TObject);
begin
  Conexao(Conecta);
end;

procedure TfDMConexao.Conexao(Connection: TFDConnection);
var
  Local: string;
begin
  Local := 'C:\Users\t_asugahara\Takeo\SISHOSP\lab-pedido-vendas-oop\Projeto_Pedido\DB\DB.db';

  if FileExists(Local) then
  begin
    Connection.DriverName := 'SQLite';

    Connection.Params.Clear;

    Connection.Params.Add('DriverID=SQLite');
    Connection.Params.Add('Database=' + Local);
    Connection.Params.Add('User_Name=');
    Connection.Params.Add('Password=');
    Connection.Params.Add('Port=');
    Connection.Params.Add('Server=');
    Connection.Params.Add('Protocol=');
    Connection.Params.Add('LockingMode=Normal');
  end
  else
  begin
    raise Exception.Create('Banco de dados não localizado.');
  end;
end;

end.
