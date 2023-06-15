# Aula - 30/08/2021

CREATE DATABASE teste; #Criando um banco de dados
USE teste;

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

#Exemplo de tabela de clientes
CREATE TABLE tbl_clientes(
	id_cliente int,
    nome_cliente varchar(45),
    FK_id_genero int
);

#Outros comandos
SHOW TABLES; #Mostrar tabelas
DESC tbl_clientes; #DESC = decribe , Descrever a tabela

# Exemplos de comandos com ALTER - (add, modify,)
ALTER TABLE tbl_ator ADD email varchar(80) not null; #Acrescentando novas colunas em uma tabela
ALTER TABLE tbl_clientes ADD primary key(id_cliente); #Acrescentando uma PK a tabela clientes
ALTER TABLE tbl_ator MODIFY email varchar(100); #Modificando a estrutura da coluna de email
ALTER TABLE tbl_ator CHANGE email  email_ator varchar(100); #Alterar a nomenclatura das colunas
ALTER TABLE tbl_ator DROP email_ator; # Remover um campo de uma tabela
ALTER TABLE tbl_clientes DROP primary key; #Removendo uma PK
# Não é possivel remover uma PK que esta sendo usada em outra tabela como FK
ALTER TABLE tbl_filme DROP foreign key FK_id_genero; #Removendo um FK de uma determinada tabela
ALTER TABLE tbl_filme DROP foreign key FK_id_diretor; #Não é possivel remover um FK que foi feita sem constraint
ALTER TABLE tbl_clientes ADD constraint fk_teste foreign key(FK_id_genero) references tbl_genero(id_genero); #Adicionando um constraint
ALTER TABLE tbl_clientes RENAME tabela_de_cliente; #Alterando uma nomenclatura de uma tabela