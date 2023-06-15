CREATE TABLE curso
(
    id_curso NUMBER(3) CONSTRAINT curso_idcurso_pk PRIMARY KEY,
    nome VARCHAR2(50) NOT NULL
)
/
CREATE TABLE aluno
(
    ra	NUMBER(10),
    nome VARCHAR2(50) NOT NULL,
    sexo CHAR(1),
    id_curso NUMBER(3),
    CONSTRAINT aluno_ra_pk	 PRIMARY KEY(ra),
    CONSTRAINT aluno_sexo_ch CHECK(sexo IN ('M', 'F','m', 'f')),
    -- OU CONSTRAINT ALUNO_SEXO_CH CHECK(SEXO = 'M' OR SEXO = 'F' OR SEXO = 'm' OR SEXO = 'f'),
    CONSTRAINT aluno_idcurso_fk FOREIGN KEY(id_curso) REFERENCES curso
)