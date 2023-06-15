use cineetec;

# INSERINDO ATORES

INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES
	("Andrew Garfield", "M", "1983/08/20"),
	("Sandra Bullock", "F", "1964/06/26"),
	("Will Smith", "M", "1968/09/25"),
	("Harrison Ford", "M", "1942/07/13"),
	("Hugh Jackman", "M", "1968/10/12"),
	("Angelina Jolie", "F", "1975/06/04"),
	("Keanu Reeves", "M", "1964/09/04"),
	("Jennifer Lawrence", "F", "1990/08/15"),
	("Sylvester Stallone", "M", "1946/07/06"),
	("James Mcavoy", "M", "1979/04/21"),
	("Brad Pitt", "M", "1963/12/18"),
	("Leonardo Dicaprio", "M", "1947/11/11"),
	("Vin Diesel", "M", "1967/07/18"),
	("Johnny Depp", "M", "1963/06/09"),
	("Robin Williams", "M", "1951/07/21"),
	("Robert Downey Jr.", "M", "1965/04/04"),
	("Patrick Stewart", "M", "1940/07/13"),
	("Sandra Bullock", "F", "1964/07/26"),
	("Jackie Chan", "M", "1954/04/07"),
	("Jannifer Aniston", "F", "1969/02/11"),
	("Jim Carrey", "F", "1962/01/17"),
	("Scarlett Johansson", "F", "1984/11/22"),
	("Megan Fox", "F", "1986/05/16"),
	("Ben Stiller", "F", "1965/11/30"),
	("Emma Stone", "F", "1988/11/06");

-- update tbl_ator
-- set nome_ator = 'James Mcavoy'
-- where id_ator = 10;

# INSERINDO DIRETORES
insert into tbl_diretor(nome_diretor, nacionalidade, dt_nascimento, sexo) values("Steven Spielberg", "Estados Unidos", "1946/12/18", "M");
insert into tbl_diretor(nome_diretor, nacionalidade, dt_nascimento, sexo) values("James Cameron", "Canada", "1954/08/16", "M");
insert into tbl_diretor(nome_diretor, nacionalidade, dt_nascimento, sexo) values("José Padilha", "Brasil", "1967/08/01", "M");
insert into tbl_diretor(nome_diretor, nacionalidade, dt_nascimento, sexo) values("George Lucas", "Estados Unidos", "1944/05/14", "M");    
insert into tbl_diretor(nome_diretor, nacionalidade, dt_nascimento, sexo) values("Alan Rickman", "Inglaterra", "1965/02/21", "M");
insert into tbl_diretor(nome_diretor, nacionalidade, dt_nascimento, sexo) values("Fernando Meirelles", "Brasil", "1965/11/09", "M");

# INSERINDO GENEROS
insert into tbl_genero(genero) values("Terror");
insert into tbl_genero(genero) values("Ação");
insert into tbl_genero(genero) values("Comedia");
insert into tbl_genero(genero) values("Drama");
insert into tbl_genero(genero) values("Suspense");
insert into tbl_genero(genero) values("Ficção");
insert into tbl_genero(genero) values("Romance");
insert into tbl_genero(genero) values("Animação");

# INSERINDO OS FILMES
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Viva: A vida é uma festa", "2017", "105", 8, 5);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Logan", "2017", "137", 2, 1);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Um sonho de liberdade", "1995", "145", 4, 5);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Matrix", "1999", "150", 6, 1);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Jumanji", "1996", "104", 3, 6);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Cidade de Deus", "2002", "165", 2, 3);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("O Resgate do Soldado Ryan", "1998", "170", 2, 6);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Extraordinário", "2017", "113", 4, 5);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("O Poderoso Chefão", "1972", "178", 2, 2);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Forrest Gump", "1994", "142", 7, 1);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Truque de Mestre", "2013", "125", 2, 4);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Fragmentado", "2017", "117", 4, 6);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Avatar", "2009", "162", 6, 2);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("O Preço do Amanhã", "2011", "109", 2, 3);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("O Senhor dos Anéis: O Retorno do Rei", "2003", "200", 6, 5);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Toy Story", "1995", "141", 8, 2);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Star Wars: Os Últimos Jedi", "2017", "152", 6, 4);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("O Menino do Pijama Listrado", "2008", "94", 4, 1);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("O Lobo de Wall Street", "2013", "181", 4, 6);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("A Hora do Rush", "1998", "98", 3, 5);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Piratas do Caribe - Maldição do Perola Negra", "2003", "143", 2, 4);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Passageiros", "2016", "116", 2, 1);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Beleza Oculta", "2016", "97", 4, 2);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("It - A Coisa", "2017", "134", 1, 3);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Rocky V", "1990", "111", 4, 4);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Titanic", "1997", "195", 7, 4);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Vingadores 4", "2019", "150", 2, 2);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Velozes e Furiosos 8", "2017", "136", 2, 6);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Transforms", "2007", "150", 2, 4);
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES("Ilha do Medo", "2010", "139", 5, 1);



use cineetec;
select * from tbl_ator;
show tables;
desc tbl_diretor;