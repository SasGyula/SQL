use iskola


--ha lesz tov.halmaz m�velet akkor az prefer�lt
--egyes�t�s
select azon, count(*) as h�nyszor
from segely
group by azon

union

select azon, 0
from tanulo
where azon not in(select azon from segely)

--B megold�s
select azon, count(*) as h�nyszor
from segely
group by azon

union
(
select azon,0 from tanulo
except
select azon,0 from segely
)



select azon, count(*) as h�nyszor,'seg�lykifizet�sek sz�ma' as megj
from tagsag
group by azon

union
(
select azon, count(*), 'tags�g sz�ma'
from segely
group by azon
)

--ki j�r szakk�re

select tagsag.*, nev, osztaly
from tagsag, tanulo
where tagsag.azon = tanulo.azon

select tg.azon, nev, osztaly
from tagsag tg, tanulo ta
where tg.azon = ta.azon

--uaz a bels� �sszekapcsol�s
select tg.*, nev, osztaly
from tagsag tg
	inner join tanulo ta on tg.azon=ta.azon
--where a sz�r�felt�telek helye

--n�vvel jelenjen meg ki mennyit seg�ly kapott �sszesen

select *
from segely
--where nincs sz�r�s
--megjeleni: n�v, azon, �sszegek �sszege
-- a n�v m�shol van, ez�rt �kapcs. a sz�l�vel:
select *
from segely s
	inner join tanulo t on s.azon=t.azon
	--ellen�rizd ugyan annyi soros mint a seg�ly
--v�laszok:
--a megold�s
select s.azon, nev, sum(osszeg)
from segely s
	inner join tanulo t on s.azon=t.azon
group by s.azon, nev

--b megold�s
select t.azon, MAX(nev) as n�v, sum(osszeg) as �ssz
from segely s
	inner join tanulo t on s.azon=t.azon
group by t.azon
--mivel a tanulo.n�v f�gg az azont�l, haszn�ld ki

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