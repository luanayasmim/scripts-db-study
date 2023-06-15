use cineetec;

#------------- CURDATE e NOW -------------
select curdate();
select now();

#-- DAY, MONTH, YEAR, HOUR, MINUTE e SECOND --
select * from tbl_ator where month(dt_nascimento) = 12;

-- ------------------ INTERVAL --------------------
# Nos permite selecionar um intervalo entre valores do tipo date e datetime
select now() + interval 3 day;
select now() + interval 3 month;
select now() - interval 1 year - interval 1 day;
select "2010-10-21" - interval 1 year data_legal;