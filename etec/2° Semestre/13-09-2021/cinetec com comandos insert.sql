# Aula - 16/08/2021 - Criação do banco de dados
# Aula - 23/08/2021 - Continuação

# DDL - (CREATE, DROP, ALTER)

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
    
    # Modos de declarar uma FK
    constraint FK_id_genero foreign key (FK_id_genero) references tbl_genero(id_genero), #Chave estrangeira modificável
    constraint FK_id_diretor foreign key (Fk_id_diretor) references tbl_diretor(id_diretor)
    #foreign key (FK_id_diretor) references tbl_diretor(id_diretor) #Chave estrangeira permanente
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
#DROP TABLE cinetec; --- causa de demissão
#DDL -> CREATE, ALTER, DROP

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

# Aula - 13/09/2021 - Aprendendo sobre DML (Data manipulation language) -insert, update, delete e "talvez" o select

#Aprendendo sobre o comando insert
# não se usa as tabelas que possuem fk

#Primeiro exemplo - informando a pk
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento) VALUES(2, "Andrew Garfield", "M", "1983/08/20");
SELECT * FROM  tbl_ator; # O * significa tudo

#Segundo exemplo - Omitindo a pk
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Jennifer Lawrence", "F", "1990/08/15");

#Terceiro exemplo - Omitindo as colunas da tabela
INSERT INTO tbl_ator VALUES(4, "Emma Stone", "F", "1988/11/06"); #Quando não se especifica quais são as colunas, é necessário colocar todos os dados (mesmo tendo auto_increment)

#Quarto exemplo - Inserindo informações com valores "já informados 
CREATE TABLE meu_exemplo(
	id_exemplo int primary key auto_increment,
    data_registro datetime default now(), #Informa a data e hora
    nacionalidade varchar(45) not null default "brasileiro(a)",
    sexo ENUM("F","M") #Só é permitido o cadastro de F ou M
);

#INSERT INTO meu_exemplo(data_registro) VALUES("2021-09-13 20:08:40");
INSERT INTO meu_exemplo(data_registro, nacionalidade, sexo) VALUES(default, default,"F");
INSERT INTO meu_exemplo(data_registro, nacionalidade, sexo) VALUES(default, "Argentino","M");

