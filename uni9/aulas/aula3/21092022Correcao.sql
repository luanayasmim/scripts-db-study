Aluno			Matric,Nome, Telefone, Endereco, UF
Hist�rico 		IDTurma, Matric, Nota
Turma			IDTurma, Sala, IDInst, IDCurso
Curso			IDCurso, Nome, Carga_Horaria, Preco, Pre_requisito
Instrutor		IDInst, Nome, Telefone, DtAdm,Salario


1-)	Crie a tabela INSTRUTOR (a partir da estrutura mostrada na tabela 1),
j� inserindo durante a cria��o, as constraints necess�rias. O nome do 
instrutor n�o pode estar vazio.
Obs: os campos em negrito representam uma chave prim�ria.

CREATE TABLE INSTRUTOR
(
IDINST		NUMBER(3)	 CONSTRAINT INSTRUTOR_IDINST_PK PRIMARY KEY	,
NOME		VARCHAR2(50) NOT NULL									,
TELEFONE	VARCHAR2(15)											,
DTADM		DATE													,
SALARIO		NUMBER(7,2)
)

2-) Apague do banco de dados a constraint de chave prim�ria da tabela
INSTRUTOR, inserindo-a novamente. 

ALTER TABLE INSTRUTOR DROP CONSTRAINT INSTRUTOR_IDINST_PK
-- OU
ALTER TABLE INSTRUTOR DROP PRIMARY KEY

ALTER TABLE INSTRUTOR 
ADD
(
CONSTRAINT INSTRUTOR_IDINST_PK PRIMARY KEY(IDINST)
)
-- OU
ALTER TABLE INSTRUTOR
MODIFY
(
IDINST CONSTRAINT INSTRUTOR_IDINST_PK PRIMARY KEY
)

3-)	Crie a tabela TURMA definindo as colunas e suas restri��es de chaves. 
Ocorreu algum erro? Porque ocorreu este erro? Fa�a o exerc�cio 5 e 
retorne para este exerc�cio criando a tabela, inclusive com a chave 
prim�ria.

CREATE TABLE TURMA
(
IDTURMA		NUMBER(4)												 ,
SALA		NUMBER(2)												 ,
IDINST		NUMBER(3)												 ,
IDCURSO		NUMBER(3)												 ,
CONSTRAINT TURMA_IDTURMA_PK PRIMARY KEY(IDTURMA)					 ,
CONSTRAINT TURMA_IDINST_FK  FOREIGN KEY(IDINST)  REFERENCES INSTRUTOR,
CONSTRAINT TURMA_IDCURSO_FK FOREIGN KEY(IDCURSO) REFERENCES CURSO
)

4-) Crie a tabela ALUNO com todas as constraints.

CREATE TABLE ALUNO
(
MATRIC		NUMBER(4)					,
NOME		VARCHAR2(50)	NOT NULL	,
TELEFONE	VARCHAR2(15)				,
ENDERECO	VARCHAR2(80)				,
UF			CHAR(2)						,
PRIMARY KEY(MATRIC)
)

5-) Crie a tabela CURSO j� com as constraints necess�rias.

CREATE TABLE CURSO
(
IDCURSO		NUMBER(3)		PRIMARY KEY			,
NOME		VARCHAR2(50)	NOT NULL			,
CARGAHOR	NUMBER(3)							,
PRECO		NUMBER(7,2)							,
PREREQ		VARCHAR2(200)		
)

6-) Apague a tabela ALUNO, apagando tamb�m, todas as suas restri��es. 
Em seguida, crie-a novamente apenas com os campos, sem definir restri��es.

DROP TABLE ALUNO CASCADE CONSTRAINT

CREATE TABLE ALUNO
(
MATRIC		NUMBER(4)					,
NOME		VARCHAR2(50)				,
TELEFONE	VARCHAR2(15)				,
ENDERECO	VARCHAR2(80)				,
UF			CHAR(2)						
)

7-) Insira todas as restri��es necess�rias na tabela ALUNO.

ALTER TABLE ALUNO
MODIFY
(
MATRIC	PRIMARY KEY		,
NOME 	NOT NULL
)

8-) Crie a tabela HISTORICO j� com as constraints necess�rias.

CREATE TABLE HISTORICO
(
IDTURMA		NUMBER(4)						,
MATRIC		NUMBER(4)	REFERENCES ALUNO	,
NOTA		NUMBER(3,1)						,
FOREIGN KEY(IDTURMA) REFERENCES TURMA		,
PRIMARY KEY(IDTURMA, MATRIC)
)

--OU
CREATE TABLE HISTORICO
(
IDTURMA		NUMBER(4)													,
MATRIC		NUMBER(4)	CONSTRAINT HISTORICO_MATRIC_FK REFERENCES ALUNO	,
NOTA		NUMBER(3,1)													,
CONSTRAINT HISTORICO_IDTURMA_FK FOREIGN KEY(IDTURMA) REFERENCES TURMA	,
CONSTRAINT HISTORICO_IDTURMA_MATRIC_PK PRIMARY KEY(IDTURMA, MATRIC)
)

9-)  N�O FAZER


10-) Altere a tabela INSTRUTOR modificando a coluna NOME para 60 caracteres.

ALTER TABLE INSTRUTOR
MODIFY
(
NOME VARCHAR2(60)
)