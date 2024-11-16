unit uProduto;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, FireDAC.Phys.SQLiteWrapper;

type
  TProduto = class
    private
      FID_Produto: Integer;
      FNM_Produto: string;
      FVL_Unitario: Currency;

      procedure SetFID_Produto(const Value: Integer);
      procedure SetNM_Produto(const Value: string);
      procedure SetVL_Unitario(const Value: Currency);

    public
      procedure Inserir();
      procedure Alterar();
      procedure Excluir();
      procedure Localizar();

      function UltimoID (): Int64;

      property ID_Produto: Integer read FID_Produto write FID_Produto;
      property NM_Produto: string  read FNM_Produto write SetNM_Produto;
      property VL_Unitario: Currency read FVL_Unitario write SetVL_Unitario;
  end;

implementation

uses
  uDMConexao;

{ TCliente }

procedure TProduto.Alterar;
var
  qryCadastro : TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('UPDATE PRODUTO');
      qryCadastro.SQL.Add('SET NM_Produto  = :NM_Produto');
      qryCadastro.SQL.Add('   ,VL_Unitario = :VL_Unitario');
      qryCadastro.SQL.Add('WHERE ID_Produto = :ID_Produto');

      qryCadastro.ParamByName('ID_Produto').Value  := FID_Produto;
      qryCadastro.ParamByName('NM_Produto').Value  := FNM_Produto;
      qryCadastro.ParamByName('VL_Unitario').Value := FVL_Unitario;

      qryCadastro.ExecSQL;
    except
      raise Exception.Create('Erro ao tentar alterar produto.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;
end;

procedure TProduto.Excluir;
var
  qryCadastro : TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('DELETE FROM PRODUTO');
      qryCadastro.SQL.Add('WHERE ID_Produto = :ID_Produto');

      qryCadastro.ParamByName('ID_Produto').Value := FID_Produto;
      qryCadastro.ExecSQL;
    except
      raise Exception.Create('Erro ao tentar excluir um novo produto.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;
end;

procedure TProduto.Inserir;
var
  qryCadastro : TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('INSERT INTO PRODUTO (NM_Produto,VL_Unitario)');
      qryCadastro.SQL.Add('VALUES (:NM_Produto,:VL_Unitario);');

      qryCadastro.ParamByName('NM_Produto').Value  := FNM_Produto;
      qryCadastro.ParamByName('VL_Unitario').Value := FVL_Unitario;
      qryCadastro.ExecSQL;
    except
      raise Exception.Create('Erro ao tentar incluir um novo cliente.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;
end;

procedure TProduto.Localizar;
var
  qryCadastro : TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('SELECT ID_Produto ');
      qryCadastro.SQL.Add('      ,NM_Produto ');
      qryCadastro.SQL.Add('      ,VL_Unitario');
      qryCadastro.SQL.Add('FROM PRODUTO      ');
      qryCadastro.SQL.Add('WHERE ID_Produto = :ID_Produto');

      qryCadastro.ParamByName('ID_Produto').Value := FID_Produto;
      qryCadastro.Open;

      FNM_Produto  := qryCadastro.FieldByName('NM_Produto').AsString;
      FVL_Unitario := qryCadastro.FieldByName('VL_Unitario').AsCurrency;
    except
      raise Exception.Create('Erro ao tentar localizar produto.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;
end;

procedure TProduto.SetFID_Produto(const Value: Integer);
begin
  FID_Produto := Value;
end;

procedure TProduto.SetNM_Produto(const Value: string);
begin
  if (Value = '') then
  begin
    raise Exception.Create('O campo Nome do Produto não está sendo informado.');
    Exit;
  end;

  FNM_Produto := Value;
end;

procedure TProduto.SetVL_Unitario(const Value: Currency);
begin
  if (Value = 0) then
  begin
    raise Exception.Create('O campo Valor Unitário do Produto não está sendo informado.');
    Exit;
  end;

  FVL_Unitario := Value;
end;

function TProduto.UltimoID(): Int64;
begin
  Result := Int64((TObject(fDMConexao.Conecta.CliObj) as TSQLiteDatabase).LastInsertRowid);
end;

end.

