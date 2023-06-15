--COMANDOS DQL - DEFINE QUERY LANGUAGE
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
/
CREATE TABLE ATOR_FILME --relacionamento estrela
(
    codAtor NUMBER(4),
    codFilme NUMBER(4) CONSTRAINT atorFilme_codFilme_fk REFERENCES FILME,
    
    CONSTRAINT atorFilme_codAtor_fk FOREIGN KEY(codAtor) REFERENCES ATOR,
    
    --Definindo uma chave primária composta
    CONSTRAINT atorFilme_codAtorFilme_pk PRIMARY KEY (codAtor, codFilme)
)
/
CREATE TABLE  CLIENTE_DVD  --Relacionamento Aluga
(
    codCliente NUMBER(4) REFERENCES CLIENTE,
    numDvd NUMBER(4) REFERENCES DVD,
    dataRetirada DATE,
    dataDevolucao DATE,
    
    PRIMARY KEY (codCliente, numDvd, dataRetirada) -- Chave primária composta
)
/
--Comandos de alter table
CREATE TABLE FUNCIONARIO
(
    idFuncionario NUMBER(2),
    nome VARCHAR2(50)
)

ALTER TABLE FUNCIONARIO ADD --Adicionando novas colunas
(
    cpf VARCHAR2(14) NOT NULL, --Caso exista registro na tabela, ele não vai funcionar
    enderenco VARCHAR2(80)
);

ALTER TABLE FUNCIONARIO ADD -- Adicionando constraint de chave primária
(
    CONSTRAINT FUNCIONARIO_idFuncionario_PK PRIMARY KEY(idFuncionario),
    CONSTRAINT FUNCIONARIO__cpf_uu UNIQUE(cpf)
);

--Modificando o tipo do campo
ALTER TABLE FUNCIONARIO MODIFY --Caso a tabela tenha dados, não será possivel mudar
(
    cpf NUMBER(11)CONSTRAINT FUNCIONARIO_cpf_nn NOT NULL
    --Caso não preciso mudar o tipo
    --cpf CONSTRAINT FUNCIONARIO_cpf_nn NOT NULL
);

--Excessão de not null / Não é possivel adicionar uma constraint de not null com o alter .. add, se usa o modify

--Excluindo uma constraint
ALTER TABLE FUNCIONARIO DROP CONSTRAINT SYS_C007378;

--Apagando coluna Cpf
ALTER TABLE FUNCIONARIO DROP COLUMN cpf;

--Renomeando a coluna
ALTER TABLE FUNCIONARIO RENAME COLUMN endereco TO adress;

--Renomeando a tabela funcionario
ALTER TABLE Func RENAME TO FUNCIONARIO;
--OU
RENAME FUNCIONARIO TO FUNC;

--DROP TABLE
--Não é possivel excluir tabelas que tenham algum tipo de relacionamento externo (que outra tabela tenha ela como fk)
DROP TABLE FUNCIONARIO CASCADE CONSTRAINT; --Rompe todo e qualquer tipo de relacionamento com outras tabelas para que possa ser excluida, 
--porém os dados do campo "fk" da outra tabela continua com os dados