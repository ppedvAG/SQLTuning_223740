--Erstelle eine Prozedur, die folgendes lst

exec gpsucheKunde 'A' -- alle mit a beginnend
exec gpsucheKunde 'AL' -- alle mit al beginnend..usw
exec gpsucheKunde -- alle 

--Suche alle Bestellungen, aus dem Jahr 1997 heraus



select * from orders where orderid = 10250  
select * from orders where orderid = 10251


select * from orders where customerid = 'HANAR'

select * from Orders where customerid = 'HANAR'

select * from orders 
								where customerid = 'HANAR'


select * from employees where employeeid = 9

select * from employees where employeeid = 300

select * from employees where employeeid = 42154




select usecounts, cacheobjtype,[TEXT] from
	sys.dm_exec_cached_plans P
		CROSS APPLY sys.dm_exec_sql_text(plan_handle)
	where cacheobjtype ='Compiled PLan'
		AND [TEXT] not like '%dm_exec_cached_plans%'

dbcc freeproccache


