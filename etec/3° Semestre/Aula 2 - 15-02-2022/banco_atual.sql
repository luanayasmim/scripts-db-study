/* Criação do banco de dados de vendas DDL - 08/02/2022 */
CREATE DATABASE bd_vendas;
/*Habilitando o uso do banco*/
USE bd_vendas;


/*Criação da tabela de produtos*/
CREATE TABLE tbl_produto(
	cod_produto INT UNSIGNED AUTO_INCREMENT,
	nome_produto VARCHAR(100) NOT NULL,
	desc_produto VARCHAR(100) NOT NULL,
	unid_medida VARCHAR(2) NOT NULL,
	estoque_atual INT DEFAULT 0,
	estoque_min INT DEFAULT 0,
	estoque_max INT DEFAULT 0,
	valor DECIMAL(10,2) NOT NULL,

	PRIMARY KEY (cod_produto)
);

/*Criação da tabela de endereço*/
CREATE TABLE tbl_endereco(
	id INT(10) NOT NULL,
	cep INT(9) NOT NULL,
	logradouro VARCHAR(90) NOT NULL,
	bairro VARCHAR(50) NOT NULL,
	cidade VARCHAR(50) NOT NULL,
	estado CHAR(2) NOT NULL,

	CONSTRAINT pk_endereco PRIMARY KEY(cep)
);

/* Criação da tabela de clientes */
CREATE TABLE tbl_cliente(
	cod_cliente INT UNSIGNED AUTO_INCREMENT,
	nome_cliente VARCHAR(45) NOT NULL,
	cpf VARCHAR(11) DEFAULT '',
	data_nascimento DATE,
	cep INT(9) DEFAULT 0,
	numero VARCHAR(10) DEFAULT '',
	complemento VARCHAR(20) DEFAULT '',

	PRIMARY KEY (cod_cliente),
	CONSTRAINT FOREIGN KEY fk_cliencep (cep) REFERENCES tbl_endereco(cep)
);

/* Criação da tabela de pedidos */
CREATE TABLE tbl_pedido(
	cod_pedido INT UNSIGNED AUTO_INCREMENT,
	data_pedido DATE,
	data_entrega DATE,
	cod_cliente INT UNSIGNED NOT NULL,
	
	PRIMARY KEY (cod_pedido),
	CONSTRAINT fk_cliente FOREIGN KEY (cod_cliente) REFERENCES tbl_cliente(cod_cliente)
);

/* Criação da tabela de itens do pedido */
CREATE TABLE tbl_item_pedido(
	qtde INT UNSIGNED NOT NULL,
	i_cod_pedido INT UNSIGNED NOT NULL,
	i_cod_produto INT UNSIGNED NOT NULL,
	i_valor DECIMAL(10, 2) NOT NULL,
	CONSTRAINT fk_pedido1 FOREIGN KEY (i_cod_pedido) REFERENCES tbl_pedido (cod_pedido),
	CONSTRAINT fk_produto1 FOREIGN KEY (i_cod_produto) REFERENCES tbl_produto(cod_produto)
);

/* DML - 15/02/2022  */
/* Inserindo dados na tabela de produto */
INSERT INTO tbl_produto(nome_produto, desc_produto, unid_medida, estoque_atual, estoque_min, estoque_max, valor) VALUES
	('Arroz', 'Arroz agulhinha tipo 1', 'SC', 10, 2, 20, 12.50),
	('Feijão', 'Feijão carioquinha com casca', 'SC', 25, 5, 60, 7.50),
    ('Macarrão', 'Macarrão Adria Espaguete', 'PC', 50, 10, 80, 5.50),
    ('Óleo', 'Óleo Lisa', 'LT', 15, 10, 45, 6.50),
    ('Vinagre', 'Vinagre Castelo', 'GR', 30, 10, 50, 7.89),
    ('Batata', 'Batata Lavada', 'KG', 100, 50, 200, 4.50),
    ('Tomate', 'Tomate Vermelho', 'KG', 80, 8, 160, 6.90),
    ('Cebola', 'Cebola com casca', 'KG', 50, 5, 100, 6.99),
    ('Leite', 'Leite Leco', 'CX', 25, 10, 90, 2.50),
    ('Café', 'Café do Ponto', 'SC', 500, 100, 200, 11.50)
;

/* Inserindo dados do cliente */
/* Para inserção dos dados do cliente é necessario ter as informações dos endereços criados */
INSERT INTO tbl_cliente(nome_cliente, cpf, data_nascimento, cep, numero, complemento) VALUES
	('Marcos Costa de Sousa', '12345678901', '1981-02-06', 6768100, '1252', 'apto 166C'),
    ('Zoroastro Zoando', '01987654321', '1989-06-05', 6757190, '250', ''),
    ('Idelbrandolâcio Silva', '45698721364', '1974-09-27', 6753001, '120', ''),
    ('Cosmólio Ferreira', '41368529687', '1966-12-01', 6753020, '25', 'apto 255 F'),
    ('Conegunda Prado', '54781269501', '1950-10-06', 6753020, '50', 'apto 166C'),
    ('Brogundes Asmônio', '41256398745', '1940-05-10', 6753020, '100', ''),
    ('Iscruência da Silva', '12457965823', '1974-11-25', 6803040, '5', ''),
    ('Zizafânio Zizundo', '54123698562', '1964-08-14', 6803140, '25', ''),
    ('Ricuerda Zunda', '21698534589', '1934-10-14', 6803045, '123', ''),
    ('Aninoado Zinzão', '25639856971', '1976-12-25', 6803070, '50', '')
;

/* Lição */
/* Inserindo dados dos pedidos */
INSERT INTO tbl_pedido(data_pedido, data_entrega, cod_cliente) VALUES
	("2022-02-15", "2022-02-20", 20),
	("2022-02-16", "2022-02-21", 19),
	("2022-02-17", "2022-02-22", 18),
	("2022-02-18", "2022-02-23", 17),
	("2022-02-19", "2022-02-24", 16),
    ("2013-02-15", "2013-02-20", 11),
	("2012-02-16", "2012-02-21", 15)
;

/* Inserindo dados dos itens pedidos */
INSERT INTO tbl_item_pedido(qtde, i_cod_pedido, i_cod_produto, i_valor) VALUES 
	(4, 7, 3, 22),
	(1, 8, 1, 12.50),
	(2, 9, 2, 15),
    (30, 10, 6, 135),
	(15, 11, 7, 103.5),
	(20, 12, 8, 139.8),
    (10, 13, 9, 25)
;

/* Exercícios 22-03-2022 */
	/*1)Criar views que enxerguem os dados do cliente (código e nome) e pedidos (número do pedido, 
data do pedido e data de entrega), onde a data do pedido seja superior a 
30/01/2014;*/
CREATE VIEW pedidos_depois_de_2014 AS
    SELECT 
        a.cod_cliente,
        a.nome_cliente,
        b.cod_pedido,
        b.data_pedido,
        b.data_entrega
    FROM
        tbl_cliente a
            JOIN
        tbl_pedido b ON a.cod_cliente = b.cod_cliente
    WHERE
        data_pedido > '2014-01-30';
SELECT * FROM pedidos_depois_de_2014;
	
    /*2)Criar uma view que enxerga os dados do cliente (código do cliente e nome), dados do pedido 
(código do pedido, data do pedido e data da entrega), os dados do item do pedido 
(quantidade e código do produto), onde a quantidade destes produtos sejam 
maiores de 25;*/
CREATE VIEW qtde_produtos_maior_25 AS 
SELECT 
    a.cod_cliente,
    a.nome_cliente,
    b.cod_pedido,
    b.data_pedido,
    b.data_entrega,
    c.i_cod_produto,
    c.qtde
FROM
    tbl_cliente a
        JOIN
    tbl_pedido b ON a.cod_cliente = b.cod_cliente
        JOIN
    tbl_item_pedido c ON b.cod_pedido = c.i_cod_pedido
WHERE
    c.qtde > 25;
    
SELECT * FROM qtde_produtos_maior_25;
    
    /* 3)Criar uma view que enxergue os dados do pedido (código do pedido, código do cliente), os 
dados do item do pedido (quantidade, código do produto e descrição do produto); */
CREATE VIEW tudo_sobre_pedido AS 
SELECT 
    a.cod_pedido,
    a.cod_cliente,
    b.qtde,
    c.cod_produto,
    c.desc_produto
FROM
    tbl_pedido a
        JOIN
    tbl_item_pedido b ON a.cod_pedido = b.i_cod_pedido
        JOIN
    tbl_produto c ON i_cod_produto = cod_produto;
    
SELECT * FROM tudo_sobre_pedido;

/* 4)Que enxerguem os produtos reajustados em 11,2 %, onde deverá ser mostrado o 
código e a descrição do produto, o valor atual e o valor reajustado. */
ALTER TABLE tbl_produto ADD valor_reajustado DECIMAL(10,2); 

UPDATE tbl_produto SET valor_reajustado=(valor-valor*0.112) WHERE cod_produto IN (5, 6, 7, 8, 10);

CREATE VIEW produtos_reajustados AS SELECT * FROM tbl_produto WHERE valor_reajustado!=0;
SELECT * FROM produtos_reajustados;
