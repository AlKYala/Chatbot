-- Codierung: UTF-8
-- Datenbank fuer den Uni-Shop
-- ausführliche Informationen zu der Datenbank und ihrer Einbindung finden sich in Kapitel 5 der Dokumentation

/* Zum Löschen der Relationen */
/*
drop table geschenk;
drop table anwendung;
drop table artikel;
drop table pseudotabellepro;
*/

-- Tabelle für die Artikel
create table Artikel(
	Artnr varchar(6),Name varchar(35), Art varchar(40), Preis numeric (4, 2),
	Beschreibung varchar(500), Ausfuehrung varchar(30),
	primary key(Artnr),
	check(Preis >= 0)
);

-- Tabelle für die Anwendungsfälle
-- ArtNr bezieht sich auf ArtNr aus Artikel
create table Anwendung(
	ArtNr varchar(40),
	Anwendungsgebiet varchar(100),
	foreign key (ArtNr) references Artikel(Artnr) on update cascade on delete set null
);
	
-- Tabelle für die Geschenkideen
-- ArtNr bezieht sich auf ArtNr aus Artikel	
create table Geschenk(
	ArtNr varchar(40),
	Geschenkidee varchar(100),
	foreign key (ArtNr) references Artikel(Artnr) on update cascade on delete set null
);

-- Inhalte

  --Inhalte für Artikel
  -- Aufbau Artikelnummer: 3 Ziffern fortlaufend, Buchstabe fuer Art, zwei Ziffern fuer Ausfuehrung, zwei Ziffern fuer Groesse
  insert into Artikel values ('001D01', 'Doktorhut', 'Deko', 6.00, 'Schwarzer Doktorhut mit Siegel-Aufdruck der Universität Trier.',  'Schwarz');
  insert into Artikel values ('002A04', 'Schlüsselband', 'Alltag', 2.00, 'Blau mit Logo und Internetadresse.', 'Blau');
  insert into Artikel values ('003A05', 'Schlüsselband', 'Alltag', 2.00, 'Grün mit Logo und Internetadresse.', 'Grün');
  insert into Artikel values ('004D00', 'Wein-Set', 'Deko', 9.50, 'Wein-Set mit Schachspiel "Checkmate" bestehend aus Kellnermesser mit Gravur "Universität Trier", Tropfring, Weinthermometer, Flaschenverschluss und Schachfiguren aus Holz, in schwarzer Holzbox mit Spielbrett auf dem Deckel.', null);
  insert into Artikel values ('005A04', 'Einkaufschip', 'Alltag', 1.00, 'Blauer Einkaufschip mit dem Siegel der Universität auf der einen und dem Logo auf der anderen Seite. Passend für Einkaufswagen, die ein 1-Euro-Stück benötigen.', 'Blau');
  insert into Artikel values ('006A04', 'Kaffeetasse', 'Alltag', 7.00, 'Mit Siegel in Weiß. Dunkelblau, Steinzeug, Matt-Finish Oberfläche, Roubill-Bodenmarke, 300 ml.', 'Blau');
  insert into Artikel values ('007A05', 'Kaffeetasse', 'Alltag', 7.00, 'Mit Siegel in Weiß. Grün, Steinzeug, Matt-Finish Oberfläche, Roubill-Bodenmarke, 300 ml.', 'Grün');
  insert into Artikel values ('008U03', 'Schreibset', 'Uni', 9.00, 'Das Stiftset aus Aluminium besteht aus einem Kugelschreiber mit zusätzlicher Touchpen-Funktion, einem Bleistift und einem Rollerball. Alle Stifte haben eine Gravur der Universität Trier.', 'Silber');
  insert into Artikel values ('009U04', 'USB-Stick', 'Uni', 5.80, 'Stick in blau/silber mit Unilogo, 4 und 8 GB.', 'Blau');
  insert into Artikel values ('010U04', 'Notizbuch', 'Uni', 6.00, 'Blaues DIN A6 Notizbuch, kariert, in Holzoptik. Mit elastischem Verschlussband und Falttasche. Siegelprägung auf der Vorderseite.', 'Blau');
  insert into Artikel values ('011U05', 'Notizbuch', 'Uni', 6.00, 'Grünes DIN A6 Notizbuch, kariert, in Holzoptik. Mit elastischem Verschlussband und Falttasche. Siegelprägung auf der Vorderseite.', 'Grün');
  insert into Artikel values ('012D00', 'Uni-Bär', 'Deko', 9.00, 'Plüschbär mit Talar, Doktorhut und kleiner Urkunde. Logo der Universität Trier auf dem Talar.', null);
  insert into Artikel values ('013A04', 'Baumwolltasche', 'Alltag', 2.00, 'Königsblau, Siebdruck, ca. 38x42 cm. 100% Baumwolle, Innennähte verkettelt.', 'Blau');
  insert into Artikel values ('014U04', 'Schultertasche', 'Uni', 15.00, 'Verstellbarer Schultergurt, Netztasche mit Zip innen, Fassungsvermögen: 12 Ltr, 40x30x10, Farbe: blau.', 'Blau');
  insert into Artikel values ('015U04', 'Metallkugelschreiber in Box', 'Uni', 9.50, 'Metallkugelschreiber mit Lederapplikationen blau, Schriftzug Universität Trier eingraviert. Mine schwarz.', 'Blau');
  insert into Artikel values ('016A00', 'Magnet mit Kunstsiebdruck', 'Alltag', 3.50, 'Kunstmagnet der Künstlerin Anja Streese, Größe: 120x54 mm, Motiv: Universitätsbibliothek und Porta Nigra.', null);
  insert into Artikel values ('017U04', 'Kugelschreiber mit Soft-Touch', 'Uni', 1.00, 'Touchpen mit Lasergravour in blau/silber mit blauer Mine.', 'Blau');
  insert into Artikel values ('018D00', '2017er Universitäts-Wein', 'Deko', 6.50, 'Eine Flasche 2017er Gut Avelsbacher Hammerstein. Riesling Qualitätswein, tocken.', null);
  insert into Artikel values ('019D04', 'Geschenktasche für Uni-Wein', 'Deko', 1.50, 'Tragetasche aus Papier für eine Flasche Wein mit Seitenfalz und Sichtfenster in blau.', 'Blau');
  insert into Artikel values ('020K04', 'Kapuzensweatshirt Unisex', 'Kleidung', 25.00, 'Logo gestickt, großer Siegel-Aufdruck auf dem Rücken, XS bis XXL.', 'Blau');
  insert into Artikel values ('021K06', 'Kapuzensweatshirt Unisex', 'Kleidung', 25.00, 'Logo gestickt, großer Siegel-Aufdruck in blau auf dem Rücken, XS bis XXL.', 'Grau');
  insert into Artikel values ('022K04', 'Kapuzenjacke Unisex', 'Kleidung', 28.00, 'Logo gestickt, großer Siegel-Aufdruck in weiß auf dem Rücken. Reißverschluss vorne, XS bis XXL.', 'Blau');
  insert into Artikel values ('023K06', 'Kapuzenjacke Unisex', 'Kleidung', 28.00, 'Logo gestickt, großer Siegel-Aufdruck in blau auf dem Rücken. Reißverschluss vorne, XS bis XXL.', 'Grau');
  insert into Artikel values ('024K01', 'Herrenshirt', 'Kleidung', 13.00, 'Schwarzes Shirt mit weißem Siegel-Aufdruck auf der linken Seite. Auf dem rechten Ärmel: weißer Schriftzug der Universität, S bis XL.', 'Schwarz');
  insert into Artikel values ('025K01', 'Damenshirt', 'Kleidung', 13.00, 'Schwarzes Shirt mit weißem Siegel-Aufdruck auf der linken Seite. Auf dem rechten Ärmel: weißer Schriftzug der Universität, XS bis XL.', 'Schwarz');
  insert into Artikel values ('026B0D', 'Geschichte der Universität Trier', 'Buch', 15.00, 'Das vorliegende Buch berichtet ausführlich über die Geschichte der Universität Trier. Mit 49 farbigen Abbildungen und 25 Bilder in Schwarz/Weiß. 328 Seiten', 'Deutsch');
  insert into Artikel values ('027B0E', 'Geschichte der Universität Trier', 'Buch', 15.00, 'Das vorliegende Buch berichtet ausführlich über die Geschichte der Universität Trier. Mit 49 farbigen Abbildungen und 25 Bilder in Schwarz/Weiß. 328 Seiten', 'Englisch');
  insert into Artikel values ('028B0F', 'Geschichte der Universität Trier', 'Buch', 15.00, 'Das vorliegende Buch berichtet ausführlich über die Geschichte der Universität Trier. Mit 49 farbigen Abbildungen und 25 Bilder in Schwarz/Weiß. 328 Seiten', 'Französisch');
  insert into Artikel values ('029B0C', 'Geschichte der Universität Trier', 'Buch', 15.00, 'Das vorliegende Buch berichtet ausführlich über die Geschichte der Universität Trier. Mit 49 farbigen Abbildungen und 25 Bilder in Schwarz/Weiß. 328 Seiten', 'Chinesisch');
  insert into Artikel values ('030B0D', 'Trier für Anfänger', 'Buch', 7.00, 'Dieses kleine Büchlein ist ein Muss, für alle, die Trier zum ersten Mal erleben. Sehenswürdigkeiten und Geschichte werden anhand von Abbildungen näher beschrieben.', 'Deutch');
  insert into Artikel values ('031B0E', 'Trier für Anfänger', 'Buch', 7.00, 'Dieses kleine Büchlein ist ein Muss, für alle, die Trier zum ersten Mal erleben. Sehenswürdigkeiten und Geschichte werden anhand von Abbildungen näher beschrieben.', 'Englisch');
  insert into Artikel values ('032B0F', 'Trier für Anfänger', 'Buch', 7.00, 'Dieses kleine Büchlein ist ein Muss, für alle, die Trier zum ersten Mal erleben. Sehenswürdigkeiten und Geschichte werden anhand von Abbildungen näher beschrieben.', 'Französisch');
  insert into Artikel values ('033B0D', 'Mordsstimmung', 'Buch', 9.99, 'An der Universtität Trier wurde eine Leiche aufgefunden. Ein Unfall oder Mord? Kommissar Völxen ermittelt mit Humor und Ortskenntnis in einem Fall, in dem nichts so ist, wie es scheint.', 'Deutsch');
  insert into Artikel values ('034S00', 'Memory Trier', 'Spiel', 15.00, 'Der Klassiker zur Stadt Trier. Ab 8 Jahren, für 2 - 6 Spieler.', null);
  insert into Artikel values ('035S00', 'Monopoly Trier', 'Spiel', 24.99, 'Der Spieleklassiker zur Stadt Trier. Mit der Uni Trier als Schlossallee.', null);
  -- insert into Artikel values ('', '', '', , '', '');
 
 
  -- Inhalte für Anwendungsfälle
 -- Mögliche Kategorien: Alltag, Schreibwaren,  EssenTrinken, Accessoire, Unterhaltung
  insert into Anwendung values ('001D01', 'Accessoire');
  insert into Anwendung values ('002A04', 'Alltag');
  insert into Anwendung values ('003A05', 'Alltag');
  insert into Anwendung values ('004D00', 'EssenTrinken');
  insert into Anwendung values ('004D00', 'Accessoire');
  insert into Anwendung values ('005A04', 'Alltag');
  insert into Anwendung values ('006A04', 'EssenTrinken');
  insert into Anwendung values ('006A04', 'Alltag');
  insert into Anwendung values ('007A05', 'EssenTrinken');
  insert into Anwendung values ('007A05', 'Alltag');
  insert into Anwendung values ('008U03', 'Schreibwaren');
  insert into Anwendung values ('008U03', 'Accessoire');
  insert into Anwendung values ('009U04', 'Alltag');
  insert into Anwendung values ('010U04', 'Schreibwaren');
  insert into Anwendung values ('011U05', 'Schreibwaren');
  insert into Anwendung values ('012D00', 'Accessoire');
  insert into Anwendung values ('013A04', 'Alltag');
  insert into Anwendung values ('014U04', 'Alltag');
  insert into Anwendung values ('014U04', 'Accessoire');
  insert into Anwendung values ('015U04', 'Schreibwaren');
  insert into Anwendung values ('015U04', 'Accessoire');
  insert into Anwendung values ('016A00', 'Schreibwaren');
  insert into Anwendung values ('016A00', 'Accessoire');
  insert into Anwendung values ('017U04', 'Schreibwaren');
  insert into Anwendung values ('018D00', 'EssenTrinken');
  insert into Anwendung values ('019D04', 'Accessoire');
  insert into Anwendung values ('020K04', 'Alltag');
  insert into Anwendung values ('021K06', 'Alltag'); -- Kapuzensweatshirt grau
  insert into Anwendung values ('022K04', 'Alltag'); -- Kapuzenjacke blau
  insert into Anwendung values ('023K06', 'Alltag'); -- Kapuzenjacke grau
  insert into Anwendung values ('024K01', 'Alltag'); -- Herrenshirt
  insert into Anwendung values ('025K01', 'Alltag'); -- Damenshirt
  insert into Anwendung values ('026B0D', 'Unterhaltung'); -- Geschichte Uni Trier
  insert into Anwendung values ('027B0E', 'Unterhaltung');
  insert into Anwendung values ('028B0F', 'Unterhaltung');
  insert into Anwendung values ('029B0C', 'Unterhaltung');
  insert into Anwendung values ('030B0D', 'Unterhaltung'); -- Trier
  insert into Anwendung values ('031B0E', 'Unterhaltung');
  insert into Anwendung values ('032B0F', 'Unterhaltung');
  insert into Anwendung values ('033B0D', 'Unterhaltung'); -- Mordsstimmung
  insert into Anwendung values ('034S00', 'Unterhaltung');
  insert into Anwendung values ('035S00', 'Unterhaltung');
  --insert into Anwendung values ('', '');

 
 --Inhalt für Geschenkideen
  --Geschenkideen: Mitbringsel, Gastgeschenk, Geschenk, Erinnerungsstück
  insert into Geschenk values ('001D01', 'Erinnerungsstück');
  insert into Geschenk values ('002A04', 'Mitbringsel');
  insert into Geschenk values ('003A05', 'Mitbringsel');
  insert into Geschenk values ('004D00', 'Geschenk');
  insert into Geschenk values ('006A04', 'Geschenk');
  insert into Geschenk values ('006A04', 'Erinnerungsstück');
  insert into Geschenk values ('007A05', 'Geschenk');
  insert into Geschenk values ('007A05', 'Erinnerungsstück');
  insert into Geschenk values ('008U03', 'Geschenk');
  insert into Geschenk values ('009U04', 'Mitbringsel');
  insert into Geschenk values ('012D00', 'Erinnerungsstück');
  insert into Geschenk values ('014U04', 'Geschenk');
  insert into Geschenk values ('014U04', 'Erinnerungsstück');
  insert into Geschenk values ('015U04', 'Geschenk');
  insert into Geschenk values ('016A00', 'Mitbringsel');
  insert into Geschenk values ('016A00', 'Gastgeschenk');
  insert into Geschenk values ('018D00', 'Gastgeschenk');
  insert into Geschenk values ('018D00', 'Geschenk');
  insert into Geschenk values ('020K04', 'Erinnerungsstück'); -- Kapuzensweatshirt blau
  insert into Geschenk values ('020K04', 'Geschenk');
  insert into Geschenk values ('020K04', 'Gastgeschenk');
  insert into Geschenk values ('021K06', 'Erinnerungsstück'); -- Kapuzensweatshirt grau
  insert into Geschenk values ('021K06', 'Geschenk');
  insert into Geschenk values ('021K06', 'Gastgeschenk');
  insert into Geschenk values ('022K04', 'Erinnerungsstück'); -- Kapuzenjacke blau
  insert into Geschenk values ('022K04', 'Geschenk');
  insert into Geschenk values ('022K04', 'Gastgeschenk');
  insert into Geschenk values ('023K06', 'Erinnerungsstück'); -- Kapuzenjacke grau
  insert into Geschenk values ('022K04', 'Geschenk');
  insert into Geschenk values ('022K04', 'Gastgeschenk');
  insert into Geschenk values ('024K01', 'Erinnerungsstück'); -- Herrenshirt
  insert into Geschenk values ('024K01', 'Geschenk');
  insert into Geschenk values ('024K01', 'Gastgeschenk');
  insert into Geschenk values ('025K01', 'Erinnerungsstück'); -- Damenshirt
  insert into Geschenk values ('025K01', 'Gastgeschenk');
  insert into Geschenk values ('025K01', 'Geschenk');
  insert into Geschenk values ('026B0D', 'Geschenk');         -- Geschichte Uni Trier
  insert into Geschenk values ('026B0D', 'Erinnerungsstück');
  insert into Geschenk values ('027B0E', 'Gastgeschenk');
  insert into Geschenk values ('027B0E', 'Erinnerungsstück');
  insert into Geschenk values ('028B0F', 'Gastgeschenk');
  insert into Geschenk values ('028B0F', 'Erinnerungsstück');
  insert into Geschenk values ('029B0C', 'Gastgeschenk');
  insert into Geschenk values ('029B0C', 'Erinnerungsstück');
  insert into Geschenk values ('030B0D', 'Geschenk');         -- Trier
  insert into Geschenk values ('030B0D', 'Erinnerungsstück');
  insert into Geschenk values ('031B0E', 'Gastgeschenk');
  insert into Geschenk values ('031B0E', 'Erinnerungsstück');
  insert into Geschenk values ('032B0F', 'Gastgeschenk');
  insert into Geschenk values ('032B0F', 'Erinnerungsstück');
  insert into Geschenk values ('033B0D', 'Geschenk');         -- Mordsstimmung
  insert into Geschenk values ('034S00', 'Geschenk');         -- Spiele
  insert into Geschenk values ('034S00', 'Gastgeschenk');
  insert into Geschenk values ('035S00', 'Geschenk');
  insert into Geschenk values ('035S00', 'Gastgeschenk');
  --insert into Geschenk values ('', '');

 
-- Tabelle Pseudotabelle als Grundlage für die späteren Relationen 'mystringXXXX'
-- ensteht aus Natural Full Outer Joins mit den oberen drei Relationen
create table PseudotabellePro as( 
select *, 0 as queried
from artikel a 
natural full outer join geschenk
natural full outer join anwendung
);


/* WICHTIG! FÜR DEN WORKAROUND FÜR NULLWERTE! */

/* nicht nötig, jedes Produkt hat einen Namen
update pseudotabellepro
set name = 'nichts'
where name is null;
*/

/* nicht nötig, jedem Produkt ist Art zugordnet
update pseudotabellepro
set art = 'nichts'
where art is null;
*/

/* nicht nötig, jedes Produkt hat einen Preis
update pseudotabellepro
set preis = -1
where preis is null;
*/

update pseudotabellepro
set ausfuehrung = 'nichts'
where ausfuehrung is null;

update pseudotabellepro
set geschenkidee = 'nichts'
where geschenkidee is null;


update pseudotabellepro
set anwendungsgebiet = 'nichts'
where anwendungsgebiet is null;

/* WEGEN DER FARBEN */

/* In der neuen Version von Artikel sind die Farben bereits großgeschrieben
update pseudotabellepro
set ausfuehrung = 'Blau'
where ausfuehrung = 'Blau';

update pseudotabellepro
set ausfuehrung = 'Grün'
where ausfuehrung = 'grün';

update pseudotabellepro
set ausfuehrung = 'Grau'
where ausfuehrung = 'grau';

update pseudotabellepro
set ausfuehrung = 'Schwarz'
where ausfuehrung = 'schwarz';

*/


/* ERSTELLEN VARIABLEN 
 * DIESE SOLLEN IN DER QUERY DANN AUSGEFÜLLT WERDEN!
 * */