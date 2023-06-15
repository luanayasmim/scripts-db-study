--26/09/2022 DML
--Comando insert
insert into tblinstrutor(idinst, nome, telefone, dtadm, salario) VALUES(1, 'José Marinho', '9999-1234', SYSDATE, 2000)
/
insert into tblinstrutor(idinst, nome, telefone, dtadm, salario) VALUES(2, 'Euler Soares', '4343-2000', SYSDATE, 1850.18)
/
select * from categoria;
--Ou informe valores seguindo a organização do banco
--insert into tblinstrutor VALUES(1, 'José Marinho', '9999-1234', sysdate, '2000.00')

--Exercicio locadoura
insert into categoria(codcateg, descricao) values (1, 'Comédia');
insert into categoria(codcateg, descricao) values (2, 'Drama');
--Utilizando parametro
insert into categoria values (&codigo, '&descricao');

/*é possivel apagar um registro que faça relacionamento com outra tabela des de que não seja utilizado por outro dado.
    Por exemplo  * Apagar 4 ação onde não tenha nenhum registro de filme utilizando essa categoria
*/

insert into filme(codfilme, titulo, codcateg) values (1, 'Sai pra lá', 1);
alter table filme modify (
    titulo varchar2(100)
);

insert into categoria(Codcateg,descricao)
Values(4,'Terror')
;
insert into filme(Codfilme, titulo, codcateg)
Values(2,'Ajuda Eterna', 2)
;
insert into filme(Codfilme, titulo, codcateg)
Values(3,'Anjos Malditos',2)
;
insert into filme(Codfilme, titulo, codcateg)
Values(4,'Pânico II', 4)
;
insert into filme(Codfilme, titulo, codcateg)
Values(5,'Um dia de fúria', 3)
;
insert into filme(Codfilme, titulo, codcateg)
Values(6,'Lente Cega', 3)
;
insert into filme(Codfilme, titulo, codcateg)
Values(7,'Sinais do Tempo', 2)
;
insert into filme(Codfilme, titulo, codcateg)
Values(8,'A melodia da vida', 1)
;
insert into dvd(numdvd, tipo,codfilme)
Values(1, 'S',1)
;
insert into dvd(numdvd, tipo,codfilme)
Values(2, 'D',1)
;
insert into dvd(numdvd, tipo,codfilme)
Values(3, 'S',1)
;
insert into dvd(numdvd, tipo,codfilme)
Values(4, 'S',2)
;
insert into dvd(numdvd, tipo,codfilme)
Values(5, 'D',3)
;
insert into cliente(Codcli, prenome, sobrenome, endereco, telefone)
Values(1,'João', 'Silva', 'Rua da Cruz sem Pé', '4444-1111')
;
insert into cliente(Codcli, prenome, sobrenome, endereco, telefone)
Values(2,'Antônio', 'Ferreira', 'Av. da Vila Velha', '6660-9333')
;
insert into cliente(Codcli, prenome, sobrenome, endereco, telefone)
Values(3,'Fábio', 'Dias', 'Rua Antônio Vieira', '2337-0393')
;
insert into cliente(Codcli, prenome, sobrenome, endereco, telefone)
Values(4,'Andréia', 'Melo', 'Rua da Praia Bonita', '8989-7777')
;
insert into cliente(Codcli, prenome, sobrenome, endereco, telefone)
Values(5,'Murilo', 'Fontes', 'Av. dos Autonomistas', '9090-9090')
;

CREATE TABLE LOCACAO  
(
CODCLI		NUMBER(4)	REFERENCES CLIENTE		,
NUMDVD		NUMBER(4)	REFERENCES DVD			,
DATARET		DATE								,
DATADEV		DATE								,
PRIMARY KEY(CODCLI, NUMDVD, DATARET)
);

INSERT INTO LOCACAO (CODCLI, NUMDVD, DATARET, DATADEV) VALUES (1, 4, to_date('05/12/1989', 'dd/mm/yy'),to_date('06/12/1990','dd/mm/yy'));

INSERT INTO LOCACAO (CODCLI, NUMDVD, DATARET, DATADEV) VALUES (1, 2, to_date('18/12/1989','dd/mm/yy'), to_date('06/12/1990', 'dd/mm/yy'));

INSERT INTO LOCACAO (CODCLI, NUMDVD, DATARET, DATADEV) VALUES (2, 1, to_date('20/12/1989', 'dd/mm/yy'),to_date('06/12/1990', 'dd/mm/yy'));

INSERT INTO LOCACAO (CODCLI, NUMDVD, DATARET, DATADEV) VALUES (2, 2, to_date('15/11/1989','dd/mm/yy'), to_date('06/12/1990', 'dd/mm/yy'));

INSERT INTO LOCACAO (CODCLI, NUMDVD, DATARET, DATADEV) VALUES (2, 3, to_date('03/08/1989','dd/mm/yy'), to_date('06/12/1990','dd/mm/yy'));

INSERT INTO LOCACAO (CODCLI, NUMDVD, DATARET, DATADEV) VALUES (3, 4, to_date('02/09/1989', 'dd/mm/yy'), to_date('06/12/1990', 'dd/mm/yy'));

INSERT INTO LOCACAO (CODCLI, NUMDVD, DATARET, DATADEV) VALUES (3, 5, to_date('02/05/1989', 'dd/mm/yy'), to_date('06/12/1990', 'dd/mm/yy'));

INSERT INTO LOCACAO (CODCLI, NUMDVD, DATARET, DATADEV) VALUES (4, 1, to_date('01/01/1989', 'dd/mm/yy'), to_date('06/12/1990', 'dd/mm/yy'));

INSERT INTO LOCACAO (CODCLI, NUMDVD, DATARET, DATADEV) VALUES (4, 4, to_date('06/11/1989', 'dd/mm/yy'), to_date('06/12/1990', 'dd/mm/yy'));

INSERT INTO LOCACAO (CODCLI, NUMDVD, DATARET, DATADEV) VALUES (2, 4, to_date('08/08/1989', 'dd/mm/yy'), to_date('06/12/1990', 'dd/mm/yy'));

INSERT INTO LOCACAO (CODCLI, NUMDVD, DATARET, DATADEV) VALUES (5, 5, to_date('09/01/1989', 'dd/mm/yy'), to_date('06/12/1990', 'dd/mm/yy'));

COMMIT;

--Exercícios
--3-) Altere o número da categoria Comédia de 01 para 08 na tabela CATEGORIA.
update filme set codcateg =8 where codcateg= 1;
insert into categoria(codcategoria) values (8, "Cómedia");
delete from categoria where codcateg = 1;
--Update categoria set codcateg = 8 where codcateg=1;

--4-) Insira a coluna SINOPSE na tabela FILME com 300 caracteres.
alter table filme add(
    sinopse varchar2(300)
);

--5-) Cadastre uma nova categoria de filme chamada FICÇÃO.
insert into categoria(codcateg, descricao) values(9, "Ficção");


--6-) Apague o filme chamado “Anjos Malditos” e “A melodia da vida” da tabela FILME. Para
--isso, utilize um único comando.
select * from filme
delete from filme 
