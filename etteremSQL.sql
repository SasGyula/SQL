--ki hány napon dolgozott
select kódszám,count(*) as hany_napon
from csapat
where year(dátum) = 2023
group by kódszám

-- egy adott dátumon hány asztalnál ültek többen
SELECT szlaszám, count(*)
FROM számlafej
WHERE dátum = #08/11/23#
GROUP BY szlaszám
HAVING count(*)>1;

--a legkésőbbi beszerzés
SELECT akód
FROM BESZERZÉS
WHERE dátum =(
select max(dátum)
from beszerzés
);

-- hanyan dolgoztak egy adott napon 2023ban
SELECT day(dátum) AS melyiknap, count(*) AS hanyan
FROM csapat
WHERE year(dátum) = 2023
GROUP BY day(dátum);

--milyen receptben van só
select azonosító
from recept
where akód = (
select akód
from anyag
where név like '* só*'
)

--amiben nincs só
SELECT azonosító
FROM recept
WHERE akód not in(
select akód
from anyag
where név like '* só*'
);

--amiben nincs só se cukor
SELECT azonosító
FROM recept
WHERE akód not in(
select akód
from anyag
where név like '* só*' or név like '* cukor*')
group by azonosító

--tavaly mennyi fogyott összesen tiramisu
select szlaszám, count(*)
from számlatétel
where azonosító in (
select azonosító
from étlap
where elnevezés like 'tiramisu') and
szlaszám in (
select szlaszám
from számlafej
where year(dátum) = year(now())-1
)
group by szlaszám