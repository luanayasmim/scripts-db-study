DROP DATABASE cinetec;
CREATE DATABASE cinetec; #Criando um banco de dados
USE cinetec;

#Criando tabelas sem FK

# Tabela gênero
CREATE TABLE tbl_genero(
	id_genero int primary key auto_increment,
    genero varchar(45) not null
);

#Tabela Ator
CREATE TABLE tbl_ator(
	id_ator int primary key auto_increment,
    nome_ator varchar(45) not null,
    sexo varchar(1) not null,
    dt_nascimento date not null
);

#Tabela Diretor
CREATE TABLE tbl_diretor(
	id_diretor int primary key auto_increment,
    nome_diretor varchar(45) not null,
    nacionalidade varchar(10) not null,
    dt_nascimento date not null
);


#Tabelas com FK:

#Tabela Filme
CREATE TABLE tbl_filme(
	id_filme int primary key auto_increment,
    nome_filme_pt varchar(45) not null,
    nome_filme_en varchar(45),
    ano_lancamento int(4) not null,
    duracao int(3) not null,
    FK_id_genero int not null, #Referência da id_genero
    FK_id_diretor int not null, #Referência da id_diretor
    
    constraint FK_id_genero foreign key (FK_id_genero) references tbl_genero(id_genero),
    constraint FK_id_diretor foreign key (Fk_id_diretor) references tbl_diretor(id_diretor)
);

# Criando tabela de relação entre filmes e atores
CREATE TABLE tbl_filme_has_tbl_ator(
	FK_id_filme int not null,
    FK_id_ator int not null,
    
    constraint FK_id_filme foreign key(FK_id_filme) references tbl_filme(id_filme),
    constraint FK_id_ator foreign key(FK_id_ator) references tbl_ator(id_ator),
    
    #Primary key composta
    primary key(FK_id_filme, FK_id_ator) #Transformando as colunas em chaves primárias
);

#Lição de casa - Aula 30/08/2021
#Acrescentar na tabela diretor o campo sexo sendo varchar(1) e não nulo:
ALTER TABLE tbl_diretor ADD sexo varchar(1) not null;

#Na tabela diretor alterar o tamanho do campo Nacionalidade para varchar (45):
ALTER TABLE tbl_diretor MODIFY nacionalidade varchar(45) not null;

#Na tabela filme excluir a coluna nome_filme_en e alterar nome_filme_pt para apenas nome_filme:
ALTER TABLE tbl_filme DROP nome_filme_en;
ALTER TABLE tbl_filme CHANGE nome_filme_pt nome_filme varchar(45) not null;

#Renomear a tabela tbl_filme_has_tbl_ator para filme_e_ator:
ALTER TABLE tbl_filme_has_tbl_ator RENAME filme_e_ator;


#Lição de casa - Aula 13/09/2021
#Inserir informações de acordo com a planilha

#Tabela ator:
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Andrew Garfield", "M", "1983/08/20");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Sandra Bullock", "F", "1964/06/26");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Will Smith", "M", "1968/09/25");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Harrison Ford", "M", "1942/07/13");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Hugh Jackman", "M", "1968/10/12");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Angelina Jolie", "F", "1975/06/04");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Keanu Reeves", "M", "1964/09/04");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Jennifer Lawrence", "F", "1990/08/15");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Sylvester Stallone", "M", "1946/07/06");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("James Mcavoy", "M", "1979/04/21");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Brad Pitt", "M", "1963/12/18");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Leonardo Dicaprio", "M", "1947/11/11");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Vin Diesel", "M", "1967/07/18");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Johnny Depp", "M", "1963/06/09");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Robin Williams", "M", "1951/07/21");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Robert Downey Jr.", "M", "1965/04/04");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Patrick Stewart", "M", "1940/07/13");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Sandra Bullock", "F", "1964/07/26");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Jackie Chan", "M", "1954/04/07");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Jannifer Aniston", "F", "1969/02/11");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Jim Carrey", "F", "1962/01/17");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Scarlett Johansson", "F", "1984/11/22");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Megan Fox", "F", "1986/05/16");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Ben Stiller", "F", "1965/11/30");
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Emma Stone", "F", "1988/11/06");

#Tabela Diretor
INSERT INTO tbl_diretor VALUES(1, "Steven Spielberg", "Estados Unidos", "1946/12/18", "M");
INSERT INTO tbl_diretor VALUES(2, "James Cameron", "Canadá", "1954/08/16", "M");
INSERT INTO tbl_diretor VALUES(3, "José Padilha", "Brasil","1967/08/01", "M");
INSERT INTO tbl_diretor VALUES(4, "George Lucas", "Estados Unidos", "1944/05/14", "M");
INSERT INTO tbl_diretor VALUES(5, "Alan Rickman", "Inglaterra", "1946/02/21", "M");
INSERT INTO tbl_diretor VALUES(6, "Fernando Meirelles", "Brasil", "1965/11/09", "M");

#Tabela Genero
INSERT INTO tbl_genero(id_genero, genero) VALUES(1, "Terror");
INSERT INTO tbl_genero(id_genero, genero) VALUES(2, "Ação");
INSERT INTO tbl_genero(id_genero, genero) VALUES(3, "Comédia");
INSERT INTO tbl_genero(id_genero, genero) VALUES(4, "Drama");
INSERT INTO tbl_genero(id_genero, genero) VALUES(5, "Suspense");
INSERT INTO tbl_genero(id_genero, genero) VALUES(6, "Ficção");
INSERT INTO tbl_genero(id_genero, genero) VALUES(7, "Romance");
INSERT INTO tbl_genero(id_genero, genero) VALUES(8, "Animação");

#Tabela filmes
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
SELECT * FROM  tbl_filme;