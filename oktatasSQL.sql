--melyik osztályba hányan járnak
SELECT osztály,Count(*) as létszám
from diák
group by osztály

--hanyan járnak egy évfolyamba
SELECT right(osztály,1)as évf, count(*) as ennyien
from diák
group by  right(osztály,1)

--melyik osztálynak hanyadik napon hány órája van
select osztály,nap, count(óra) as hány_órája
from órarend
group by osztály,nap

--az elsősöknek melyik napon mennnyi órája van
select osztály, nap, count(óra) as ennyi_órája
from órarend 
where osztály like "*1"
group by osztály, nap

--az R1 osztálynak mennyi órája van
select nap, count(*)
from órarend
where osztály="R1"
group by nap

--melyik teremben hány osztálynak vannak órái
select terem,osztály, count(*)
from órarend
group by terem, osztály

--mennyi terem ütközés van
select terem, nap, óra, count(*) as ennyi_osztályé
from órarend
group by terem, nap, óra

--hol van terem ütközés
select terem, nap, óra, count(*) as ennyi_osztályé
from órarend
group by terem, nap, óra
having count(*) >1

--melyik osztályba járnak legalább hárman
select osztály, count(*)
from diák
group by osztály
having count(*)>=3

-- melyik osztályba van K betűs ember
select osztály, count(*) as ennyi
from diák
where név like "K*"
group by osztály
having count(*)>1

