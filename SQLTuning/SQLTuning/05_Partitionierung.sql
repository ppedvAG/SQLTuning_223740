--
/*

Tabelle UMSATZ (seit 2000)

--Was ist besser:

Tabelle A mit 1000 
Tabelle B mit 100000

Abfrage, die 10 DS liefert
A und B sind absolut identisch

-welche ist schneller 2Sek

--Salamitaktik


*/

create table u2022 (id int identity, jahr int, spx char(50))

create table u2021 (id int identity, jahr int, spx char(50))

create table u2020 (id int identity, jahr int, spx char(50))

create table u2019 (id int identity, jahr int, spx char(50))


select * from umsatz --? geht nich mehr

--View

create view Umsatz
as
select * from u2022
UNION ALL
select * from u2021
UNION ALL
select * from u2020
UNION ALL
select * from u2019


select * from umsatz where jahr = 2021 --Plan: alle Tabellen
select * from umsatz where id = 2021 --Plan: alle Tabellen

--Datentyp: null oder not null


-- SQL 2019.. seit SQL 2016 + Sp1

--STD = ENT


--Partitionierung
--Dateigruppe
--tabelle gezielt auf andere Datenträger legen

create table test2 (id int)  --mdf
create table test2 (id int)   ON HOT

create table () ON Dateigruppe


--Kann ich Tabellen auf andere Dateigruppen verschieben?
--kein Alter zum Verschieben

--Tipp: geht über Entwurfsansicht der tabelle, aber besser per IX Erstellung (CL IX )


--Partitionierung

---------------100]------------------200]-------------------------------------
--         1                           2                                       3

select f(117)--> 2

--Partitionsfunktion

create partition function fzahl(int)
as
RANGE LEFT FOR VALUES(100,200)


select $partition.fzahl(117) --2 

-- 4 Dgruppen:        bis100    bis200       bis5000        rest


--Verteiler auf Dgruppen: PartSchema

create partition scheme SchZahl
as
partition fzahl to (bis100,bis200, rest)
---                             1             2       3

--Tabelle auf Schema
create table parttab
		(id int identity, nummer int, spx char(4100)) ON schZahl(nummer)


declare @i as int = 1
begin tran
while @i<=20000
	begin
		     insert into parttab (nummer,spx) values (@i, 'XY')
			set @i+=1
	end
Commit


set statistics io, time on
select * from parttab where nummer = 117
select * from parttab where Id = 117


select * from parttab where nummer = 1170

	--Warum ist das schneller als GO 20000


	------------------------200---------------
	--viele Abfragen in Bereich über 200
	-- 200 und 5000

	--neue Grenze

	----------100]------200]--------------------5000]------------------------
	-- Tabelle, f(), schema, Dateigruppen
	--Tabelle: nie
	--Dateigruppen:  bis5000
	--F():  muss man ändern
	--schema: ändern

alter  partition scheme SchZahl next used bis5000

---                             1             2       3


alter  partition function fZahl() split range(5000)


select $partition.fzahl(nummer), min(nummer),max(nummer),count(*)
from parttab
group by $partition.fzahl(nummer)


select * from parttab where nummer = 1117


--Grenze entfernen

-------------x-------------200--------------5000------------------

--Tabelle: nie
--F(): ja
--Schema: nein
--Dategruppe: nein

alter partition function fzahl() merge range(100)




--------200 ------------------5000---------------




--Archivieren



create table archiv (id int not null, nummer int, spx char(4100)) on bis200


alter table parttab switch partition 1 to archiv

select * from archiv

select * from parttab

--was wäre wenn: 100MB /sek 
--Archivieren von 1000000000000000MB  0,x sek






create partition function fdatum(datetime)
as
   ('31.12.1997 23:59:59.997')

   -----1997----1998

   create partition function fdatum(varchar(50))
as
   ('n','t')
   --a bis m   n bis s        t bis z

create partition scheme schzahl
as partition  fzahl all to ([PRIMARY])

where partspl=2323 and Fam= Rauch


10000 Kopfzeilen
1MIO POS

TAB SCAN   HEAP SCAN  IX SEEK
                      IX HEAP 

					  500 DS-- POS


--Holger Schmeling  2014 
SQLServercentral.com


















--HOT STAMM


















