unit uCliente;

interface

uses
  FireDAC.Comp.Client, System.SysUtils;

type
  TCliente = class
    private
      FID_CLIENTE: Integer;
      FNM_Cliente: string;
      FNM_UF: string;
      FNM_Cidade: string;

      procedure SetID_CLIENTE(const Value: Integer);
      procedure SetNM_Cliente(const Value: string);
      procedure SetNM_UF(const Value: string);
      procedure SetNM_Cidade(const Value: string);

    public
      procedure Inserir();
      procedure Alterar();
      procedure Excluir();
      procedure Localizar();

      property ID_Cliente: Integer read FID_Cliente write SetID_Cliente;
      property NM_Cliente: string  read FNM_Cliente write SetNM_Cliente;
      property NM_Cidade: string  read FNM_Cidade write SetNM_Cidade;
      property NM_UF: string read FNM_UF write SetNM_UF;
  end;


implementation

uses
  uDMConexao;

{ TCliente }

procedure TCliente.Alterar;
var
  qryCadastro : TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('UPDATE CLIENTE');
      qryCadastro.SQL.Add('SET NM_Cliente = :NM_Cliente');
      qryCadastro.SQL.Add('   ,NM_Cidade  = :NM_Cidade');
      qryCadastro.SQL.Add('   ,NM_UF      = :NM_UF');
      qryCadastro.SQL.Add('WHERE ID_Cliente = :ID_Cliente');

      qryCadastro.ParamByName('ID_Cliente').Value := FID_CLIENTE;
      qryCadastro.ParamByName('NM_Cliente').Value := FNM_Cliente;
      qryCadastro.ParamByName('NM_Cidade').Value  := FNM_Cidade;
      qryCadastro.ParamByName('NM_UF').Value      := FNM_UF;

      qryCadastro.ExecSQL;
    except
      raise Exception.Create('Erro ao tentar alterar cliente.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;
end;

procedure TCliente.Excluir;
var
  qryCadastro : TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('DELETE FROM CLIENTE');
      qryCadastro.SQL.Add('WHERE ID_Cliente = :ID_Cliente');

      qryCadastro.ParamByName('ID_Cliente').Value := FID_CLIENTE;
      qryCadastro.ExecSQL;
    except
      raise Exception.Create('Erro ao tentar excluir um novo cliente.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;
end;

procedure TCliente.Inserir;
var
  qryCadastro : TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('INSERT INTO CLIENTE (NM_Cliente,NM_Cidade,NM_UF)');
      qryCadastro.SQL.Add('VALUES (:NM_Cliente,:NM_Cidade,:NM_UF)');

      qryCadastro.ParamByName('NM_Cliente').Value := FNM_Cliente;
      qryCadastro.ParamByName('NM_Cidade').Value  := FNM_Cidade;
      qryCadastro.ParamByName('NM_UF').Value      := FNM_UF;
      qryCadastro.ExecSQL;
    except
      raise Exception.Create('Erro ao tentar incluir um novo cliente.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;
end;

procedure TCliente.Localizar();
var
  qryCadastro : TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);

  try
    try
      qryCadastro.Connection := fDMConexao.Conecta;
      qryCadastro.SQL.Clear;

      qryCadastro.SQL.Add('SELECT ID_Cliente');
      qryCadastro.SQL.Add('      ,NM_Cliente');
      qryCadastro.SQL.Add('      ,NM_Cidade ');
      qryCadastro.SQL.Add('      ,NM_UF     ');
      qryCadastro.SQL.Add('FROM CLIENTE     ');
      qryCadastro.SQL.Add('WHERE ID_Cliente = :ID_Cliente');

      qryCadastro.ParamByName('ID_Cliente').Value := FID_CLIENTE;

      qryCadastro.Open;

      FNM_Cliente := qryCadastro.FieldByName('NM_Cliente').AsString;
      FNM_Cidade  := qryCadastro.FieldByName('NM_Cidade').AsString;
      FNM_UF      := qryCadastro.FieldByName('NM_UF').AsString;

    except
      raise Exception.Create('Erro ao tentar localizar cliente.');
    end;
  finally
    FreeAndNil(qryCadastro);
  end;
end;

procedure TCliente.SetID_CLIENTE(const Value: Integer);
begin
  FID_CLIENTE := Value;
end;

procedure TCliente.SetNM_Cidade(const Value: string);
begin
  if (Value = '') then
  begin
    raise Exception.Create('O campo Cidade não está sendo informado.');
    Exit;
  end;

  FNM_Cidade := Value;
end;

procedure TCliente.SetNM_Cliente(const Value: string);
begin
  if (Value = '') then
  begin
    raise Exception.Create('O campo Nome não está sendo informado.');
    Exit;
  end;

  FNM_Cliente := Value;
end;

procedure TCliente.SetNM_UF(const Value: string);
begin
    if (Value = '') then
  begin
    raise Exception.Create('O campo UF não está sendo informado.');
    Exit;
  end;

  FNM_UF := Value;
end;

end.

