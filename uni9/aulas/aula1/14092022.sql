/*CREATE TABLE tbl_aluno(
	ra INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	cpf	INT	UNIQUE NOT NULL
);

DROP TABLE ALUNO;
*/
CREATE DATABASE bd_locadora;
USE bd_locadora;

CREATE TABLE tbl_categoria(
	cod_categoria INT(4) PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE tbl_filme(
	cod_filme INT(4) PRIMARY KEY AUTO_INCREMENT,
    titulo varchar(70) NOT NULL,
    FK_cod_categoria INT(4),
    FOREIGN KEY (FK_cod_categoria) REFERENCES tbl_categoria (cod_categoria)
);

CREATE TABLE tbl_dvd(
	num_dvd int(4) PRIMARY KEY AUTO_INCREMENT,
	tipo char(1), 
    FK_cod_filme INT(4),
    
    CHECK(tipo='S' || tipo ='D'),
    FOREIGN KEY (FK_cod_filme) REFERENCES tbl_filme (cod_filme)
);

CREATE TABLE tbl_cliente(
	cod_cliente INT(4) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50),
    endereco VARCHAR(70),
    telefone VARCHAR(20)
);

CREATE TABLE tbl_ator(
	cod_ator INT(5) PRIMARY KEY AUTO_INCREMENT,
    nome_popular VARCHAR(50) NOT NULL,
    nome_artistico VARCHAR(50),
    data_nascimento DATE
);