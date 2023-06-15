# --------------------- Desafio ------------------------------
use cineetec;
-- 1- Selecionar todos os atores que comecem com a letra "A".
SELECT 
    nome_ator
FROM
    tbl_ator
HAVING nome_ator LIKE 'a%';

-- 2- Selecionar a maior duracao dos filmes cadastrados. 
SELECT 
    nome_filme, duracao
FROM
    tbl_filme
WHERE
    duracao = (SELECT 
            MAX(duracao)
        FROM
            tbl_filme);

-- 3- Selecionar a menor duracao dos filmes lancado entre os 
-- anos 2000 e 2010. 
SELECT 
    nome_filme, ano_lancamento, duracao
FROM
    tbl_filme
WHERE
    duracao = (SELECT 
            MIN(duracao)
        FROM
            tbl_filme)
        AND ano_lancamento BETWEEN '2000' AND '2010';
    
-- 4- Selecionar os filmes exibindo apenas aqueles que 
-- pertencerem ao genero "Ação".
SELECT 
    nome_filme, genero
FROM
    tbl_genero,
    tbl_filme
WHERE
    FK_id_genero = id_genero
        AND genero = 'Ação';

-- 5- Selecionar os filmes exibindo aqueles que pertecerem 
-- ao genero "Drama" e que tenham sido lançados apos o ano 2010.
SELECT 
    nome_filme, genero, ano_lancamento
FROM
    tbl_genero,
    tbl_filme
WHERE
    FK_id_genero = id_genero
        AND genero = 'Drama'
        AND ano_lancamento > '2010';
    
-- 6- Exibir todos os filmes e seus anos de lancamentos organizando  
-- da seguinte maneira (ordem de ano do mais novo para o mais velho e nome do filme em ordem alfabetica).
SELECT 
    nome_filme, ano_lancamento
FROM
    tbl_filme
ORDER BY ano_lancamento , nome_filme;

-- 7- Exibir a soma da duracao de todos os filmes que foram lancados entre 2010 e 2018 e pertecerem ao genero "ficçao"
SELECT 
    SUM(duracao) soma_duracao, genero
FROM
    tbl_genero,
    tbl_filme
WHERE
    FK_id_genero = id_genero
        AND genero = 'Ficção'
        AND ano_lancamento BETWEEN '2010' AND '2018';

-- 8- Exibir quantos filmes foram lancados antes do ano 2000.
SELECT 
    nome_filme, ano_lancamento
FROM
    tbl_filme
HAVING ano_lancamento < '2000'
ORDER BY ano_lancamento;

-- 9- Exibir qual a media de duracao dos filmes lancados apos
-- o ano 2000.
SELECT 
    CAST(AVG(duracao) AS DECIMAL (5 , 2 )) media_duracao
FROM
    tbl_filme
WHERE
    ano_lancamento < '2000';

-- 10- Quantos filmes pertecem a cada um dos generos.
SELECT 
    COUNT(*) total_filmes, genero
FROM
    tbl_filme,
    tbl_genero
WHERE
    FK_id_genero = id_genero
GROUP BY genero;

-- 11- Exibir em ordem alfabetica quais atores e em quais anos nasceram 
-- entre 1960 e 1980.
SELECT 
    nome_ator, dt_nascimento
FROM
    tbl_ator
WHERE
    YEAR(dt_nascimento) BETWEEN '1960' AND '1980'
ORDER BY nome_ator;

-- 12- Exibir todas informações sobre os atores do mais jovem para o mais velho.
SELECT 
    *
FROM
    tbl_ator
ORDER BY YEAR(dt_nascimento);

-- 13- Selecionar quantos filmes foram lancados em cada um dos 
-- anos.
select * from tbl_filme;
select count(*) total_filmes, ano_lancamento from tbl_filme
	group by ano_lancamento;

-- 14- Exibir quantos diretores pertencem a cada pais.
SELECT 
    COUNT(*) total_diretores, nacionalidade
FROM
    tbl_diretor
GROUP BY nacionalidade;

-- 15- exibir o total de filmes, a soma das durações e a media das duracoes para cada um 
-- dos generos de filmes organizando da menor media para a maior.
SELECT 
    COUNT(*) total_filmes,
    SUM(duracao) soma_durações,
    CAST(AVG(duracao) AS DECIMAL (5 , 2 )) media_durações,
    genero
FROM
    tbl_filme,
    tbl_genero
WHERE
    FK_id_genero = id_genero
GROUP BY genero
ORDER BY media_durações;

-- 18- Selecionar todos os filmes que contenham a silaba "DE" no nome e em ordem alfabetica de Z-A.
SELECT 
    nome_filme
FROM
    tbl_filme
WHERE
    nome_filme LIKE '%DE%'
ORDER BY nome_filme DESC;