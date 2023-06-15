--Lista de exerc�cios 2 / 21/09/2022

CREATE TABLE tblAluno(
    matricula number(4) CONSTRAINT tblAluno_matricula_pk PRIMARY KEY,
    nome varchar2(100) not null,
    telefone number(11) not null,
    endereco varchar2(100) not null,
    uf varchar2(2) not null
)
/
CREATE TABLE tblCurso(
    idCurso number(3) CONSTRAINT tbl_curso_idCurso_pk PRIMARY KEY,
    nome varchar(20) not null CONSTRAINT tblCurso_nome_uu UNIQUE,
    cargaHoraria number(2) not null,
    preco number(7,2) not null,
    preRequisito varchar(100)
)
/
CREATE TABLE tblInstrutor(
    idInst number(3) CONSTRAINT tblInstrutor_idInst_pk PRIMARY KEY,
    nome varchar2(100) not null,
    telefone varchar(15),
    dtAdm date,
    salario number(7,2)
)
/
CREATE TABLE tblTurma(
    idTurma number(3) CONSTRAINT tblTurma_idTurma_pk PRIMARY KEY,
    sala number(3),
    idInst number(3),
    idCurso number(3),
    
    CONSTRAINT tblTurma_idInst_fk FOREIGN KEY(idInst) REFERENCES tblInstrutor,
    CONSTRAINT tblTurma_idCurso_fk FOREIGN KEY(idCurso) REFERENCES tblCurso
)

/
CREATE TABLE tblHistorico(
    idTurma number(3),
    matricula number(4),
    nota number(2) not null,
    
    CONSTRAINT tblHistorico_idTurma_matricula_pk PRIMARY KEY(idTurma, matricula),
    CONSTRAINT tblHistorico_idTurma_fk FOREIGN KEY (idTurma) REFERENCES tblTurma,
    CONSTRAINT tblHistorico_matricula_fk FOREIGN KEY (matricula) REFERENCES tblCurso
)

/*
    1-) Crie a tabela INSTRUTOR (a partir da estrutura mostrada na tabela 1), j� inserindo 
    durante a cria��o, as constraints necess�rias. O nome do instrutor n�o pode estar 
    vazio.
    Obs: os campos em negrito representam uma chave prim�ria.
*/
CREATE TABLE tblInstrutor(
    idInst number(3) CONSTRAINT tblInstrutor_idInst_pk PRIMARY KEY,
    nome varchar2(100) not null,
    telefone varchar(15),
    dtAdm date,
    salario number(7,2)
)
/*
    2-) Apague do banco de dados a constraint de chave prim�ria da tabela INSTRUTOR, 
    inserindo-a novamente. 
*/
ALTER TABLE tblInstrutor DROP CONSTRAINT tblInstrutor_idInst_pk;

ALTER TABLE tblInstrutor add CONSTRAINT tblInstrutor_idInst_pk PRIMARY KEY;


/*
    3-) Crie a tabela TURMA definindo as colunas e suas restri��es de chaves. Ocorreu 
    algum erro? Porque ocorreu este erro? Fa�a o exerc�cio 5 e retorne para este 
    exerc�cio criando a tabela, inclusive com a chave prim�ria.
*/
CREATE TABLE tblTurma(
    idTurma number(3) CONSTRAINT tblTurma_idTurma_pk PRIMARY KEY,
    sala number(3),
    idInst number(3),
    idCurso number(3),
    
    CONSTRAINT tblTurma_idInst_fk FOREIGN KEY(idInst) REFERENCES tblInstrutor,
    CONSTRAINT tblTurma_idCurso_fk FOREIGN KEY(idCurso) REFERENCES tblCurso
)
/*
    4-) Crie a tabela ALUNO com todas as constraints.
*/
CREATE TABLE tblAluno(
    matricula number(4) CONSTRAINT tblAluno_matricula_pk PRIMARY KEY,
    nome varchar2(100) not null,
    telefone number(11) not null,
    endereco varchar2(100) not null,
    uf varchar2(2) not null
)
/*
    5-) Crie a tabela CURSO j� com as constraints necess�rias.
*/
CREATE TABLE tblCurso(
    idCurso number(3) CONSTRAINT tbl_curso_idCurso_pk PRIMARY KEY,
    nome varchar(20) not null CONSTRAINT tblCurso_nome_uu UNIQUE,
    cargaHoraria number(2) not null,
    preco number(7,2) not null,
    preRequisito varchar(100)
)
/*
    6-) Apague a tabela ALUNO, apagando tamb�m, todas as suas restri��es. Em seguida,
    crie-a novamente apenas com os campos, sem definir restri��es.
*/
DROP TABLE tblAluno CASCADE CONSTRAINT;
CREATE TABLE tblAluno(
    matricula number(4),
    nome varchar2(100),
    telefone number(11),
    endereco varchar2(100),
    uf varchar2(2)
)
/*
    7-) Insira todas as restri��es necess�rias na tabela ALUNO.
*/
ALTER TABLE tblAluno MODIFY(
    idCurso CONSTRAINT tbl_curso_idCurso_pk PRIMARY KEY,
    nome not null
)

/*
    8-) Crie a tabela HISTORICO j� com as constraints necess�rias.
*/
CREATE TABLE tblHistorico(
    idTurma number(3),
    matricula number(4),
    nota number(2) not null,
    
    CONSTRAINT tblHistorico_idTurma_matricula_pk PRIMARY KEY(idTurma, matricula),
    CONSTRAINT tblHistorico_idTurma_fk FOREIGN KEY (idTurma) REFERENCES tblTurma,
    CONSTRAINT tblHistorico_matricula_fk FOREIGN KEY (matricula) REFERENCES tblCurso
)

--10-) Altere a tabela INSTRUTOR modificando a coluna NOME para 60 caracteres
ALTER TABLE INSTRUTOR
MODIFY
(
NOME VARCHAR2(60)
)