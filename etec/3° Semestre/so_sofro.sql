DELIMITER @@
	CREATE PROCEDURE cria_tabela()
	BEGIN 
		CREATE TEMPORARY TABLE IF NOT EXISTS tbl_auxprod(
			aux_prod INTEGER NOT NULL,
            aux_desc VARCHAR(20),
            qtde_ajust VARCHAR(20),
            data_hora DATETIME DEFAULT NOW(),
            PRIMARY KEY(aux_prod, data_hora)
        );
        DELETE FROM tbl_auxprod;
	END @@
DELIMITER;

DELIMITER $$ 
CREATE PROCEDURE ajusta_estoque(IN qtde INT, porcentualAumento int, OUT msg CHAR(100))
BEGIN
    DECLARE p_linha INT DEFAULT 0;
    DECLARE p_codigo INT DEFAULT 0;
    DECLARE p_descri VARCHAR(100);
    DECLARE p_estoque INT DEFAULT 0;
    DECLARE p_status INT DEFAULT 0;
    declare p_valor float default 0;

    DECLARE meucursor CURSOR FOR 
            SELECT cod_produto, nome_produto, estoque_atual, valor FROM tbl_produto;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET p_linha = 1;

    OPEN meucursor;

    call cria_tabela();

    meuloop:LOOP
        FETCH meucursor INTO p_codigo, p_descri, p_estoque;

        IF p_linha = 1 THEN 
            SELECT COUNT(*) INTO p_status FROM tbl_auxprod;
            IF p_status > 0 THEN

                SELECT * FROM tbl_auxprod;
                LEAVE meuloop;
            else
                SET msg = "nada processado!";
                SELECT msg;
                LEAVE meuloop;
            END IF;
		end if;
		IF p_linha != 1  && p_estoque = qtde THEN
			UPDATE tbl_produto SET estoque_atual = qtde + 2
				WHERE cod_produto = p_codigo;
				INSERT INTO tbl_auxprod(aux_prod, aux_desc, qtde_ajust)
				VALUES (p_codigo, p_descri, p_estoque + 2);
		end if;
		IF p_valor<10 THEN 	
			UPDATE tbl_produto SET p_valor = p_valor * (porcentualAumento/100)
				WHERE p_valor<10;
		END IF;

		END LOOP meuloop;
    CLOSE meucursor;
END $$

