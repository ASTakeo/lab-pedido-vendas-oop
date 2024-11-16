/*

DROP TABLE CLIENTE;
DROP TABLE PRODUTO;
DROP TABLE PEDIDO
DROP TABLE PEDIDOITEM

*/


--// 02. A classe que representa a tabela de cliente deve ter(código, nome, cidade, uf).
CREATE TABLE IF NOT EXISTS CLIENTE (ID_Cliente                Integer       PRIMARY KEY AUTOINCREMENT
                                   ,NM_Cliente                Varchar(80)   Not null
                                   ,NM_Cidade                 Varchar(50)   Not null
                                   ,NM_UF                     Char(2)       Not null);

INSERT INTO CLIENTE (NM_Cliente,NM_Cidade,NM_UF) VALUES ('GRACILIANO RAMOS','ALAGOAS','AL');
INSERT INTO CLIENTE (NM_Cliente,NM_Cidade,NM_UF) VALUES ('ARIANO SUASSUNA','JOÃO PESSOA','PB');
INSERT INTO CLIENTE (NM_Cliente,NM_Cidade,NM_UF) VALUES ('JORGE AMADO','SALVADOR','BA');
INSERT INTO CLIENTE (NM_Cliente,NM_Cidade,NM_UF) VALUES ('CAROLINA MARIA DE JESUS','SACRAMENTO','MG');
INSERT INTO CLIENTE (NM_Cliente,NM_Cidade,NM_UF) VALUES ('CARLOS DRUMMOND DE ANDRADE','ITABIRA','MG');


--// 03. A classe que representa a tabela de produtos deve ter(código, descrição, preço de venda).
CREATE TABLE IF NOT EXISTS PRODUTO (ID_Produto                Integer       PRIMARY KEY AUTOINCREMENT
                                   ,NM_Produto                Varchar(80)   Not null
                                   ,VL_Unitario               Decimal(10,2) Not null);

INSERT INTO PRODUTO (NM_Produto,VL_Unitario) VALUES ('COMPUTADOR GAMER',3000.00); 
INSERT INTO PRODUTO (NM_Produto,VL_Unitario) VALUES ('NOTEBOOK ASUS I7',4500.00);
INSERT INTO PRODUTO (NM_Produto,VL_Unitario) VALUES ('MONITOR DELL 20POL',800.00);
INSERT INTO PRODUTO (NM_Produto,VL_Unitario) VALUES ('TECLADO MICROSOFT S/FIO',150.00);
INSERT INTO PRODUTO (NM_Produto,VL_Unitario) VALUES ('MOUSE MICROSOFT S/FIO',100.00);



--// 11. A classe que representa a tabela de pedidos deve possuir (Número do Pedido, Data de Emissão, Código do Cliente, Valor Total).
CREATE TABLE IF NOT EXISTS PEDIDO (ID_Pedido                 Integer       PRIMARY KEY AUTOINCREMENT
                                  ,ID_Cliente                Integer       Not null
                                  ,DT_Pedido                 Date          DEFAULT (date('now','localtime'))
                                  ,VL_Total                  Decimal(10,2) Not null
    ,FOREIGN KEY(ID_Cliente) REFERENCES CLIENTE(ID_Cliente));


--// 12. A classe que representa a tabela de itens do pedido deve possuir (incremento automático, número do pedido, código do produto, quantidade, valor unitário, valor total).
CREATE TABLE IF NOT EXISTS PEDIDOITEM (ID_PedidoItem         Integer       PRIMARY KEY AUTOINCREMENT
                                      ,ID_Pedido             Integer       Not null
                                      ,ID_Produto            Integer       Not null
                                      ,QT_Produto            Decimal(8,3)  Not null
                                      ,VL_Unitario           Decimal(10,2) Not null
                                      ,VL_Total              Decimal(10,2) Not null
    ,FOREIGN KEY(ID_Pedido) REFERENCES PEDIDO(ID_Pedido)
    ,FOREIGN KEY(ID_Produto) REFERENCES PRODUTO(ID_Produto));  

