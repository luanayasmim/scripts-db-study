use cineetec;

# FUNÇÕES DE AGREGAÇÃO
# Podemos implementar mais de uma função em um mesmo select

 
# MIN
select min(nome_filme) primeiro_filme from tbl_filme; # retorna o primeiro item em ordem alfabetica.
select min(duracao) menor_duracao from tbl_filme; # retorna o menor numero.
select min(dt_nascimento) data_antiga from tbl_ator; # retorna a data mais antiga.


# MAX
select max(nome_filme) ultimo_filme  from tbl_filme; # retorna o ultimo item em ordem alfabetica.
select max(duracao) maior_duracao from tbl_filme; # retorna o maior numero.
select max(dt_nascimento) data_recente from tbl_ator; # retorna a data mais recente.


# AVG (media)
select avg(duracao ) media_duração from tbl_filme;
select cast(avg(duracao) as decimal(5, 2)) from tbl_filme;


# SUM
select sum(duracao) soma_durações from tbl_filme;

# Soma de duas colunas
select sum(duracao) + sum(ano_lancamento) soma_das_colunas from tbl_filme;


# COUNT
select count(*) total_de_filmes from tbl_filme; # Contando as linhas
# Poderia mudar * por qualquer coluna, porém * é o mais utilizado

# Contando quantidade de colunas
SELECT count(*)
	FROM information_schema.columns
	WHERE table_name = 'tbl_diretor'  
	AND table_name = 'tbl_diretor';


# EXTRAS
# Contando quantas atrizes estão cadastradas na tabela ator
select  count(*) from tbl_ator
	where sexo = "F";
    
# Selecionar o nome do filme de maior duração
select nome_filme from tbl_filme 
	where duracao = (select max(duracao) from tbl_filme);
