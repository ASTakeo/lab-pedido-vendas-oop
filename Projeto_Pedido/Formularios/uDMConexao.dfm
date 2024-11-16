object fDMConexao: TfDMConexao
  Height = 480
  Width = 640
  object Conecta: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      
        'Database=C:\Users\t_asugahara\Takeo\SISHOSP\lab-pedido-vendas-oo' +
        'p\Projeto_Pedido\DB\DB.db'
      'LockingMode=Normal')
    LoginPrompt = False
    BeforeConnect = ConectaBeforeConnect
    Left = 32
    Top = 24
  end
end
