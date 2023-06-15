update categoria set codcateg=8 where codcateg=1;
update filme set codcateg=null where codcateg=1;
update filme set codcateg=8 WHERE codcateg is null;

--4
alter table filme add(
    sinopse varchar2(300)
);

--5
insert into categoria (codcateg, descricao) values(5, 'Ficção');

select * from categoria;

--6
--delete from table ou delete table
delete from filme where codfilme=3 or codfilme=8;

--Todos os comandos dql fazem um commit automatico quando são feitos
--O comando rollback volta todas as transações dml pendentes