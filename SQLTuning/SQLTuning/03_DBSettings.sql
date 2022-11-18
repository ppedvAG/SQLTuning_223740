create database testdb

/*

seit SQL 2016
wie groß ist eine DB per default:
.mdf  8MB    +64MB
.ldf    8MB    +64MB

vor SQL 2016
.mdf   5MB + 1MB
.ldf     2MB   + 10%

besser :
Anfangsgröße : was wird in 3 Jahren sein?
Wachstumsrate: +1024MB für DB und Logfile (das Logfile sollte nie wachsen!!!)

Sicherheitsrichtlinie: Durchführen von Volumenwartungstask: SQL Diesnt muss hier rein
--Vergrößerungen ohne Ausnullen

Kann man das sehen?
--Bericht : Datenträgerverwendung pro DB

--VLF


dbcc loginfo()--


--DB Design

--Stichworte
--rel DB Modell
--Normalformen
--PK -----ref Integrität-------->FK 
--Redundanz
--Generalisierung
--Datentypen


---Vorname  Otto

nvarchar(30)-- 8
varchar(30) --4
varchar(max) --ziemlich doof  2GB
char(30)-- 30
nchar(30)--60
text()--nicht mehr nehmen


select customerid, country from customers


create table test (id int, spx char(4100), spy char(4100))


datetime(ms)


--alle Best aus dem Jahr 1997 Orderdate
select * from orders
*/
select * from orders where year(orderdate) = 1997 --korrekt aber langsam

select * from orders where orderdate >= '1.1.1997' and orderdate < '1.1.1998'.--  korrekt und schnell

select * from orders where orderdate between '1.1.1997' and '31.12.1997 23:59:59.997' --falsch und schnell




















