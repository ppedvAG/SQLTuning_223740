---User meldet PerformanceProbleme


/* 
Windows Server : 
Taskmanager + Ressourcemonitor
unbekannte Prozesse.. evtl noch unter Adminstratoraccount
Arbeitspeicher 3421 MB   Peekwert Max 4354 ... warum wurde RAM wieder verschenkt

kein Hinweis auf Engpass unter Windows --> also im SQL Server

SQL Server (Taskmanager des SQL Server)

LIVE!!!!!

DMV  Data Management Views


*/

select * from sys.dm_os_wait_stats



wait_time = Gemsate Wartezeit kumuilierend seit Serverstart

max wait Time

Signal_time = Anteil der CPU 

-- wait_time - signal_time = Wartezeit auf Ressource
--siganl_time > 25% --> CPU Engpass

--wie finde ich mein Bottleneck...seit wann l�uft der Server bzw wie lange l�uft er schon
--Neustart. tempdb 07.09.2022 10:48:10
--alle waittime addieren = Laufzeit des Server
--wie hoch ist der Anteil einer Ressource zur gesamtzeit



--Idee : alle 10min die Werte sammlen und wegspeichern


--2 Tools....  Datensammler (Messdaten sammeln auf Serverniveau)   QueryStore  (sammelt autom pro DB Pl�ne und Ressourcenverbr�uche)









