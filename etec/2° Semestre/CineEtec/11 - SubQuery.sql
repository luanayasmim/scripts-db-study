use CINEETEC;

desc tbl_ator;

-- ----------------- SUBQUERY ---------------------
# query dentro de outras query
SELECT (
	SELECT NOW() + INTERVAL 2 DAY
) + INTERVAL 1 MONTH nome_bonito;

# Apresentar o nome e a duração do filme mais longo
SELECT nome_filme FROM tbl_ator WHERE duracao = (
    SELECT MAX(duracao) FROM tbl_filme
) 
UNION -- Une os dois comandos 
SELECT 
    nome_filme
FROM
    tbl_ator
WHERE
    duracao = (SELECT 
            MIN(duracao)
        FROM
            tbl_filme);


