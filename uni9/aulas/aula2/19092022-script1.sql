CREATE TABLE CATEGORIA
(
    codcateg NUMBER(4) CONSTRAINT categoria_pk PRIMARY KEY,
    descricao VARCHAR2(50) NOT NULL,
    
    CONSTRAINT categoria_desc_uk UNIQUE (descricao)
)
/
CREATE TABLE CLIENTE
(
    codcli NUMBER(4) CONSTRAINT cliente_codcli_pk PRIMARY KEY,
    prenome VARCHAR2(50) NOT NULL,
    sobrenome VARCHAR2(50), 
    endereco VARCHAR2(70), 
    telefone VARCHAR2(20)
)
/
CREATE TABLE ATOR
(
    codator NUMBER(4) CONSTRAINT ator_codator_pk PRIMARY KEY,
    nome_popular VARCHAR2(50) CONSTRAINT ator_nome_nn NOT NULL,
    nome_artistico VARCHAR2(50), 
    datanasc DATE
)
/
CREATE TABLE FILME
(
    codFilme number(4),
    titulo varchar(2) not null,
    codCateg number(4),
    
    CONSTRAINT filme_codFilme_pk PRIMARY KEY (codFilme),
    CONSTRAINT filme_codCateg_fk FOREIGN KEY(codCateg) REFERENCES categoria /*Declarando chave primária fora da linha*/
)
/
CREATE TABLE DVD
(
    numDvd NUMBER(4) CONSTRAINT dvd_numDvd_pk PRIMARY KEY,
    tipo char(1) CONSTRAINT dvd_tipo_ch CHECK (tipo in('S', 's', 'D', 'd')),
    codFilme NUMBER(4) CONSTRAINT dvd_codFilme_fk REFERENCES FILME /*Declarando constraint da chave primária em linha*/
)