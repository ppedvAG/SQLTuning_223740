--KU1 hat keinen Index-- im Plan immer ein Tabelle SCAN
--Tabelle ohne CLustered IX = Heap = Sauhaufen an Daten

set statistics io, time on -- Anzahl der Seiten , Dauer der Abfrage in ms , sowie CPU Zeit in ms
---nur messen wenn notwendig

select top 3 * from ku1

select country, city , sum(freight) from ku1
group by country, city  option (maxdop 4)




-- 40454, Seiten
--ca 530ms  CPU       80 90 ms  Dauer
--1 Kern: 230 ms   280ms
--4 Kerne: , CPU-Zeit = 314 ms, verstrichene Zeit = 82 ms.  4 CPUs tun gar nix.. und brauchen nur 60% der CPU Zeit



---Reihenfolge: 
--

--default: MAXDOP 0 = alle
--seit SQL 2016 = MAXDOP =Anzahl der Kerne, abe rnicht mehr als 8
--einer oder alle Kerne? Kostenfaktor

--Wo stellt man das ein?
-- wenn die Kosten über 5 SQL Dollar liegen dasn MAXDOP




