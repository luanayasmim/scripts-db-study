-- -------------------- EXERCICIOS ------------------------------

-- 1- UTILIZANDO O RECURSO "IN", SELECIONAR TODAS AS INFORMACOES DOS AUTORES "JK ROWLING" E "STEPHAN KING":
select * from autor_livro;
select * from tbl_livros;
select * from tbl_autor;

SELECT 
    *
FROM
    tbl_autor
WHERE
    nome_autor IN ('Stephan King' , 'JK Rowling');
    
# EXTRA 
-- Selecionando informações dos autores (junto com livro)    
SELECT 
    a.*, c.nome_livro
FROM
    tbl_autor a
        JOIN
    autor_livro b ON a.codigo_autor = b.FK_Autor
		JOIN
	tbl_livros c on c.codigo_livro = b.FK_Livro
WHERE
	nome_autor IN ('Stephan King' , 'JK Rowling');
        
-- 2 - UTILIZANDO O RECURSO "IN", SELECIONAR O NOME, AS PAGINAS E A CATEGORIA DE TODOS OS LIVROS DAS CATEGORIAS "CONTOS", "POESIA" E "AVENTURA":
select * from tbl_livros;
select * from tbl_categoria;

select 
	a.nome_livro, a.paginas, b.nome_categoria 
from 
	tbl_livros a 
    join 
    tbl_categoria b on b.codigo_categoria = a.FK_Categoria
where 
	b.nome_categoria in ("Contos", "Poesia", "Aventura");
    
-- 3 - EXIBIR QUAL CATEGORIA DE LIVROS, NAO TEM NENHUM LIVRO VINICULADO A ELA.
select * from tbl_livros;
select * from tbl_categoria;

select 
	nome_categoria
from 
	tbl_categoria 
where 
	codigo_categoria not in (select FK_Categoria from tbl_livros);
    
-- 4 - Exibir o nome dos livros cadastrados, juntamente com suas categorias e nome das editoras que o produziram.
select * from tbl_categoria;
select * from tbl_livros;
SELECT * from tbl_editora;


SELECT 
    a.nome_livro, b.nome_categoria, c.nome_editora
FROM
    tbl_categoria b
        JOIN
    tbl_livros a ON b.codigo_categoria = a.FK_Categoria
        JOIN
    tbl_editora c ON c.codigo_editora = a.FK_Editora;

-- 5- Exibir os autores que produziram livros da categoria de romance e quantos livros cada um produziu ordenando por quem produziu mais primeiro.
select * from tbl_autor;
select * from autor_livro;
SELECT * from tbl_livros;
select * from tbl_categoria;

SELECT 
    nome_autor, COUNT(nome_categoria) total
FROM
    tbl_autor
        JOIN
    autor_livro ON codigo_autor = FK_Autor
        JOIN
    tbl_livros ON codigo_livro = FK_Livro
        JOIN
    tbl_categoria ON codigo_categoria = FK_Categoria
WHERE
    nome_categoria = 'Romance'
GROUP BY nome_autor
ORDER BY total desc;

-- 6 - Exibir os nomes dos autores e o nome dos seus livros.
select * from tbl_autor;
select * from autor_livro;
select * from tbl_livros;


SELECT 
    nome_autor, nome_livro
FROM
    tbl_autor
        JOIN
    autor_livro ON codigo_autor = FK_Autor
        JOIN
    tbl_livros ON codigo_livro = FK_Livro;

-- 7- Exibir os nomes dos autores e quantos livros cada um produziu em ordem do que tem mais livros para o que tem menos livros.
select * from tbl_autor;
select * from autor_livro;
select * from tbl_livros;

SELECT 
    nome_autor, COUNT(nome_livro) total_livros
FROM
    tbl_autor
        JOIN
    autor_livro ON codigo_autor = FK_Autor
        JOIN
    tbl_livros ON codigo_livro = FK_Livro
GROUP BY nome_autor
ORDER BY total_livros DESC;


-- 8 - EXIBIR APENAS O NOME, A SUA CATEGORIA E VALOR_UNITARIO PARA TODOS OS LIVROS QUE O VALOR UNITARIO FOR SUPERIOR 
-- A MEDIA DOS PREÇOS. ORDENAR A BUSCA DO MENOR VALOR PARA O MAIOR. # DICA: UTILIZE SUBQUERY E ORDER BY.
select * from tbl_livros;
select * from tbl_categoria;

SELECT 
    nome_livro, nome_categoria, valor_unitario
FROM
    tbl_livros
        JOIN
    tbl_categoria ON codigo_categoria = FK_Categoria
WHERE
    valor_unitario > (SELECT 
            AVG(valor_unitario)
        FROM
            tbl_livros)
ORDER BY valor_unitario;


-- 9 - EXIBIR O NOME DO LIVRO, A QUANTIDADE DE PAGINAS E O NOME DA CATEGORIA PARA TODOS OS LIVROS QUE O NUMERO DE 
-- PAGINAS SEJA MENOR QUE A MEDIA DAS PAGINAS. ORDERNAR A BUSCA DO MAIOR PARA O MENOR VALOR DA COLUNA PAGINAS.
select * from tbl_livros;
select * from tbl_categoria;

SELECT 
    nome_livro, paginas, nome_categoria
FROM
    tbl_livros
        JOIN
    tbl_categoria ON codigo_categoria = FK_Categoria
WHERE
    paginas < (SELECT 
            AVG(paginas)
        FROM
            tbl_livros)
ORDER BY paginas DESC;

