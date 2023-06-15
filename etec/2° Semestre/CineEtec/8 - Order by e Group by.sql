use cineetec;

select * from tbl_filme;

# ----------------- ORDER BY -------------------

select * from tbl_filme order by nome_filme;
select * from tbl_filme order by nome_filme desc;

# select com ordem pelo ano de lançamento com criterio de desempate "nome_filme"
select * from tbl_filme order by ano_lancamento, nome_filme;

# Uma com ordem crescente e outra em ordem decrescente
select * from tbl_filme order by ano_lancamento desc, nome_filme;


# ----------------- GROUP BY -------------------

select ano_lancamento, nome_filme from tbl_filme group by ano_lancamento;

# Group by + count
# Quantos filmes existem para cada ano?
select count(*) total_filmes, ano_lancamento from tbl_filme
	group by ano_lancamento;

select * from tbl_ator;
# Selecione quantos atores e quantas atrizes existem estão cadastrados
select count(*) total_atores, sexo from tbl_ator
	group by sexo
    order by total_atores desc;