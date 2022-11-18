/*

Pfade für DBs

.mdf Daten
.ldf   Logfile

--> Trenne Daten von Logfiles physikalisch
--pro DB evtl eig HDDs pro 

create database testdb

SAN NAS: Messen!  --> Perfmon


--RAM 
--MAX RAM
--default: 214346534  2 PB

--Gesamter RAM  - OS= MAX Wert  (4 bis 10 GB)

--MIN RAM: 0  ein Wert gilt nur, wenn belegt.. bei Konkurrenz


--TEMPDB
--eig HDDs
-- MDF und LDF auf verschieden HDDs
--8 Datendateien
--max 8 Dateien , soviele wie Kerne

-- -T1117 -T1118  Traceflag

--UPDATE eines Server.. ?!

----Was kommt in Tempdb?
#tab  ##tab
IX with sort in tempdb
ArbeitspeicherauslagerungAuslagerungen .. order by 
Zeilenversionierung --> ein Update hindert das Lesen nicht mehr


MAXDOP_ max Anzahl der Kerne für einen Abfrage

Wieviele Kerne bekommt ein Abfrage?
-- 1 oder alle

Sind mehr Kerne besser für eine Abfrage als einer?
normalerweise jein

--siehe 03_MAXDOP












*/

select * from sys.dm_os_performance_counters