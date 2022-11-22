--Erstelle eine Prozedur, die folgendes lst

exec gpsucheKunde 'A' -- alle mit a beginnend
exec gpsucheKunde 'AL' -- alle mit al beginnend..usw
exec gpsucheKunde -- alle 

--Prozeduren legen einen fixen Plan an, der auch nach Neustart immer weiter verwendet wird

create or alter  proc gpSucheKunde @KdID varchar(5)  ='%' ---??
as
select * from customers where customerid like @KdID  + '%'  ---??  where substring (customerid ,1 , Länge) = @kdid
+



--Diese Suche ist "suboptimal" ;-)... Der Plan der Prozedur ist beim Aufruf des ersten Parameters fix:
---> Bis entweder sich das Tabellenschema ändert , der Objekte wie IX gelöscht wird, oder die Prozedur nue kompiliert wird
--Folge: Scan statt seek  oder noch schmlimmer seek statt scan--> Tipp QueryStore

--Suche alle Bestellungen, aus dem Jahr 1997 heraus
--keine Suche mit F() um Spalten im Where-- wird immer ein Scan sein, nie parallelisiert werden.
--F() sind grundsätzlich keine gute Idee. SQL Server kann diese vorab nicht einschätzen
--Ausnahme InlineTabellenf()
--Erst ab SQL 2019 werden einfache Skalarfunktiionen nachgelagert in Unterabfragen übersetzt (-> Kompabilittsgrad beachten)

--Prozedurencahce löschen
dbcc freeproccache --alle Pläne des Server.. sehr sehr vorsichtig sein.--

--besser pro DB
ALTER DATABASE SCOPED CONFIGURATION CLEAR PROCEDURE_CACHE;


select * from customers
--Datentyp der Customerid: nchar(5)



--Dekalration von Variablen.... variable Datentypen werden zur Hälfte geschätzt. KOmmt noch ein Sortieroperator dazu, wirds im Speicher eng
--Besser höher schätzen und Tempdb beobachten























select * from orders where orderid = 10250  
select * from orders where orderid = 10251

select * from customers c inner join orders o on c.CustomerID= o.CustomerID where o.OrderID=10251
set statistics io, time on


select * from orders where cuStomerid = 'HANAR'

select * from Orders where customerid = 'HANAR'

select * from orders 
								where customerid = 'HANAR'


select * from employees where employeeid = 9

select * from employees where employeeid = 300

select *	 from employees 
where
employeeid = 42154




select usecounts, cacheobjtype,[TEXT] from
	sys.dm_exec_cached_plans P
		CROSS APPLY sys.dm_exec_sql_text(plan_handle)
	where cacheobjtype ='Compiled PLan'
		AND [TEXT] not like '%dm_exec_cached_plans%'

dbcc freeproccache




create table slf (id int, stadt int, land int)


insert into slf
select 1,10, 100
UNION ALL
select 2,20, 200
UNION ALL
select 3,30, 300


select * from slf

create or alter view vslf with schemabinding
as
select id, stadt, fluss from dbo.slf

alter table slf drop column stadt

select * from slf

select * from vslf


alter table slf add fluss int

update slf set fluss = id *1000

alter table slf drop column land



select * from ku1 where id < 2

alter proc gpId @id int
as
select * from ku1 where id < @id

exec gpId 2

select * from ku1 where id < 900000 --57000 da Tabelle 57 000 Seiten hat

exec gpId 1000000 --915000

DBCC FREEPROCCACHE




CREATE FUNCTION	fRngsumme
