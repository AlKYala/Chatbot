create table beispieltable as (
select row_number() over (order by artnr), *
from pseudotabellepro)

select * 
from beispieltable

create table mystring9999 as (
select * 
from pseudotabellepro
)

drop table mystring1285

select * 
from mystring1285

select * 
from pseudotabellepro
where ausfuehrung = 'Schwarz' and name = 'Damenshirt' and art = 'Kleidung' and preis < 15.00 and geschenkidee = 'Erinnerungsstueck'


/*it's case sensitive*/
select * 
from pseudotabellepro
where ausfuehrung = 'schwarz' and name = 'Damenshirt' and art = 'Kleidung' and preis < 15.00 and geschenkidee = 'Erinnerungsstueck'


select  *
from pseudotabellepro
where anwendungsgebiet = 'Alltag'

select  *
from pseudotabellepro
where geschenkidee = 'Mitbringsel'

select * 
from pseudotabellepro
where name = 'Damenshirt' and geschenkidee = 'Erinnerungsstueck'


drop table if exists mystring1285;

update mystring1285
set queried = 4
where row_number =
(select row_number 
from mystring1285
where queried  = 3
limit 1);

update mystring1285
set queried = 5
where queried = 3;


/*

update $tablename
set queried = 4
where row_number =
(select row_number 
from mystring1285
where queried  = 3
limit 1);

update $tablename
set queried = 5
where queried = 3;



*/

select beschreibung
from mystring1285
where queried = 4

select * 
from mystring1285
where queried  = 1;

select * 
from mystring1285
where queried  = 3;

select * 
from mystring1285
where queried  = 4;

select * 
from mystring1285
where queried  = 5;

select count (distinct artnr) 
from $tablename
where queried = 4;

