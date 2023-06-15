USE bd_vendas;

select * from tbl_log;

CREATE TABLE tbl_log(
	id_log INT AUTO_INCREMENT PRIMARY KEY,
    usuario varchar(50) NOT NULL, 
    dt_log DATE NOT NULL, 
    hora TIME NOT NULL
);

# EXERCICIOS ----------------------------------------------------------------------------------
-- a) Modifique a tabela tbl_log acrescentando um campo onde armazene o tipo de
-- operação realizada, sendo: “INSERÇÃO”, “ATUALIZAÇÃO” ou “EXCLUSÃO” e
-- outro campo que armazene a tabela que está sendo realizadas as ações.
ALTER TABLE tbl_log ADD tipo_operacao ENUM('INSERCAO', 'ATUALIZACAO', 'EXCLUSAO');
ALTER TABLE tbl_log ADD tabela_acao ENUM('tbl_produto', 'tbl_pedido', 'tbl_cliente', 'tbl_item_pedido', 'tbl_endereco');


-- b) De acordo com o exercício A crie uma trigger que ao atualizar e antes de qualquer
-- ação na tabela de Pedidos;
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

-- c) De acordo com o exercício A crie uma trigger que ao excluir e antes de qualquer
-- ação na tabela de Produtos;
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

-- d) De acordo com o exercício A crie uma trigger que ao inserir e depois de qualquer
-- ação na tabela de Clientes
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
 
# TESTANDO
UPDATE tbl_pedido set data_pedido = "2022-02-16" where cod_pedido = 11; 
DELETE FROM tbl_produto WHERE cod_produto = 10;
INSERT INTO tbl_cliente(nome_cliente, cpf, data_nascimento, cep, numero, complemento) VALUES
	('Gabriel Vitor Araujo de Lima', '50555075849', '2001-07-18', 6753430, '740', 'Casa 2');

select * from tbl_log;