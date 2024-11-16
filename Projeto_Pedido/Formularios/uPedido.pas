unit uPedido;

interface

uses
  FireDAC.Comp.Client, System.SysUtils,FireDAC.Phys.SQLiteWrapper;

type
  TPedido = class
    private
      FID_Pedido: Integer;
      FVL_Total: Double;
      FID_Cliente: Integer;

      procedure SetID_Pedido(const Value: Integer);
      procedure SetID_Cliente(const Value: Integer);
      procedure SetVL_Total(const Value: Double);
    public
      property ID_Pedido: Integer read FID_Pedido write SetID_Pedido;
      property ID_Cliente: Integer read FID_Cliente write SetID_Cliente;
      property VL_Total: Double  read FVL_Total write SetVL_Total;

      function UltimoID (): Int64;
      procedure Inserir();
      procedure Excluir();

  end;

type
  TPedidoItem = class
    private
      FVL_Total: Double;
      FID_Produto: Integer;
      FID_Pedido: Integer;
      FQT_Produto: Double;
      FVL_Unitario: Double;
      FID_PedidoItem: Integer;

      procedure SetID_Pedido(const Value: Integer);
      procedure SetID_PedidoItem(const Value: Integer);
      procedure SetID_Produto(const Value: Integer);
      procedure SetQT_Produto(const Value: Double);
      procedure SetVL_Total(const Value: Double);
      procedure SetVL_Unitario(const Value: Double);

    public
      property ID_PedidoItem: Integer  read FID_PedidoItem write SetID_PedidoItem;
      property ID_Pedido: Integer  read FID_Pedido write SetID_Pedido;
      property ID_Produto: Integer  read FID_Produto write SetID_Produto;
      property QT_Produto: Double read FQT_Produto write SetQT_Produto;
      property VL_Unitario: Double read FVL_Unitario write SetVL_Unitario;
      property VL_Total: Double read FVL_Total write SetVL_Total;

      procedure Inserir();
      procedure Alterar();
      procedure Excluir();
      procedure AtualizarValorPedido(Valor: Currency);

      function TotalPedido(): Currency;

  end;

implementation

uses
  uDMConexao;

{ TPedido }

procedure TPedido.Excluir;
var
  qryCadastro : TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('DELETE FROM PEDIDO          ');
      qryCadastro.SQL.Add('WHERE ID_Pedido = :ID_Pedido');

      qryCadastro.ParamByName('ID_Pedido').Value := FID_Pedido;
      qryCadastro.ExecSQL;
    except
      raise Exception.Create('Erro ao tentar excluir pedido.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;
end;

procedure TPedido.Inserir;
var
  qryCadastro : TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('INSERT INTO PEDIDO (ID_Cliente,VL_Total)');
      qryCadastro.SQL.Add('VALUES (:ID_Cliente,:VL_Total)');

      qryCadastro.ParamByName('ID_Cliente').Value := FID_Cliente;
      qryCadastro.ParamByName('VL_Total').Value   := FVL_Total;

      qryCadastro.ExecSQL;

      FID_Pedido := UltimoID;
    except
      raise Exception.Create('Erro ao tentar incluir um novo cliente.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;
end;

procedure TPedido.SetID_Cliente(const Value: Integer);
begin
  if (Value = 0) then
  begin
    raise Exception.Create('O campo Código do Cliente não está sendo informado.');
    exit
  end;

  FID_Cliente := Value;
end;

procedure TPedido.SetID_Pedido(const Value: Integer);
begin
  FID_Pedido := Value;
end;

procedure TPedido.SetVL_Total(const Value: Double);
begin
  FVL_Total := Value;
end;

function TPedido.UltimoID: Int64;
begin
  Result := Int64((TObject(fDMConexao.Conecta.CliObj) as TSQLiteDatabase).LastInsertRowid);
end;

{ TPedidoItem }

procedure TPedidoItem.Alterar;
var
  qryCadastro : TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('UPDATE PEDIDOITEM              ');
      qryCadastro.SQL.Add('SET ID_Produto  = :ID_Produto  ');
      qryCadastro.SQL.Add('   ,QT_Produto  = :QT_Produto  ');
      qryCadastro.SQL.Add('   ,VL_Unitario = :VL_Unitario ');
       qryCadastro.SQL.Add('  ,VL_Total    = :VL_Total    ');
      qryCadastro.SQL.Add('WHERE ID_PedidoItem = :ID_PedidoItem');

      qryCadastro.ParamByName('ID_PedidoItem').Value := FID_PedidoItem;
      qryCadastro.ParamByName('ID_Produto').Value    := FID_Produto;
      qryCadastro.ParamByName('QT_Produto').Value    := FQT_Produto;
      qryCadastro.ParamByName('VL_Unitario').Value   := FVL_Unitario;
      qryCadastro.ParamByName('VL_Total').Value      := FVL_Unitario * FQT_Produto;

      qryCadastro.ExecSQL;
    except
      raise Exception.Create('Erro ao tentar incluir um novo item do pedido.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;
end;

procedure TPedidoItem.Excluir;
var
  qryCadastro : TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('DELETE FROM PEDIDOITEM              ');
      qryCadastro.SQL.Add('WHERE ID_PedidoItem = :ID_PedidoItem');

      qryCadastro.ParamByName('ID_PedidoItem').Value   := FID_PedidoItem;
      qryCadastro.ExecSQL;
    except
      raise Exception.Create('Erro ao tentar excluir o item do pedido.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;
end;

procedure TPedidoItem.Inserir;
var
  qryCadastro : TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('INSERT INTO PEDIDOITEM (ID_Pedido,ID_Produto,QT_Produto,VL_Unitario,VL_Total)');
      qryCadastro.SQL.Add('VALUES (:ID_Pedido,:ID_Produto,:QT_Produto,:VL_Unitario,:VL_Total)');

      qryCadastro.ParamByName('ID_Pedido').Value   := FID_Pedido;
      qryCadastro.ParamByName('ID_Produto').Value  := FID_Produto;
      qryCadastro.ParamByName('QT_Produto').Value  := FQT_Produto;
      qryCadastro.ParamByName('VL_Unitario').Value := FVL_Unitario;
      qryCadastro.ParamByName('VL_Total').Value    := FVL_Unitario * FQT_Produto;

      qryCadastro.ExecSQL;
    except
      raise Exception.Create('Erro ao tentar incluir um novo item do pedido.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;
end;

procedure TPedidoItem.SetID_Pedido(const Value: Integer);
begin
  if (Value = 0) then
  begin
    raise Exception.Create('O campo código ID_Pedido não está sendo informado.');
    exit
  end;

  FID_Pedido := Value;
end;

procedure TPedidoItem.SetID_PedidoItem(const Value: Integer);
begin
//  if (Value = 0) then
//  begin
//    raise Exception.Create('O campo  ID_PedidoItem não está sendo informado.');
//    Exit;
//  end;

  FID_PedidoItem := Value;
end;

procedure TPedidoItem.SetID_Produto(const Value: Integer);
begin
  if (Value = 0) then
  begin
    raise Exception.Create('O campo Código do Produto não está sendo informado.');
    Exit;
  end;

  FID_Produto := Value;
end;

procedure TPedidoItem.SetQT_Produto(const Value: Double);
begin
  if (Value = 0) then
  begin
    raise Exception.Create('O campo Qtde do Produto não está sendo informado.');
    Exit;
  end;

  FQT_Produto := Value;
end;

procedure TPedidoItem.SetVL_Total(const Value: Double);
begin
  FVL_Total := Value;
end;

procedure TPedidoItem.SetVL_Unitario(const Value: Double);
begin
  if (Value = 0) then
  begin
    raise Exception.Create('O campo Valor Unitário não está sendo informado.');
    Exit;
  end;

  FVL_Unitario := Value;
end;

function TPedidoItem.TotalPedido(): Currency;
var
  qryCadastro : TFDQuery;
begin
  Result := 0.00;

  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('SELECT SUM(VL_Total) AS VL_Total_Pedido');
      qryCadastro.SQL.Add('FROM PEDIDOITEM                        ');
      qryCadastro.SQL.Add('WHERE ID_Pedido = :ID_Pedido           ');

      qryCadastro.ParamByName('ID_Pedido').Value := FID_Pedido;
      qryCadastro.Open;

      if (qryCadastro.RecordCount > 0) then
        Result := qryCadastro.FieldByName('VL_Total_Pedido').AsCurrency;
    except
      raise Exception.Create('Erro ao tentar calcular total do pedido.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;

end;

procedure TPedidoItem.AtualizarValorPedido(Valor: Currency);
var
  qryCadastro : TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('UPDATE PEDIDO               ');
      qryCadastro.SQL.Add('SET VL_Total = :VL_Total    ');
      qryCadastro.SQL.Add('WHERE ID_Pedido = :ID_Pedido');

      qryCadastro.ParamByName('ID_Pedido').Value := FID_Pedido;
      qryCadastro.ParamByName('VL_Total').Value  := Valor;

      qryCadastro.ExecSQL;
    except
      raise Exception.Create('Erro ao tentar excluir pedido.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;
end;


end.
