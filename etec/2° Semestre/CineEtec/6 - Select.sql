use cineetec;

select * from tbl_ator; 
select nome_ator, dt_nascimento from tbl_ator;

select * from tbl_ator where sexo = "F";

select nome_diretor, nacionalidade, dt_nascimento from tbl_diretor
	where nacionalidade = "Estados Unidos" and dt_nascimento = "1946-12-18";


# REALIZANDO BUSCAS COM APENAS UM PEDAÇO DA INFORMAÇÃO - COMANDO LIKE - (% - CORINGA)
select * from tbl_ator where nome_ator like "A%"; # Qualquer nome que comece com a letra a
select * from tbl_ator where nome_ator like "%e"; # Qualquer nome que termine com a letra e
select * from tbl_ator where nome_ator like "%de%"; # Qualquer nome que tenha 'de'.

# REALIZANDO BUSCAS COM INTERVALO DE DATAS
select * from tbl_ator 
	where dt_nascimento > "1980-01-01" and dt_nascimento < "1990-01-01";

select * from tbl_ator 
	where dt_nascimento between "1980-01-01" and "1990-01-01";
