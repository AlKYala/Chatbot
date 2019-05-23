/* Beispiel unserer Queue. Wir brauchen nicht mehr >=68 verschiedene Fälle sondern nur eine 
   Queue wie diese hier. 

   ANMERKUNG: Die Tabelle ist so definiert, dass Zahlenwerte nicht kleiner 0 sein dürfen!

   Angenommen wir haben folgende Parameter: 
	$name = null
	$art = Spiel
	$preis = 15.00
	$queried = false bzw. 0
	$geschenkidee = Gastgeschenk
	$anwendungsgebiet = Unterhaltung
*/

select distinct *
from pseudotabellepro
where queried = 0 and
    case when 'nichts' not like '%nichts%' then name else 'NULLVALUE' end 
    = coalesce('nichts', 'NULLVALUE') --Spalte name
and 
	case when 'Buch' is not null then art else 'NULLVALUE' end 
    = coalesce('Buch','NULLVALUE')	--art
and 
	case when 15 is not null then preis else -1 end 
    <= coalesce(15,-1) --preis
and 
	case when null is not null then ausfuehrung else 'NULLVALUE' end 
    = coalesce(null,'NULLVALUE') --ausfuehrung
and 
	case when 'Gastgeschenk' is not null then geschenkidee else 'NULLVALUE' end 
	= coalesce('Gastgeschenk', 'NULLVALUE')
and 
	case when 'Unterhaltung' is not null then anwendungsgebiet else 'NULLVALUE' end 
	= coalesce('Unterhaltung', 'NULLVALUE');
	
update pseudotabellepro
set queried = 0

select distinct *
from pseudotabellepro
where queried = 0 and
 	case when null is not null then name else 'NULLVALUE' end 
	= coalesce(null, 'NULLVALUE') --Spalte name
and 
	case when 'Buch' is not null then art else 'NULLVALUE' end 
    = coalesce('Buch','NULLVALUE')	--art
and 
	case when 15 is not null then preis else -1 end 
    <= coalesce(15,-1) --preis
and 
	case when null is not null then ausfuehrung else 'NULLVALUE' end 
    = coalesce(null,'NULLVALUE') --ausfuehrung
and 
	case when 'Gastgeschenk' is not null then geschenkidee else 'NULLVALUE' end 
	= coalesce('Gastgeschenk', 'NULLVALUE')
and 
	case when 'Unterhaltung' is not null then anwendungsgebiet else 'NULLVALUE' end 
	= coalesce('Unterhaltung', 'NULLVALUE')
	
	
select * 
from pseudotabellepro

select distinct *
from pseudotabellepro
where queried = 0 and
 	case when 'Damenshirt' is not null then name else 'NULLVALUE' end 
	= coalesce('Damenshirt', 'NULLVALUE') --Spalte name
and 
	case when null is not null then art else 'NULLVALUE' end 
    = coalesce(null,'NULLVALUE')	--art
and 
	case when 15 is not null then preis else -1 end 
    <= coalesce(15,-1) --preis
and 
	case when null is not null then ausfuehrung else 'NULLVALUE' end 
    = coalesce(null,'NULLVALUE') --ausfuehrung
and 
	case when 'Erinnerungsstueck' is not null then geschenkidee else 'NULLVALUE' end 
	= coalesce('Erinnerungsstueck', 'NULLVALUE')
and 
	case when null is not null then anwendungsgebiet else 'NULLVALUE' end 
	= coalesce(null, 'NULLVALUE')
	
	
/* FÜR CHATSCRIPT: HIER QUEUE NOCH MIT PSEUDOTABELLEPRO!!!
Aber dann bitte nicht mehr mit pseudotabellepro arbeiten!

	select distinct beschreibung
from pseudotabellepro
where queried = 0 and
case when $things is not null then name else 'NULLVALUE' end 
	= coalesce($things, 'NULLVALUE') --Spalte name
and case when $art is not null then art else 'NULLVALUE' end 
    = coalesce($art,'NULLVALUE')	--art
and case when $preis is not null then preis else -1 end 
    <= coalesce($preis,-1) --preis
and case when $ausfuehrung is not null then ausfuehrung else 'NULLVALUE' end 
    = coalesce($ausfuehrung,'NULLVALUE') --ausfuehrung
and case when $geschenkidee is not null then geschenkidee else 'NULLVALUE' end 
	= coalesce($geschenkidee, 'NULLVALUE')
and case when $anwendungszweck is not null then anwendungsgebiet else 'NULLVALUE' end 
	= coalesce($anwendungszweck, 'NULLVALUE')
	
 */
 
 /* IDEE 2: Wir setzen gefundenes auf queried = 1, suchen dann daraus unsere Ergebnisse:
 
 update pseudotabellepro
 set queried = 1 
where case when $things is not null then name else 'NULLVALUE' end 
	= coalesce($things, 'NULLVALUE') --Spalte name
and case when $art is not null then art else 'NULLVALUE' end 
    = coalesce($art,'NULLVALUE')	--art
and case when $preis is not null then preis else -1 end 
    <= coalesce($preis,-1) --preis
and case when $ausfuehrung is not null then ausfuehrung else 'NULLVALUE' end 
    = coalesce($ausfuehrung,'NULLVALUE') --ausfuehrung
and case when $geschenkidee is not null then geschenkidee else 'NULLVALUE' end 
	= coalesce($geschenkidee, 'NULLVALUE')
and case when $anwendungszweck is not null then anwendungsgebiet else 'NULLVALUE' end 
	= coalesce($anwendungszweck, 'NULLVALUE')
	
	select distinct beschreibung 
	from pseudotabellepro
	where queried = 1
	
	
	BEISPIEL:
	
	 update pseudotabellepro
 set queried = 1 
 where case when null is not null then name else 'NULLVALUE' end 
	= coalesce(null, 'NULLVALUE') --Spalte name
and case when 'Buch' is not null then art else 'NULLVALUE' end 
    = coalesce('Buch','NULLVALUE')	--art
and case when 15 is not null then preis else -1 end 
    <= coalesce(15,-1) --preis
and case when null is not null then ausfuehrung else 'NULLVALUE' end 
    = coalesce(null,'NULLVALUE') --ausfuehrung
and case when 'Gastgeschenk' is not null then geschenkidee else 'NULLVALUE' end 
	= coalesce('Gastgeschenk', 'NULLVALUE')
and case when 'Unterhaltung' is not null then anwendungsgebiet else 'NULLVALUE' end 
	= coalesce('Unterhaltung', 'NULLVALUE')
	
	select distinct beschreibung 
	from pseudotabellepro
	where queried = 1
	
	
	
*/