--Lista de exerc�cios 3

--1) Consulte todos os empregados da tabela EMP, mostrando todos os campos
select * from EMP;

--2) Consulte os empregados (todos os campos) que ganham acima de 3000 (inclusive 3000).
select * from emp where sal>=3000;

/*3) Consulte os cargos da tabela EMP sem repeti��o, alterando o cabe�alho de JOB para 
CARGOS.*/
select DISTINCT job as "Cargos" from emp;

--4) Consulte todos os departamentos existentes na tabela DEPT, mostrando todos os campos.
select * from dept;

--5) Consulte o nome do departamento da tabela DEPT cujo n�mero seja igual a 30.
select dname from dept where deptno=30;

/*6) O empregado chamado �SMITH� recebeu um aumento de sal�rio. Altere seu sal�rio de 800
para 1300.*/
update emp set sal=1300 where ENAME='SMITH';

/*7) Consulte o nome dos empregados, sal�rio e n�mero do departamento da tabela EMP
considerando apenas quem foi contratado em 81. Utilize o operador LIKE.*/
select ename, sal, deptno from emp where hiredate like '%81';

/*8) Consulte o nome dos empregados, seu cargo e sal�rio, mostrando os sal�rios em ordem 
crescente.*/
select ename, job, sal from emp order by ename;

/*9) Um novo empregado foi contratado, sendo que seus dados dever�o ser cadastrados na 
tabela EMP. Seu c�digo � 1200, seu nome � Ant�nio e ele trabalha como mec�nico. Foi 
contratado na data de hoje, por um sal�rio de R$ 2.500,00. Ele trabalha no departamento 
SALES e n�o recebe comiss�o. Insira esse registro.*/
--insert into emp (empno, ename, job, hiredate, sal, deptno, comm) values (1200, "Ant�nio", "Mec�nico", "05/10/2022", 2500, 30, 0);
INSERT INTO EMP
(EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO)
VALUES
(1200, 'ANT�NIO', 'MEC�NICO', 2500, '05/10/22', 30);
