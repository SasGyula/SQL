use iskola


--ha lesz tov.halmaz mûvelet akkor az preferált
--egyesítés
select azon, count(*) as hányszor
from segely
group by azon

union

select azon, 0
from tanulo
where azon not in(select azon from segely)

--B megoldás
select azon, count(*) as hányszor
from segely
group by azon

union
(
select azon,0 from tanulo
except
select azon,0 from segely
)



select azon, count(*) as hányszor,'segélykifizetések száma' as megj
from tagsag
group by azon

union
(
select azon, count(*), 'tagság száma'
from segely
group by azon
)

--ki jár szakköre

select tagsag.*, nev, osztaly
from tagsag, tanulo
where tagsag.azon = tanulo.azon

select tg.azon, nev, osztaly
from tagsag tg, tanulo ta
where tg.azon = ta.azon

--uaz a belsõ összekapcsolás
select tg.*, nev, osztaly
from tagsag tg
	inner join tanulo ta on tg.azon=ta.azon
--where a szûrõfeltételek helye

--névvel jelenjen meg ki mennyit segély kapott összesen

select *
from segely
--where nincs szûrés
--megjeleni: név, azon, összegek összege
-- a név máshol van, ezért ökapcs. a szülõvel:
select *
from segely s
	inner join tanulo t on s.azon=t.azon
	--ellenõrizd ugyan annyi soros mint a segély
--válaszok:
--a megoldás
select s.azon, nev, sum(osszeg)
from segely s
	inner join tanulo t on s.azon=t.azon
group by s.azon, nev

--b megoldás
select t.azon, MAX(nev) as név, sum(osszeg) as össz
from segely s
	inner join tanulo t on s.azon=t.azon
group by t.azon
--mivel a tanulo.név függ az azontól, használd ki

select osztaly, count(*), max(kor)
from tagsag t
	inner join tanulo ta on t.azon = ta.azon
where kor like 'SP%'
group by osztaly

select osztaly, count(*)
from tagsag g, tanulo t
where g.azon = t.azon 
and kor like 'SP%'
group by osztaly