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
    foreign key (FK_id_diretor) references tbl_diretor(id_diretor) #Chave estrangeira permanente
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


#DROP TABLE cinetec; --- causa de demissão

#DDL -> CREATE, ALTER, DROP