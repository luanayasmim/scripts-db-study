drop database  cineetec;
# Criando nooso banco de dados
create database cineetec;

# Especificando o banco que iremos usar
use cineetec;

# Criando as tabelas
create table tbl_genero(
	id_genero int primary key auto_increment,
    genero varchar(45) not null
);

create table tbl_ator(
	id_ator int primary key auto_increment,
    nome_ator varchar(45) not null,
    sexo varchar(1) not null,
    dt_nascimento date not null
);


create table tbl_diretor(
	id_diretor int primary key auto_increment,
    nome_diretor varchar(45) not null,
    nacionalidade varchar(10) not null,
    dt_nascimento date not null
);

create table tbl_filme(
	id_filme int primary key auto_increment,
    nome_filme_pt varchar(45) not null,
    nome_filme_en varchar(45),
    ano_lancamento int(4) not null,
    duracao int(3) not null,
    FK_id_genero int not null,
    FK_id_diretor int not null,
    constraint FK_id_genero foreign key(FK_id_genero) references tbl_genero(id_genero),
    # ou pode-se retirar o constraint ...
    foreign key(FK_id_diretor) references tbl_diretor(id_diretor)
);

create table tbl_filme_has_tbl_ator(
	FK_id_filme int not null,
    FK_id_ator int not null,
    primary key(FK_id_filme, FK_id_ator),
    constraint FK_id_filme foreign key(FK_id_filme) references tbl_filme(id_filme),
    constraint FK_id_ator foreign key(FK_id_ator) references tbl_ator(id_ator)
);

#1º Acrescentar na tabela DIRETOR o campo sexo sendo varchar(1) e não nulo. 
alter table tbl_diretor add sexo varchar(1) not null;

#2º Na tabela DIRETOR alterar o tamanho do campo NACIONALIDADE para varchar(45).
alter table tbl_diretor modify nacionalidade varchar(45) not null;

#3º Na tabela FILME excluir a coluna NOME_FILME_EN e alterar NOME_FILME_PT para apenas NOME_FILME.
alter table tbl_filme drop nome_filme_en;
alter table tbl_filme change nome_filme_pt nome_filme varchar(45) not null;

#4º Renomear a tabela TBL_FILME_HAS_TBL_ATOR para FILME_E_ATOR.
alter table tbl_filme_has_tbl_ator rename filme_e_ator;

# Inserindo Atores no cineEtec()



select * from tbl_ator;
show tables;
desc tbl_ator;


