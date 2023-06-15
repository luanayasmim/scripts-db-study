--Lista de exercícios 3

--1) Consulte todos os empregados da tabela EMP, mostrando todos os campos
select * from EMP;

--2) Consulte os empregados (todos os campos) que ganham acima de 3000 (inclusive 3000).
select * from emp where sal>=3000;

/*3) Consulte os cargos da tabela EMP sem repetição, alterando o cabeçalho de JOB para 
CARGOS.*/
select DISTINCT job as "Cargos" from emp;

--4) Consulte todos os departamentos existentes na tabela DEPT, mostrando todos os campos.
select * from dept;

--5) Consulte o nome do departamento da tabela DEPT cujo número seja igual a 30.
select dname from dept where deptno=30;

/*6) O empregado chamado “SMITH” recebeu um aumento de salário. Altere seu salário de 800
para 1300.*/
update emp set sal=1300 where ENAME='SMITH';

/*7) Consulte o nome dos empregados, salário e número do departamento da tabela EMP
considerando apenas quem foi contratado em 81. Utilize o operador LIKE.*/
select ename, sal, deptno from emp where hiredate like '%81';

/*8) Consulte o nome dos empregados, seu cargo e salário, mostrando os salários em ordem 
crescente.*/
select ename, job, sal from emp order by ename;

/*9) Um novo empregado foi contratado, sendo que seus dados deverão ser cadastrados na 
tabela EMP. Seu código é 1200, seu nome é Antônio e ele trabalha como mecânico. Foi 
contratado na data de hoje, por um salário de R$ 2.500,00. Ele trabalha no departamento 
SALES e não recebe comissão. Insira esse registro.*/
--insert into emp (empno, ename, job, hiredate, sal, deptno, comm) values (1200, "Antônio", "Mecânico", "05/10/2022", 2500, 30, 0);
INSERT INTO EMP
(EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO)
VALUES
(1200, 'ANTÔNIO', 'MECÂNICO', 2500, '05/10/22', 30);
