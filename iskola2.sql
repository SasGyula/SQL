use iskola

select * from tanulo
select * from jogcim
select * from segely
select * from kor
select * from tagsag

update segely set
osszeg = osszeg*2
Where honap = 3

update segely set
osszeg = osszeg+100
--Where MONTH(kifiz) <> honap
where year(kifiz)  = year(getdate())

delete from tanulo 
where azon ='92115'

select kifiz, year(kifiz) as kifiz�ve, getdate()  as ma,
	year(getdate())-1 as tavaly,
	GETDATE()-1 as tegnap
from segely

select DATEDIFF(day, kifiz, getdate()) --getdate()-kifiz
from segely

select osztaly, nev, left(osztaly,1) as �vf, len(nev)
from tanulo

select *
from tanulo
where left(osztaly,1) = 1


select *
from segely
where year(kifiz) = 2024 and month(kifiz) = 2


select *
from segely
where year(kifiz) = year(getdate()) and month(kifiz)=month(getdate())

select getdate() as ma,
getdate()-day(getdate()) as multh�_v�ge,
getdate()-day(getdate())+1 as eh�_elseje,
getdate()-datepart(y, getdate()) as mult�v_v�ge,
getdate()-datepart(y, getdate())

select *
from segely
where year(kifiz)=year(getdate())-1

select count(*) as ennyi --h�ny sorod van
from kor
where left(kor,2) = 'SP' and heti_oraszam>3

select count(*) as �sszes, count(azon) as uaz, count(nev) as nevvel_rendelkezok
from tanulo
where left(osztaly,1) = 2

select count(osszeg) as ennyien, 
		sum(osszeg) as �sszesen,
		avg(osszeg) as �tlag
from segely
where honap = 3

select min(kifiz) as legkorabbi, max(osszeg) as legnagyobb, min(jogc) as legels�
from segely

select distinct osztaly, nev
from tanulo