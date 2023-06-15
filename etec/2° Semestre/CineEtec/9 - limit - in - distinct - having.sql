use cineetec;

# ------------- LIMIT -------------
select * from tbl_ator limit 0, 10;  # Exibir do item 0 ao 10 

#--------------- IN ---------------
select * from tbl_filme where fk_id_genero in(1,2,3); # Substitui -> fk_id_genero = 1 or fk_id_genero = 2 etc. 

#------------ DISTINCT ------------
select distinct(nacionalidade) from tbl_diretor; # Não é usado com comandos de agregação. Apresenta os valores sem repetição.

select nacionalidade from tbl_diretor;

#------------- HAVING -------------
# Having pode ser utilizado como where.
# Having é usado como filtro para uma query após utilizar o group by.
select * from tbl_diretor having nacionalidade = 'Brasil';
select nacionalidade, count(*) total from tbl_diretor group by nacionalidade having total >= 2;







