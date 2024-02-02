-- ab. létrehozás

create database minta

use minta

create table ÜGYFÉL
(
id integer,
név char(50),
belépés date,
fizetés money,
állami_e bit,
primary key (id)
)

