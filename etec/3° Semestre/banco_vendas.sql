/* Criação do banco de dados de vendas DDL - 08/02/2022 */
CREATE DATABASE bd_vendas;
/*Habilitando o uso do banco*/
USE bd_vendas;

#drop database bd_vendas;


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
	('Marcos Costa de Sousa', '12345678901', '1981-02-06', 6780230, '1252', 'apto 166C'),
    ('Zoroastro Zoando', '01987654321', '1989-06-05', 6780235, '250', ''),
    ('Idelbrandolâcio Silva', '45698721364', '1974-09-27', 6790020, '120', ''),
    ('Cosmólio Ferreira', '41368529687', '1966-12-01', 6753420, '25', 'apto 255 F'),
    ('Conegunda Prado', '54781269501', '1950-10-06', 6790000, '50', 'apto 166C'),
    ('Brogundes Asmônio', '41256398745', '1940-05-10', 6757130, '100', ''),
    ('Iscruência da Silva', '12457965823', '1974-11-25', 6767300, '5', ''),
    ('Zizafânio Zizundo', '54123698562', '1964-08-14', 6753250, '25', ''),
    ('Ricuerda Zunda', '21698534589', '1934-10-14', 6763350, '123', ''),
    ('Aninoado Zinzão', '25639856971', '1976-12-25', 6773310, '50', '')
;

/* Lição */
/* Inserindo dados dos pedidos */
INSERT INTO tbl_pedido(data_pedido, data_entrega, cod_cliente) VALUES
	("2022-02-15", "2022-02-20", 20),
	("2022-02-16", "2022-02-21", 19),
	("2022-02-17", "2022-02-22", 18),
	("2022-02-18", "2022-02-23", 17),
	("2022-02-19", "2022-02-24", 16)
;

/* Inserindo dados dos itens pedidos */
INSERT INTO tbl_item_pedido(qtde, i_cod_pedido, i_cod_produto, i_valor) VALUES 
	(4, 1, 3, 22),
	(1, 2, 1, 12.50),
	(2, 3, 2, 15)
;

select * from tbl_produto;
select * from tbl_pedido;
select * from tbl_cliente;
select * from tbl_item_pedido;
select * from tbl_endereco;

/********************************************/
#1ª VIEW - RELAÇÃO DE CLEINTE COM PEDIDO
create view vw_cliped as
	select c.cod_cliente as codigo, c.nome_cliente as nome, p.cod_pedido as pedido,
		p.data_pedido as data_requisicao
	from tbl_cliente c, tbl_pedido p
    where c.cod_cliente = p.cod_cliente;
    
#2ª VIEW - RELACIONA CLIENTES, PEDIDOS E ITEM DOS PEDIDOS
create view vw_clipedprod as
	select c.cod_cliente as codigo, c.nome_cliente as nome, p.cod_pedido as pedido,
		p.data_pedido as data_requisicao,
		i.i_cod_produto as produto, i.qtde
	from tbl_cliente c, tbl_pedido p, tbl_item_pedido i
    where c.cod_cliente = p.cod_cliente
    and	i.i_cod_pedido = p.cod_pedido;

#3ª VIEW - RELACIONA CLIENTES, PEDIDOS, ITENS DOS PEDIDOS E PRODUTOS
CREATE VIEW vw_produtototal AS
    SELECT 
        c.cod_cliente AS codigo,
        c.nome_cliente AS nome,
        p.cod_pedido AS pedido,
        p.data_pedido AS data_requisicao,
        i.i_cod_produto AS produto,
        pr.nome_produto AS descricao,
        i.qtde,
        pr.valor,
        i.qtde * pr.valor AS totalcomprado
    FROM
        tbl_cliente c,
        tbl_pedido p,
        tbl_item_pedido i,
        tbl_produto pr
    WHERE
        c.cod_cliente = p.cod_cliente
            AND i.i_cod_pedido = p.cod_pedido
            AND i.i_cod_produto = pr.cod_produto;


#Exemplo
CREATE VIEW vw_consolidavenda (cod_pedido , cod_produto , valor) AS
    SELECT 
        p.cod_pedido, i.i_cod_produto, i.qtde * pr.valor
    FROM
        tbl_pedido p,
        tbl_item_pedido i,
        tbl_produto pr
    WHERE
        i.i_cod_pedido = p.cod_pedido
            AND i.i_cod_produto = pr.cod_produto;
        
#Exemplo 2
CREATE VIEW vw_vendatotal (cod_pedido , total_valor) AS
    SELECT 
        p.cod_pedido, SUM(i.qtde * pr.valor)
    FROM
        tbl_pedido p,
        tbl_item_pedido i,
        tbl_produto pr
    WHERE
        i.i_cod_pedido = p.cod_pedido
            AND i.i_cod_produto = pr.cod_produto
    GROUP BY p.cod_pedido;
    
#Exemplo 3
CREATE TABLE tbl_log (
    id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    dt_log DATE NOT NULL,
    hora TIME NOT NULL
);

#Exemplo 4
delimiter $
create trigger trg_log before delete
on tbl_cliente
for each row
begin
    insert into tbl_log
           (usuario,dt_log,hora)
   values(user(),curdate(),curtime());
end$

show triggers from bd_vendas;
drop triggers trg_log;

/*16-05-2022*/
#DELIMITADOR
/*delimiter $
#DECLARAÇÃO DA SOTRE PROCEDURE
CREATE procedure nome_da_procedure()
#inicio do corpo de código da stored procedure
BEGIN
	#	código SQL que a procedure vai executar 
    
END $ #fim do corpo de código da stored procedure

delimiter $
create procedure prc_lista_prod()
	begin
		select * from tbl_produto
		where cod_produto in(1, 3, 5, 7);
	end $ 
delimiter $;

call prc_lista_prod();

select * from tbl_produto;*/

##Exercícios
/*
a) Modifique a tabela tbl_log acrescentando um campo onde armazene o tipo de
operação realizada, sendo: “INSERÇÃO”, “ATUALIZAÇÃO” ou “EXCLUSÃO” e
outro campo que armazene a tabela que está sendo realizadas as ações.
*/
ALTER TABLE tbl_log ADD tipo_operacao ENUM('INSERCAO', 'ATUALIZACAO', 'EXCLUSAO');
ALTER TABLE tbl_log ADD tabela_acao ENUM('tbl_produto', 'tbl_pedido', 'tbl_cliente', 'tbl_item_pedido', 'tbl_endereco');


/*
b) De acordo com o exercício A crie uma trigger que ao atualizar e antes de qualquer
ação na tabela de Pedidos;
*/
delimiter $
	CREATE TRIGGER trg_update BEFORE UPDATE
    ON tbl_pedido
    FOR EACH ROW
    BEGIN
		INSERT INTO tbl_log (usuario, dt_log, hora, tipo_operacao, tabela_acao)
        VALUES (
			user(), curdate(), curtime(), 'ATUALIZACAO', 'tbl_pedido'
        );
END $;

/*
c) De acordo com o exercício A crie uma trigger que ao excluir e antes de qualquer
ação na tabela de Produtos;
*/
delimiter $
	CREATE TRIGGER trg_delete BEFORE DELETE
    ON tbl_produto
    FOR EACH ROW
    BEGIN
		INSERT INTO tbl_log (usuario, dt_log, hora, tipo_operacao, tabela_acao)
        VALUES (
			user(), curdate(), curtime(), 'EXCLUSAO', 'tbl_produto'
        );
END $;

/*
d) De acordo com o exercício A crie uma trigger que ao inserir e depois de qualquer
ação na tabela de Clientes.
*/
delimiter $
	CREATE TRIGGER trg_insert BEFORE INSERT
    ON tbl_cliente
    FOR EACH ROW
    BEGIN
		INSERT INTO tbl_log (usuario, dt_log, hora, tipo_operacao, tabela_acao)
        VALUES (
			user(), curdate(), curtime(), 'INSERCAO', 'tbl_cliente'
        );
END $ 

/*Aula 24-05-2022*/
/* Exercícios */

/* a) Crie um procedimento armazenado que é passado o código do produto na tabela de 
produtos e um percentual para calcular o acréscimo ao valor desse mesmo produto, o 
retorno deverá ser uma mensagem informando se a operação foi feita de forma correta.	
*/

DELIMITER $
create procedure prc_percent (	in vId int,
								in vPercent decimal(10.2),
								out msg varchar(100))
	begin
		declare percent DECIMAL(10,2);
        
        set percent = vPercent / 100 + 1;
		
        if(percent > 0 && vId > 0) then
			UPDATE tbl_produto SET valor = valor * percent WHERE cod_produto = vId;
			set msg = ("A operação foi realizada com êxito");
		else
			set msg = ("A operação não foi realizado com êxito, verifique os valores passados");
		end IF;
	end $
DELIMITER $

call prc_percent(1, 50, @msg);

/*
b) Crie um procedimento armazenado que grave na tabela de log (Exercício d) da 
atividade anterior, no campo tipo de operação, informem “INS_TRIGGER” o registro de 
auditoria;
*/
delimiter $
create procedure prc_trigger()
	begin
		INSERT INTO tbl_log (usuario, dt_log, hora, tipo_operacao, comando) VALUES(user(), curdate(), curtime(), "INS_TRIGGER", "A ação esta sendo realizada na tabela 'tbl_cliente'");
	end $	
delimiter $;

delimiter $
create trigger trg_insert after insert
on tbl_cliente
for each row
begin
	call prc_trigger();
end $
delimiter ;
