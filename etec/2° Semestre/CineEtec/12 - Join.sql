
-- Selecionar todos os filmes que forem do genero Terror 
-- e foram lançados por diretorees brasileiros
SELECT 
    a.nome_filme, b.genero, c.nome_diretor
FROM
    tbl_filme a
        JOIN
    tbl_genero b ON FK_id_genero = id_genero
        JOIN
    tbl_diretor c ON FK_id_diretor = id_diretor
WHERE
    id_genero = 1
        AND nacionalidade = 'Brasil';
	
-- Selecionar o nome e data de nascimento dos diretores 
-- que lançaram filmes de comedia com duração maior que 100min
SELECT 
    a.duracao, b.nome_diretor, b.dt_nascimento, c.genero
FROM
    tbl_filme a
        JOIN
    tbL_diretor b ON FK_id_diretor = id_diretor
        JOIN
    tbl_genero c ON FK_id_genero = id_genero
WHERE
    genero = 'Comédia' AND duracao < 100;