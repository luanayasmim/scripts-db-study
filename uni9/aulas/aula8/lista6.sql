/*
34) Consulte o nome do empregado, salario e o numero do departamento em que trabalha,
apresentando dados apenas dos empregados que tem o maior salario por departamento.
Faca o comando utilizando uma subquery.
*/
select ename, sal, deptno from emp where sal in (select max(sal) from emp group by deptno)
/

/*
35) Consulte os cargos dos empregados da tabela emp apresentando a soma dos salarios
gastos por cargo. Altere os cabecalhos para Cargos e Total de Salario e classifique
por cargo o resultado final.
*/
select deptno as "Cargos", sum(sal) as "Total de Salario" from emp group by deptno
/

/*
36) Selecione todos os dados dos empregados SMITH e TURNER da tabela EMP.
*/
select * from emp WHERE ename in('SMITH', 'TURNER')
SELECT	*
FROM	EMP
WHERE	ENAME = 'SMITH' OR ENAME = 'TURNER'
/
/*
37) O que esta errado no comando abaixo?
 SELECT JOB, AVG(SAL) FROM EMP GROUP BY SAL
*/
SELECT JOB, AVG(SAL) FROM EMP GROUP BY SAL
SELECT JOB, AVG(SAL) FROM EMP GROUP BY JOB
/
/*
38) O que esta errado no comando abaixo?
 UPDATE EMP SAL = 4000 WHERE ENAME = 'SMITH'
*/
UPDATE EMP  SAL = 4000 WHERE ENAME = 'SMITH'
UPDATE EMP SET SAL = 4000 WHERE ENAME = 'SMITH'
/
/*
39) O empregado Smith foi transferido para o departamento OPERATIONS. Faca essa
alteracao na tabela EMP.
*/
UPDATE EMP SET DEPTNO = 'OPERATIONS' WHERE ENAME = 'SMITH'
/
--Ou (Melhor opcao)
UPDATE EMP SET DEPTNO = 'OPERATIONS' WHERE EMPNO = 7369
/
--Ou
UPDATE EMP SET DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'OPERATIONS') WHERE EMPNO  = 7369
/

/*
40) Faca uma consulta que mostre quantos funcionarios existem alocados por departamento 
e a media de salarios gastos pelos departamentos.
*/

/*
41) Selecione o menor sal�rio, o maior sal�rio e a soma dos sal�rios pagos por cargo dentro 
de cada departamento. Classifique o resultado por departamento.
*/
/*
42) Apague da tabela EMP os empregados que foram admitidos em 87. Fa�a um RollBack
em seguida.
*/
/*
43) O empregado �James foi transferido para o departamento �ACCOUNTING�. Fa�a essa
altera��o na tabela EMP utilizando uma subquery.
*/
/*
44) Consulte todos os empregados da tabela EMP que n�o possuem valores para o campo 
que representa a comiss�o. Traga apenas seu nome, n� do empregado e sal�rio, 
classificados em ordem decrescente de Nome. (Verifique a estrutura da tabela para saber 
o nome correto das colunas)
*/
