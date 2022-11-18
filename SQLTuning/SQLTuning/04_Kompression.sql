dbcc showcontig('ku1')
--- Gescannte Seiten.............................: 40454
--- Mittlere Seitendichte (voll).....................: 98.21%

set statistics io, time on

select * from ku1 where customerid = 'ALFKI' --40454 Seiten


--Reduzieren der Seitenzahlen
--Datenzeilen löschen-- im Sinne ins Archiv schieben
--statt Scan --Seek: Indizes
--Datentypen.. statt char lieber varchar   
--Kompression
--Zeilenkompression: Datentypen gekürzt und DS werden in weniger Seiten zusammengezogen  -- gut bei Text
--Seitenkompression: zuerst Zeilenkompression, Präfixkompression
--- 40-60%

--Spieltabelle
create table test1 (id int identity, spx char(4100))


insert into test1 select 'XY'
GO 20000 --15 Sekunden

--Test1 : 160MB

dbcc showcontig('test1') --20000 Seiten --> 160MB 


--Neustart
set statistics io, time on

select * from northwind..test1

--RAM + 160MB
--20000 Seiten
--, CPU-Zeit = 297 ms, verstrichene Zeit = 1316 ms.
, CPU-Zeit = 109 ms, verstrichene Zeit = 1178 ms.

--Kompression

--test1--> wesentlich kleiner
--RAM nach Abfrage: gleich wie zuvor   oder weniger!
--Seiten: weniger
--CPU .. mehr oder weniger   Dauer: schneller
--
--test1 = 0,5 MB
--der Client hat keine Ahnung, dass die Tabelle komprimiert ist

--Seiten kommen 1:1 in RAM
--RAM +0,5 MB
--, CPU-Zeit = 109 ms, verstrichene Zeit = 1178 ms.

--Realität: 40 bis 60% Kompression












