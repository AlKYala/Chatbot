-- Codierung: UTF-8

--Datenbank fuer den Uni-Shop

drop table geschenk;
drop table anwendung;
drop table artikel;
drop table pseudotabellepro;


-- Tabelle fuer die Artikel
create table Artikel(
	Artnr varchar(8),Name varchar(35), Art varchar(40), Preis numeric (4, 2),
	Beschreibung varchar(500), Ausfuehrung varchar(30),Groesse varchar(15),
	primary key(Artnr),
	check(Preis >= 0)
);

-- Tabelle fuer die Anwendungsfaelle
create table Anwendung(
	ArtNr varchar(40),
	Anwendungsgebiet varchar(100),
	foreign key (ArtNr) references Artikel(Artnr) on update cascade on delete set null
);
	
-- Tabelle fuer die Geschenkideen	
create table Geschenk(
	ArtNr varchar(40),
	Geschenkidee varchar(100),
	foreign key (ArtNr) references Artikel(Artnr) on update cascade on delete set null
);

-- Inhalte

  --Inhalte fuer Artikel
  -- Aufbau Artikelnummer: 3 Ziffern fortlaufend, Buchstabe fuer Art, zwei Ziffern fuer Ausfuehrung, zwei Ziffern fuer Groesse
  insert into Artikel values ('001D0100', 'Doktorhut', 'Deko', 6.00, 'Schwarzer Doktorhut mit Siegel-Aufdruck der Universität Trier.',  'schwarz', null);
  insert into Artikel values ('002A0400', 'Schlüsselband', 'Alltag', 2.00, 'Blau mit Logo und Internetadresse.', 'blau', null);
  insert into Artikel values ('003A0500', 'Schlüsselband', 'Alltag', 2.00, ' mit Logo und Internetadresse.', '', null);
  insert into Artikel values ('004D0000', 'Wein-Set', 'Deko', 9.50, 'Wein-Set mit Schachspiel "Checkmate" bestehend aus Kellnermesser mit Gravur "Universität Trier", Tropfring, Weinthermometer, Flaschenverschluss und Schachfiguren aus Holz, in schwarzer Holzbox mit Spielbrett auf dem Deckel.', null, null);
  insert into Artikel values ('005A0400', 'Einkaufschip', 'Alltag', 1.00, 'Blauer Einkaufschip mit dem Siegel der Universität auf der einen und dem Logo auf der anderen Seite. Passend für Einkaufswagen, die ein 1-Euro-Stück benötigen.', 'blau', null);
  insert into Artikel values ('006A0430', 'Kaffeetasse', 'Alltag', 7.00, 'Mit Siegel in Weiß. Dunkelblau, Steinzeug, Matt-Finish Oberfläche, Roubill-Bodenmarke, 300 ml.', 'blau', '300 ml');
  insert into Artikel values ('007A0530', 'Kaffeetasse', 'Alltag', 7.00, 'Mit Siegel in Weiß. , Steinzeug, Matt-Finish Oberfläche, Roubill-Bodenmarke, 300 ml.', '', '300 ml');
  insert into Artikel values ('008U0300', 'Schreibset', 'Uni', 9.00, 'Das Stiftset aus Aluminium besteht aus einem Kugelschreiber mit zusätzlicher Touchpen-Funktion, einem Bleistift und einem Rollerball. Alle Stifte haben eine Gravur der Universität Trier.', 'silber', null);
  insert into Artikel values ('009U0404', 'USB-Stick', 'Uni', 5.80, 'Stick in blau/silber mit Unilogo, 4 und 8 GB.', 'blau', '4 GB');
  insert into Artikel values ('010U0405', 'USB-Stick', 'Uni', 6.80, 'Stick in blau/silber mit Unilogo, 4 und 8 GB.', 'blau', '8 GB');
  insert into Artikel values ('011U04A6', 'Notizbuch', 'Uni', 6.00, 'Blaues DIN A6 Notizbuch, kariert, in Holzoptik. Mit elastischem Verschlussband und Falttasche. Siegelprägung auf der Vorderseite.', 'blau', 'A6');
  insert into Artikel values ('012U05A6', 'Notizbuch', 'Uni', 6.00, 'Grünes DIN A6 Notizbuch, kariert, in Holzoptik. Mit elastischem Verschlussband und Falttasche. Siegelprägung auf der Vorderseite.', 'grün', 'A6');
  insert into Artikel values ('013D0000', 'Uni-Bär', 'Deko', 9.00, 'Plüschbär mit Talar, Doktorhut und kleiner Urkunde. Logo der Universität Trier auf dem Talar.', null, null);
  insert into Artikel values ('014A0400', 'Baumwolltasche', 'Alltag', 2.00, 'Königsblau, Siebdruck, ca. 38x42 cm. 100% Baumwolle, Innennähte verkettelt.', 'blau', null);
  insert into Artikel values ('015U0412', 'Schultertasche', 'Uni', 15.00, 'Verstellbarer Schultergurt, Netztasche mit Zip innen, Fassungsvermögen: 12 Ltr, 40x30x10, Farbe: blau.', 'blau', '12 l');
  insert into Artikel values ('016U0400', 'Metallkugelschreiber in Box', 'Uni', 9.50, 'Metallkugelschreiber mit Lederapplikationen blau, Schriftzug Universität Trier eingraviert. Mine schwarz.', 'blau', null);
  insert into Artikel values ('017A0000', 'Magnet mit Kunstsiebdruck', 'Alltag', 3.50, 'Kunstmagnet der Künstlerin Anja Streese, Größe: 120x54 mm, Motiv: Universitätsbibliothek und Porta Nigra.', null, null);
  insert into Artikel values ('018U0400', 'Kugelschreiber mit Soft-Touch', 'Uni', 1.00, 'Touchpen mit Lasergravour in blau/silber mit blauer Mine.', 'blau', null);
  insert into Artikel values ('019D0000', '2017er Universitäts-Wein', 'Deko', 6.50, 'Eine Flasche 2017er Gut Avelsbacher Hammerstein. Riesling Qualitätswein, tocken.', null, null);
  insert into Artikel values ('020D0400', 'Geschenktasche für Uni-Wein', 'Deko', 1.50, 'Tragetasche aus Papier für eine Flasche Wein mit Seitenfalz und Sichtfenster in blau.', 'blau', null);
  insert into Artikel values ('021K042S', 'Kapuzensweatshirt Unisex', 'Kleidung', 25.00, 'Logo gestickt, großer Siegel-Aufdruck auf dem Rücken, XS bis XXL.', 'blau', 'XS');
  insert into Artikel values ('022K041S', 'Kapuzensweatshirt Unisex', 'Kleidung', 25.00, 'Logo gestickt, großer Siegel-Aufdruck auf dem Rücken, XS bis XXL.', 'blau', 'S');
  insert into Artikel values ('023K041M', 'Kapuzensweatshirt Unisex', 'Kleidung', 25.00, 'Logo gestickt, großer Siegel-Aufdruck auf dem Rücken, XS bis XXL.', 'blau', 'M');
  insert into Artikel values ('024K041L', 'Kapuzensweatshirt Unisex', 'Kleidung', 25.00, 'Logo gestickt, großer Siegel-Aufdruck auf dem Rücken, XS bis XXL.', 'blau', 'L');
  insert into Artikel values ('025K042L', 'Kapuzensweatshirt Unisex', 'Kleidung', 25.00, 'Logo gestickt, großer Siegel-Aufdruck auf dem Rücken, XS bis XXL.', 'blau', 'XL');
  insert into Artikel values ('026K043L', 'Kapuzensweatshirt Unisex', 'Kleidung', 25.00, 'Logo gestickt, großer Siegel-Aufdruck auf dem Rücken, XS bis XXL.', 'blau', 'XXL');
  insert into Artikel values ('027K062S', 'Kapuzensweatshirt Unisex', 'Kleidung', 25.00, 'Logo gestickt, großer Siegel-Aufdruck in blau auf dem Rücken, XS bis XXL.', 'grau', 'XS');
  insert into Artikel values ('028K061S', 'Kapuzensweatshirt Unisex', 'Kleidung', 25.00, 'Logo gestickt, großer Siegel-Aufdruck in blau auf dem Rücken, XS bis XXL.', 'grau', 'S');
  insert into Artikel values ('029K061M', 'Kapuzensweatshirt Unisex', 'Kleidung', 25.00, 'Logo gestickt, großer Siegel-Aufdruck in blau auf dem Rücken, XS bis XXL.', 'grau', 'M');
  insert into Artikel values ('030K061L', 'Kapuzensweatshirt Unisex', 'Kleidung', 25.00, 'Logo gestickt, großer Siegel-Aufdruck in blau auf dem Rücken, XS bis XXL.', 'grau', 'L');
  insert into Artikel values ('031K062L', 'Kapuzensweatshirt Unisex', 'Kleidung', 25.00, 'Logo gestickt, großer Siegel-Aufdruck in blau auf dem Rücken, XS bis XXL.', 'grau', 'XL');
  insert into Artikel values ('032K063L', 'Kapuzensweatshirt Unisex', 'Kleidung', 25.00, 'Logo gestickt, großer Siegel-Aufdruck in blau auf dem Rücken, XS bis XXL.', 'grau', 'XXL');
  insert into Artikel values ('033K042S', 'Kapuzenjacke Unisex', 'Kleidung', 28.00, 'Logo gestickt, großer Siegel-Aufdruck in weiß auf dem Rücken. Reißverschluss vorne, XS bis XXL.', 'blau', 'XS');
  insert into Artikel values ('034K041S', 'Kapuzenjacke Unisex', 'Kleidung', 28.00, 'Logo gestickt, großer Siegel-Aufdruck in weiß auf dem Rücken. Reißverschluss vorne, XS bis XXL.', 'blau', 'S');
  insert into Artikel values ('035K041M', 'Kapuzenjacke Unisex', 'Kleidung', 28.00, 'Logo gestickt, großer Siegel-Aufdruck in weiß auf dem Rücken. Reißverschluss vorne, XS bis XXL.', 'blau', 'M');
  insert into Artikel values ('036K041L', 'Kapuzenjacke Unisex', 'Kleidung', 28.00, 'Logo gestickt, großer Siegel-Aufdruck in weiß auf dem Rücken. Reißverschluss vorne, XS bis XXL.', 'blau', 'L');
  insert into Artikel values ('037K042L', 'Kapuzenjacke Unisex', 'Kleidung', 28.00, 'Logo gestickt, großer Siegel-Aufdruck in weiß auf dem Rücken. Reißverschluss vorne, XS bis XXL.', 'blau', 'XL');
  insert into Artikel values ('038K043L', 'Kapuzenjacke Unisex', 'Kleidung', 28.00, 'Logo gestickt, großer Siegel-Aufdruck in weiß auf dem Rücken. Reißverschluss vorne, XS bis XXL.', 'blau', 'XXL');
  insert into Artikel values ('039K062S', 'Kapuzenjacke Unisex', 'Kleidung', 28.00, 'Logo gestickt, großer Siegel-Aufdruck in blau auf dem Rücken. Reißverschluss vorne, XS bis XXL.', 'grau', 'XS');
  insert into Artikel values ('040K061S', 'Kapuzenjacke Unisex', 'Kleidung', 28.00, 'Logo gestickt, großer Siegel-Aufdruck in blau auf dem Rücken. Reißverschluss vorne, XS bis XXL.', 'grau', 'S');
  insert into Artikel values ('041K061M', 'Kapuzenjacke Unisex', 'Kleidung', 28.00, 'Logo gestickt, großer Siegel-Aufdruck in blau auf dem Rücken. Reißverschluss vorne, XS bis XXL.', 'grau', 'M');
  insert into Artikel values ('042K061L', 'Kapuzenjacke Unisex', 'Kleidung', 28.00, 'Logo gestickt, großer Siegel-Aufdruck in blau auf dem Rücken. Reißverschluss vorne, XS bis XXL.', 'grau', 'L');
  insert into Artikel values ('043K062L', 'Kapuzenjacke Unisex', 'Kleidung', 28.00, 'Logo gestickt, großer Siegel-Aufdruck in blau auf dem Rücken. Reißverschluss vorne, XS bis XXL.', 'grau', 'XL');
  insert into Artikel values ('044K063L', 'Kapuzenjacke Unisex', 'Kleidung', 28.00, 'Logo gestickt, großer Siegel-Aufdruck in blau auf dem Rücken. Reißverschluss vorne, XS bis XXL.', 'grau', 'XXL');
  insert into Artikel values ('045K011S', 'Herrenshirt', 'Kleidung', 13.00, 'Schwarzes Shirt mit weißem Siegel-Aufdruck auf der linken Seite. Auf dem rechten Ärmel: weißer Schriftzug der Universität, S bis XL.', 'schwarz', 'S');
  insert into Artikel values ('046K011M', 'Herrenshirt', 'Kleidung', 13.00, 'Schwarzes Shirt mit weißem Siegel-Aufdruck auf der linken Seite. Auf dem rechten Ärmel: weißer Schriftzug der Universität, S bis XL.', 'schwarz', 'M');
  insert into Artikel values ('047K011L', 'Herrenshirt', 'Kleidung', 13.00, 'Schwarzes Shirt mit weißem Siegel-Aufdruck auf der linken Seite. Auf dem rechten Ärmel: weißer Schriftzug der Universität, S bis XL.', 'schwarz', 'L');
  insert into Artikel values ('048K012L', 'Herrenshirt', 'Kleidung', 13.00, 'Schwarzes Shirt mit weißem Siegel-Aufdruck auf der linken Seite. Auf dem rechten Ärmel: weißer Schriftzug der Universität, S bis XL.', 'schwarz', 'XL');
  insert into Artikel values ('049K012S', 'Damenshirt', 'Kleidung', 13.00, 'Schwarzes Shirt mit weißem Siegel-Aufdruck auf der linken Seite. Auf dem rechten Ärmel: weißer Schriftzug der Universität, XS bis XL.', 'schwarz', 'XS');
  insert into Artikel values ('050K011S', 'Damenshirt', 'Kleidung', 13.00, 'Schwarzes Shirt mit weißem Siegel-Aufdruck auf der linken Seite. Auf dem rechten Ärmel: weißer Schriftzug der Universität, XS bis XL.', 'schwarz', 'S');
  insert into Artikel values ('051K011M', 'Damenshirt', 'Kleidung', 13.00, 'Schwarzes Shirt mit weißem Siegel-Aufdruck auf der linken Seite. Auf dem rechten Ärmel: weißer Schriftzug der Universität, XS bis XL.', 'schwarz', 'M');
  insert into Artikel values ('052K011L', 'Damenshirt', 'Kleidung', 13.00, 'Schwarzes Shirt mit weißem Siegel-Aufdruck auf der linken Seite. Auf dem rechten Ärmel: weißer Schriftzug der Universität, XS bis XL.', 'schwarz', 'L');
  insert into Artikel values ('053K012L', 'Damenshirt', 'Kleidung', 13.00, 'Schwarzes Shirt mit weißem Siegel-Aufdruck auf der linken Seite. Auf dem rechten Ärmel: weißer Schriftzug der Universität, XS bis XL.', 'schwarz', 'XL');
  insert into Artikel values ('054B0D00', 'Geschichte der Universität Trier', 'Buch', 15.00, 'Das vorliegende Buch berichtet ausführlich über die Geschichte der Universität Trier. Mit 49 farbigen Abbildungen und 25 Bilder in Schwarz/Weiß. 328 Seiten', 'Deutsch', null);
  insert into Artikel values ('055B0E00', 'Geschichte der Universität Trier', 'Buch', 15.00, 'Das vorliegende Buch berichtet ausführlich über die Geschichte der Universität Trier. Mit 49 farbigen Abbildungen und 25 Bilder in Schwarz/Weiß. 328 Seiten', 'Englisch', null);
  insert into Artikel values ('056B0F00', 'Geschichte der Universität Trier', 'Buch', 15.00, 'Das vorliegende Buch berichtet ausführlich über die Geschichte der Universität Trier. Mit 49 farbigen Abbildungen und 25 Bilder in Schwarz/Weiß. 328 Seiten', 'Französisch', null);
  insert into Artikel values ('057B0C00', 'Geschichte der Universität Trier', 'Buch', 15.00, 'Das vorliegende Buch berichtet ausführlich über die Geschichte der Universität Trier. Mit 49 farbigen Abbildungen und 25 Bilder in Schwarz/Weiß. 328 Seiten', 'Chinesisch', null);
  insert into Artikel values ('058B0D00', 'Trier für Anfänger', 'Buch', 7.00, 'Dieses kleine Büchlein ist ein Muss, für alle, die Trier zum ersten Mal erleben. Sehenswürdigkeiten und Geschichte werden anhand von Abbildungen näher beschrieben.', 'Deutch', null);
  insert into Artikel values ('059B0E00', 'Trier für Anfänger', 'Buch', 7.00, 'Dieses kleine Büchlein ist ein Muss, für alle, die Trier zum ersten Mal erleben. Sehenswürdigkeiten und Geschichte werden anhand von Abbildungen näher beschrieben.', 'Englisch', null);
  insert into Artikel values ('060B0F00', 'Trier für Anfänger', 'Buch', 7.00, 'Dieses kleine Büchlein ist ein Muss, für alle, die Trier zum ersten Mal erleben. Sehenswürdigkeiten und Geschichte werden anhand von Abbildungen näher beschrieben.', 'Französisch', null);
  insert into Artikel values ('061B0D00', 'Mordsstimmung', 'Buch', 9.99, 'An der Universtität Trier wurde eine Leiche aufgefunden. Ein Unfall oder Mord? Kommissar Völxen ermittelt mit Humor und Ortskenntnis in einem Fall, in dem nichts so ist, wie es scheint.', 'Deutsch', null );
  insert into Artikel values ('062S0000', 'Memory Trier', 'Spiel', 15.00, 'Der Klassiker zur Stadt Trier. Ab 8 Jahren, für 2 - 6 Spieler.', null, null);
  insert into Artikel values ('063S0000', 'Monopoly Trier', 'Spiel', 24.99, 'Der Spieleklassiker zur Stadt Trier. Mit der Uni Trier als Schlossallee.', null, null);
  -- insert into Artikel values ('', '', '', , '', '', '');

 -- Inhalte fuer Anwendungsfälle
 -- Mögliche Kategorien: Alltag, Schreibwaren,  EssenTrinken, Accessoire, Unterhaltung
 insert into Anwendung values ('001D0100', 'Accessoire');
  insert into Anwendung values ('002A0400', 'Alltag');
  insert into Anwendung values ('003A0500', 'Alltag');
  insert into Anwendung values ('004D0000', 'EssenTrinken');
  insert into Anwendung values ('004D0000', 'Accessoire');
  insert into Anwendung values ('005A0400', 'Alltag');
  insert into Anwendung values ('006A0430', 'EssenTrinken');
  insert into Anwendung values ('006A0430', 'Alltag');
  insert into Anwendung values ('007A0530', 'EssenTrinken');
  insert into Anwendung values ('007A0530', 'Alltag');
  insert into Anwendung values ('008U0300', 'Schreibwaren');
  insert into Anwendung values ('008U0300', 'Accessoire');
  insert into Anwendung values ('009U0404', 'Alltag');
  insert into Anwendung values ('010U0405', 'Alltag');
  insert into Anwendung values ('011U04A6', 'Schreibwaren');
  insert into Anwendung values ('012U05A6', 'Schreibwaren');
  insert into Anwendung values ('013D0000', 'Accessoire');
  insert into Anwendung values ('014A0400', 'Alltag');
  insert into Anwendung values ('015U0412', 'Alltag');
  insert into Anwendung values ('015U0412', 'Accessoire');
  insert into Anwendung values ('016U0400', 'Schreibwaren');
  insert into Anwendung values ('016U0400', 'Accessoire');
  insert into Anwendung values ('017A0000', 'Schreibwaren');
  insert into Anwendung values ('017A0000', 'Accessoire');
  insert into Anwendung values ('018U0400', 'Schreibwaren');
  insert into Anwendung values ('019D0000', 'EssenTrinken');
  insert into Anwendung values ('019D0000', 'Accessoire');
  insert into Anwendung values ('021K042S', 'Alltag');
  insert into Anwendung values ('022K041S', 'Alltag');
  insert into Anwendung values ('023K041M', 'Alltag');
  insert into Anwendung values ('024K041L', 'Alltag');
  insert into Anwendung values ('025K042L', 'Alltag');
  insert into Anwendung values ('026K043L', 'Alltag');
  insert into Anwendung values ('027K062S', 'Alltag'); -- Kapuzensweatshirt grau
  insert into Anwendung values ('028K061S', 'Alltag');
  insert into Anwendung values ('029K061M', 'Alltag');
  insert into Anwendung values ('030K061L', 'Alltag');
  insert into Anwendung values ('031K062L', 'Alltag');
  insert into Anwendung values ('032K063L', 'Alltag');
  insert into Anwendung values ('033K042S', 'Alltag'); -- Kapuzenjacke blau
  insert into Anwendung values ('034K041S', 'Alltag');
  insert into Anwendung values ('035K041M', 'Alltag');
  insert into Anwendung values ('036K041L', 'Alltag');
  insert into Anwendung values ('037K042L', 'Alltag');
  insert into Anwendung values ('038K043L', 'Alltag');
  insert into Anwendung values ('039K062S', 'Alltag'); -- Kapuzenjacke grau
  insert into Anwendung values ('040K061S', 'Alltag');
  insert into Anwendung values ('041K061M', 'Alltag');
  insert into Anwendung values ('042K061L', 'Alltag');
  insert into Anwendung values ('043K062L', 'Alltag');
  insert into Anwendung values ('044K063L', 'Alltag');
  insert into Anwendung values ('045K011S', 'Alltag'); -- Herrenshirt
  insert into Anwendung values ('046K011M', 'Alltag');
  insert into Anwendung values ('047K011L', 'Alltag');
  insert into Anwendung values ('048K012L', 'Alltag');
  insert into Anwendung values ('049K012S', 'Alltag'); -- Damenshirt
  insert into Anwendung values ('050K011S', 'Alltag');
  insert into Anwendung values ('051K011M', 'Alltag');
  insert into Anwendung values ('052K011L', 'Alltag');
  insert into Anwendung values ('053K012L', 'Alltag');
  insert into Anwendung values ('054B0D00', 'Unterhaltung'); -- Geschichte Uni Trier
  insert into Anwendung values ('055B0E00', 'Unterhaltung');
  insert into Anwendung values ('056B0F00', 'Unterhaltung');
  insert into Anwendung values ('057B0C00', 'Unterhaltung');
  insert into Anwendung values ('058B0D00', 'Unterhaltung'); -- Trier
  insert into Anwendung values ('059B0E00', 'Unterhaltung');
  insert into Anwendung values ('060B0F00', 'Unterhaltung');
  insert into Anwendung values ('061B0D00', 'Unterhaltung'); -- Mordsstimmung
  insert into Anwendung values ('062S0000', 'Unterhaltung');
  insert into Anwendung values ('063S0000', 'Unterhaltung');
  --insert into Anwendung values ('', '');

  --Inhalt fuer Geschenkideen
  --Geschenkideen: Mitbringsel, Gastgeschenk, Geschenk, Erinnerungsstück
  insert into Geschenk values ('001D0100', 'Erinnerungsstueck');
  insert into Geschenk values ('002A0400', 'Mitbringsel');
  insert into Geschenk values ('003A0500', 'Mitbringsel');
  insert into Geschenk values ('004D0000', 'Geschenk');
  insert into Geschenk values ('006A0430', 'Geschenk');
  insert into Geschenk values ('006A0430', 'Erinnerungsstueck');
  insert into Geschenk values ('007A0530', 'Geschenk');
  insert into Geschenk values ('007A0530', 'Erinnerungsstueck');
  insert into Geschenk values ('008U0300', 'Geschenk');
  insert into Geschenk values ('009U0404', 'Mitbringsel');
  insert into Geschenk values ('010U0405', 'Mitbringsel');
  insert into Geschenk values ('013D0000', 'Erinnerungsstueck');
  insert into Geschenk values ('015U0412', 'Geschenk');
  insert into Geschenk values ('015U0412', 'Erinnerungsstueck');
  insert into Geschenk values ('016U0400', 'Geschenk');
  insert into Geschenk values ('017A0000', 'Mitbringsel');
  insert into Geschenk values ('017A0000', 'Gastgeschenk');
  insert into Geschenk values ('019D0000', 'Gastgeschenk');
  insert into Geschenk values ('019D0000', 'Geschenk');
  insert into Geschenk values ('021K042S', 'Erinnerungsstueck'); -- Kapuzensweatshirt blau
  insert into Geschenk values ('022K041S', 'Erinnerungsstueck');
  insert into Geschenk values ('023K041M', 'Erinnerungsstueck');
  insert into Geschenk values ('024K041L', 'Erinnerungsstueck');
  insert into Geschenk values ('025K042L', 'Erinnerungsstueck');
  insert into Geschenk values ('026K043L', 'Erinnerungsstueck');
  insert into Geschenk values ('027K062S', 'Erinnerungsstueck'); -- Kapuzensweatshirt grau
  insert into Geschenk values ('028K061S', 'Erinnerungsstueck');
  insert into Geschenk values ('029K061M', 'Erinnerungsstueck');
  insert into Geschenk values ('030K061L', 'Erinnerungsstueck');
  insert into Geschenk values ('031K062L', 'Erinnerungsstueck');
  insert into Geschenk values ('032K063L', 'Erinnerungsstueck');
  insert into Geschenk values ('033K042S', 'Erinnerungsstueck'); -- Kapuzenjacke blau
  insert into Geschenk values ('034K041S', 'Erinnerungsstueck');
  insert into Geschenk values ('035K041M', 'Erinnerungsstueck');
  insert into Geschenk values ('036K041L', 'Erinnerungsstueck');
  insert into Geschenk values ('037K042L', 'Erinnerungsstueck');
  insert into Geschenk values ('038K043L', 'Erinnerungsstueck');
  insert into Geschenk values ('039K062S', 'Erinnerungsstueck'); -- Kapuzenjacke grau
  insert into Geschenk values ('040K061S', 'Erinnerungsstueck');
  insert into Geschenk values ('041K061M', 'Erinnerungsstueck');
  insert into Geschenk values ('042K061L', 'Erinnerungsstueck');
  insert into Geschenk values ('043K062L', 'Erinnerungsstueck');
  insert into Geschenk values ('044K063L', 'Erinnerungsstueck');
  insert into Geschenk values ('045K011S', 'Erinnerungsstueck'); -- Herrenshirt
  insert into Geschenk values ('046K011M', 'Erinnerungsstueck');
  insert into Geschenk values ('047K011L', 'Erinnerungsstueck');
  insert into Geschenk values ('048K012L', 'Erinnerungsstueck');
  insert into Geschenk values ('049K012S', 'Erinnerungsstueck'); -- Damenshirt
  insert into Geschenk values ('050K011S', 'Erinnerungsstueck');
  insert into Geschenk values ('051K011M', 'Erinnerungsstueck');
  insert into Geschenk values ('052K011L', 'Erinnerungsstueck');
  insert into Geschenk values ('053K012L', 'Erinnerungsstueck');
  insert into Geschenk values ('054B0D00', 'Geschenk');         -- Geschichte Uni Trier
  insert into Geschenk values ('054B0D00', 'Erinnerungsstueck');
  insert into Geschenk values ('055B0E00', 'Gastgeschenk');
  insert into Geschenk values ('055B0E00', 'Erinnerungsstueck');
  insert into Geschenk values ('056B0F00', 'Gastgeschenk');
  insert into Geschenk values ('056B0F00', 'Erinnerungsstueck');
  insert into Geschenk values ('057B0C00', 'Gastgeschenk');
  insert into Geschenk values ('057B0C00', 'Erinnerungsstueck');
  insert into Geschenk values ('058B0D00', 'Geschenk');         -- Trier
  insert into Geschenk values ('058B0D00', 'Erinnerungsstueck');
  insert into Geschenk values ('059B0E00', 'Gastgeschenk');
  insert into Geschenk values ('059B0E00', 'Erinnerungsstueck');
  insert into Geschenk values ('060B0F00', 'Gastgeschenk');
  insert into Geschenk values ('060B0F00', 'Erinnerungsstueck');
  insert into Geschenk values ('061B0D00', 'Geschenk');         -- Mordsstimmung
  insert into Geschenk values ('062S0000', 'Geschenk');         -- Spiele
  insert into Geschenk values ('062S0000', 'Gastgeschenk');
  insert into Geschenk values ('063S0000', 'Geschenk');
  insert into Geschenk values ('063S0000', 'Gastgeschenk');
  --insert into Geschenk values ('', '');


create table PseudotabellePro as( 
select *, 0 as queried
from artikel a 
natural full outer join geschenk
natural full outer join anwendung
);

select * 
from pseudotabellepro


--hier das löschen
delete from pseudotabellepro
where art = 'Kleidung' and groesse not like '%M%'

select * 
from pseudotabellepro
where art = 'Kleidung'

update pseudotabellepro
set artnr = '023K041'
where artnr = '023K041M'


update pseudotabellepro
set artnr = '029K061'
where artnr = '029K061M'

update pseudotabellepro
set artnr = '046K011'
where artnr = '046K011M'

update pseudotabellepro
set artnr = '035K041'
where artnr = '035K041M'

update pseudotabellepro
set artnr = '041K061'
where artnr = '041K061M'

update pseudotabellepro
set artnr = '051K011'
where artnr = '051K011M'



/* WICHTIG! FÜR DEN WORKAROUND FÜR NULLWERTE! */

update pseudotabellepro
set name = 'nichts'
where name is null

update pseudotabellepro
set art = 'nichts'
where art is null

update pseudotabellepro
set ausfuehrung = 'nichts'
where ausfuehrung is null

update pseudotabellepro
set ausfuehrung = 'nichts'
where ausfuehrung is null

update pseudotabellepro
set groesse = 'nichts'
where groesse is null

update pseudotabellepro
set geschenkidee = 'nichts'
where geschenkidee is null

update pseudotabellepro
set preis = -1
where preis is null

update pseudotabellepro
set anwendungsgebiet = 'nichts'
where anwendungsgebiet is null

/* wegen der Farben*/

update pseudotabellepro
set ausfuehrung = 'Blau'
where ausfuehrung = 'blau'

update pseudotabellepro
set ausfuehrung = 'Grün'
where ausfuehrung = 'grün'

/*
 update pseudotabellepro
set ausfuehrung = 'Grün'
where ausfuehrung = 'grün'
  
 */

update pseudotabellepro
set ausfuehrung = 'Grau'
where ausfuehrung = 'grau'

update pseudotabellepro
set ausfuehrung = 'Schwarz'
where ausfuehrung = 'schwarz'




/*
select * from Artikel;
select * from pseudotabellepro;
select * from Artikel natural join Geschenk where art = 'Buch' and ausfuehrung = 'Englisch' and geschenkidee = 'Gastgeschenk' and preis <= 30;
*/

/* ERSTELLEN VARIABLEN 
 * DIESE SOLLEN IN DER QUERY DANN AUSGEFÜLLT WERDEN!
 * */



