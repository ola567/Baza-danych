--baza leków, które lekarz mo¿e przepisaæ
INSERT INTO Leki VALUES
	('lek przeciwboólowy', 'Ketonal', 0),
	(NULL, 'paracetamol', 0),
	('maœæ do stosowania na skórê', 'maœæ ch³odz¹ca', 0),
	('steryd do stosowania zewnêtrzengo', 'Elocom', 0),
	('lek na astmê', 'Orem', 1),
	('antybiotyk dla dzieci', 'Klabax', 0),
	('antybotyk dla doros³ych', 'Augmentin', 0),
	(NULL, 'Ketonal', 0),
	('na kaszel', 'ACC Optima', 0),
	('lek przeciwbólowy', 'acomitum', 1),
	('lek na osteoporozê', 'Solgar', 0),
	('witaminaD', 'Advanitn', 0),
	('na dnê moczanow¹','Milurit', 0);

--baza lekarzy pracuj¹cych w przychodni
INSERT INTO Osoba VALUES('Anna','Nowak','698283481','ania.nowak@wp.pl');
INSERT INTO Lekarze VALUES(1, IDENT_CURRENT('Osoba'), 1);
INSERT INTO Osoba VALUES('Jan','Kowalski','432684712',NULL);
INSERT INTO Lekarze VALUES(2, IDENT_CURRENT('Osoba'), 1);
INSERT INTO Osoba VALUES('Aleksander','Wiœniewski','695483754','aleksa.msa@wp.pl');
INSERT INTO Lekarze VALUES(3,IDENT_CURRENT('Osoba'), 1);
INSERT INTO Osoba VALUES('Alina','Kowalczyk','796485692',NULL);
INSERT INTO Lekarze VALUES(4,IDENT_CURRENT('Osoba'), 1);
INSERT INTO Osoba VALUES('Barbara','Zieliñska','806805923','barba.ziel@o2.pl');
INSERT INTO Lekarze VALUES(3,IDENT_CURRENT('Osoba'), 0);
INSERT INTO Osoba VALUES('Bogumi³','P³achecki','897029132',NULL);
INSERT INTO Lekarze VALUES(2,IDENT_CURRENT('Osoba'), 0);
INSERT INTO Osoba VALUES('Bernadeta','WoŸniak','236847353',NULL);
INSERT INTO Lekarze VALUES(3,IDENT_CURRENT('Osoba'), 0);
INSERT INTO Osoba VALUES('Kamil','Bogus³awski','694382574','kamis@wp.pl');
INSERT INTO Lekarze VALUES(1,IDENT_CURRENT('Osoba'), 0);
INSERT INTO Osoba VALUES('Boles³awa','Kwiatkowska','685372812',NULL);
INSERT INTO Lekarze VALUES(1,IDENT_CURRENT('Osoba'), 0);
INSERT INTO Osoba VALUES('Marian','Krawczyk','685743829',NULL);
INSERT INTO Lekarze VALUES(2,IDENT_CURRENT('Osoba'), 0);

--zarejstrowanie pacjenta, który niekoniecznie chce iœæ na wizytê
INSERT INTO Osoba VALUES('Aleksandra', 'Hein', '694718475', 'aleksandra.hein@02.pl');
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Sienkiewicza', '8a', NULL);
INSERT INTO Pacjenci VALUES('76092258719', '2001.02.23', 'K', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);

--rejstracja pacjentów, którzy chc¹ skorzystaæ z porady lekarza i umówiæ siê na wizytê lub wzi¹æ receptê
--przypadek, gdy wizyta zosta³a umówiona, ale siê nie odby³a
INSERT INTO Osoba VALUES('Jakub', 'Windak', '660483500', 'jakub.windak@wp.pl');
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Bajkowa', '7', 7);
INSERT INTO Pacjenci VALUES('81070527210', '2001.02.23', 'M', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('81070527210',3, '2022.01.12 10:00:00', 'badanie', NULL, NULL, 0);

--przypadek, gdy pacjent chce tylko receptê, co jest równoznaczne z tym, ¿e wartoœæ bool pola Czy_sie_odbyla jest ustawiona na 0
INSERT INTO Osoba VALUES('Jan', 'Nowak', '6604835772', 'jan.nowak@wp.pl');
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Bajkowa', '12', 7);
INSERT INTO Pacjenci VALUES('81070527219', '1999.12.04', 'M', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('81070527219',3, '2022.01.13 8:30:00', 'recepta', NULL, NULL, 0);
INSERT INTO Recepta VALUES('2022.01.13', '2022.02.13', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(1, IDENT_CURRENT('Recepta'), 'dwie tabletki', 31, 2);

--dodatkowy INSERT na rzecz SELECT zapytanie 5
INSERT INTO Wizyta VALUES('81070527219',3, '2022.02.13 8:30:00', 'recepta', NULL, NULL, 0);
INSERT INTO Recepta VALUES('2022.02.13', '2022.03.13', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(1, IDENT_CURRENT('Recepta'), 'dwie tabletki', 31, 2);

--dodatkowy INSERT na rzecz SELECT zapytanie 5
INSERT INTO Wizyta VALUES('81070527219',3, '2022.03.13 8:30:00', 'recepta', NULL, NULL, 0);
INSERT INTO Recepta VALUES('2022.03.13', '2022.04.13', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(1, IDENT_CURRENT('Recepta'), 'dwie tabletki', 31, 2);

--dodatkowy INSERT na rzecz SELECT zapytanie 5
INSERT INTO Wizyta VALUES('81070527219',2, '2022.03.13 8:30:00', 'recepta', NULL, NULL, 0);
INSERT INTO Recepta VALUES('2022.03.13', '2022.04.13', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(2, IDENT_CURRENT('Recepta'), 'dwie tabletki', 31, 2);
INSERT INTO Leki_na_recepcie VALUES(3, IDENT_CURRENT('Recepta'), 'dwie tabletki', 31, 2);
INSERT INTO Leki_na_recepcie VALUES(4, IDENT_CURRENT('Recepta'), 'dwie tabletki', 31, 2);

--przypadek, gdy pacjent jest chory i jest wpisane zwolnienie L4 oraz skierowanie na przeœwietleni p³uc w celu
--zobaczenia stanu p³uc, czy kwalifikuje siê do leczenia szpitalnego oraz wstêpne przepisanie leków
INSERT INTO Osoba VALUES('Julia', 'Mazur', NULL, NULL);
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Sienkiewicza', '13b', 8);
INSERT INTO Pacjenci VALUES('68041661219', '1989.01.02', 'K', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('68041661219',1, '2022.01.13 9:00:00', 'badanie', '2022.01.13', '2022.01.27', 1);
INSERT INTO Choroby VALUES('Zapalenie p³uc', 'ciê¿ki'); 
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.13', '2022.02.13', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(7, IDENT_CURRENT('Recepta'), 'jedna tabletka rano', 12, 2);
INSERT INTO Rodzaj_skierowania VALUES('przeœwietlenie p³uc');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.13', '2022.02.13');

--przypadek, gdy pacjent chce klika recept na wizycie, jedna choroba zosta³a zdiagnozowana i na ni¹ zostaj¹ przepisane leki
--a druga recepta zawiera leki, które pacjent przyjmuje ze wzgledu na swoj¹ przewlek³¹ chorobê
--ponadto pacjent chce równie¿ skierowanie na badanie krwi w celach profilaktycznych, które wykona po wyzdrowieniu
INSERT INTO Osoba VALUES('Kacper', 'Strzy¿a', '432981920', NULL);
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Kwiatowa', '199',12);
INSERT INTO Pacjenci VALUES('80082027476', '1973.06.03', 'm', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('80082027476',2, '2022.01.10 8:20:00', 'badanie+diagnoza', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Grypa', 'œredni'); 
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.10', '2022.02.10', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(7, IDENT_CURRENT('Recepta'), 'dwie tabletki w ci¹gu doby', 7, DEFAULT);
INSERT INTO Recepta VALUES('2022.01.10', '2022.02.10', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(3, IDENT_CURRENT('Recepta'), 'dwie tabletki w ci¹gu doby', 31, 2);
INSERT INTO Rodzaj_skierowania VALUES('badanie krwii - podstawowe');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.10', '2022.02.10');

--kilka leków na jednej recepcie
--lekarz wypisuje skierowanie do lekarza specjalisty, gdy¿ mo¿e podejrzewaæ jeszcze inne choroby
INSERT INTO Osoba VALUES('Maciej', 'Ró¿a', '453958295', NULL);
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Miodowa', '132D', NULL);
INSERT INTO Pacjenci VALUES('05241424965', '1999.06.08', 'm', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('05241424965',2, '2022.01.09 11:25:00', 'recepta+wstêpna diagnoza', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Wrzody ¿o³¹dka', 'ciê¿ki'); 
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), 'zaawnsowane', 'choroba nieuleczalna');
INSERT INTO Recepta VALUES('2022.01.09', '2022.02.09', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(1, IDENT_CURRENT('Recepta'), 'stosowaæ jedn¹ na dzieñ, gdy silny atak bólu', 1, DEFAULT);
INSERT INTO Leki_na_recepcie VALUES(11, IDENT_CURRENT('Recepta'), 'jedna na dzieñ', 31, DEFAULT);
INSERT INTO Leki_na_recepcie VALUES(12, IDENT_CURRENT('Recepta'), 'jedna na dzieñ', 31, DEFAULT);
INSERT INTO Rodzaj_skierowania VALUES('badanie krwii - podstawowe');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.09', '2022.02.09');

--dodatkowy insert do SELECT zapytanie 2
INSERT INTO Wizyta VALUES('05241424965',2, '2022.01.10 13:00', 'recepta', NULL, NULL, 1);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), 3, 'zaawnsowane', 'choroba nieuleczalna');
INSERT INTO Recepta VALUES('2022.01.09', '2022.02.09', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(1, IDENT_CURRENT('Recepta'), 'stosowaæ jedn¹ na dzieñ, gdy silny atak bólu', 1, DEFAULT);
INSERT INTO Leki_na_recepcie VALUES(11, IDENT_CURRENT('Recepta'), 'jedna na dzieñ', 31, DEFAULT);

--zdiagnozowanie dwóch chorób u pacjenta na podstawie opisu dolegliwoœci i wypisanie skierwania do szpitala
INSERT INTO Osoba VALUES('Marcin','Kubiak', NULL, 'kubiak@o2.pl');
INSERT INTO Adresy VALUES('80-100', 'Borzyszkowy', 'Sienkiewicza', '8c', NULL);
INSERT INTO Pacjenci VALUES('69101364583', '1982.12.05', 'm', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('69101364583',1, '2022.01.12 12:00:00', 'badanie', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Covid-19', 'bezobjawowy'); 
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, 'prze¿yje');
INSERT INTO Choroby VALUES('Zapalenie wyrostka robaczkowego', 'stan pacjenta jest stabliny');
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), 'do operacji', 'prze¿yje');
INSERT INTO Rodzaj_skierowania VALUES('skierowanie do szpitala');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.12', '2022.01.12');

--przypadek, gdy lekarz nie mo¿e zdefiniowaæ choroby i wystawia szereg skierowañ na badanie
INSERT INTO Osoba VALUES('Miros³awa', 'K³apsia', '430958698', NULL);
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Wojska Polskiego', '3a', 12);
INSERT INTO Pacjenci VALUES('71030818925', '2000.02.12', 'K', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('71030818925',3, '2022.01.12 9:35:00', 'badanie', NULL, NULL, 1);
INSERT INTO Rodzaj_skierowania VALUES('skierowanie na USG brzucha');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.12', '2022.02.12');
INSERT INTO Rodzaj_skierowania VALUES('skierowanie na gastroskopiê');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.12', '2022.02.12');
INSERT INTO Rodzaj_skierowania VALUES('skierowanie na kolonoskopiê');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.12', '2022.02.12');

--lekarz wystawia dwie recepty, bo na pierwszej zapomnia³ dodaæ jednego leku oraz skierowanie na badanie
--modyfikacja do SELECT zapytanie 2
INSERT INTO Osoba VALUES('Luzia', 'Nierzwicka', NULL, 'lui@wp.pl');
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Mieros³awskiego', '1c',20);
INSERT INTO Pacjenci VALUES('01222301008', '1956.06.20', 'K', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('01222301008',4, '2022.01.13 12:30:00', 'badanie', NULL, NULL, 1);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), 5, NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.13', '2022.02.13', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(13, IDENT_CURRENT('Recepta'), 'dwie na dobê', 31, 2);
INSERT INTO Recepta VALUES('2022.01.13', '2022.02.13', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(5, IDENT_CURRENT('Recepta'), 'stosowaæ dwukrotnie w ciagu dnia', 31, DEFAULT);
INSERT INTO Rodzaj_skierowania VALUES('badanie moczu');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.13', '2022.02.13');

--wpisanie przez lekarza diagnozy z oœrodka specjalistycznego i wypisanie recepty na lek
INSERT INTO Osoba VALUES('Emil', 'Hojnacka', NULL, NULL);
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Mieros³awskiego', '12b', 2);
INSERT INTO Pacjenci VALUES('04291191816', '2001.11.11', 'M', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('04291191816',4, '2022.01.14 9:30:00', 'recepta+wpis choroby', NULL, NULL, 1);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), 5, NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.14', '2022.02.14', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(13, IDENT_CURRENT('Recepta'), 'dwie na dobê', 31, 2);

--lekarz postawi³ wstêpn¹ diagnozê, jednak aby siê upewniæ kieruje pacjenta na badania
--przepisuje receptê na leki do choróby przewlek³ej pacjenta, gdy¿ te mu siê skoñczy³y
INSERT INTO Osoba VALUES('Wiktor','Zygier', '695838284', 'wiki@wp.pl');
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Polanek', '23a', NULL);
INSERT INTO Pacjenci VALUES('94092654793', '2002.10.10', 'U', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('94092654793',2, '2022.01.14 12:30:00', 'badanie', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Atopowe zapalenie skóry','³agodny');
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.14', '2022.02.14', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(4,IDENT_CURRENT('Recepta'), 'raz dziennie', 2, 1);
INSERT INTO Rodzaj_skierowania VALUES('testy skórne');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'),'2022.01.14','2022.02.14');

--wizyta, na której lekarz sprawdza wyniki badañ kontrolnych pacjenta, który ju¿ wczeœniej by³ w przychodni, wypisuje skierowania na dalsze badania w przypadku z³ych wyników oraz
--stawia prawdopodobn¹ diagnozê
INSERT INTO Wizyta VALUES('01222301008',2,'2022.01.12 13:00:00', 'ocena wyników', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Choroba wieñcowa serca', NULL);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, NULL);
INSERT INTO Rodzaj_skierowania VALUES('echokardiografia');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'),'2022.01.12','2022.02.12');
INSERT INTO Rodzaj_skierowania VALUES('krew: cholesterol, tryponina; mocz');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'),'2022.01.12','2022.02.12');

--wizyta, na której lekarz stawia diagnozê na podstawie wyników badañ i przepisuje leki
INSERT INTO Wizyta VALUES('80082027476', 1, '2022.01.07 8:30:00', 'diagnoza', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Wrzody ¿o³¹dka',NULL);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.07','2022.02.07', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(1, IDENT_CURRENT('Recepta'), 'dwie na dobê', 5, DEFAULT);

--dodatkowa tabela do SELECT
INSERT INTO Wizyta VALUES('80082027476', 1, '2022.01.15 8:30', 'diagnoza', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Mia¿d¿yca',NULL);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.15','2022.01.15', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(1, IDENT_CURRENT('Recepta'), 'dwie na dobê', 5, DEFAULT);

--dodatkowy INSERT na potrzeby SELECT
INSERT INTO Wizyta VALUES('01222301008', 2, '2022.01.15 8:30', 'diagnoza', NULL, NULL, 1);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), 8, NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.15','2022.01.15', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(1, IDENT_CURRENT('Recepta'), 'dwie na dobê', 5, DEFAULT);

--dodatkowy INSERT na potrzeby SELECT zapytanie 2
INSERT INTO Osoba VALUES('S³awomir', 'Nikt', '123123123', NULL);
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Wojska Polskiego', '3a', 12);
INSERT INTO Pacjenci VALUES('71030818920', '2000.02.12', 'K', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 1);
INSERT INTO Wizyta VALUES('71030818920',3, '2022.01.12 9:35:00', 'badanie', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Nadciœnienie têtnicze',NULL);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, NULL);

--dodatkowy INSERT na potrzeby SELECT zapytanie 3
INSERT INTO Wizyta VALUES('71030818920',1, '2022.01.12 9:35:00', 'badanie', NULL, NULL, 1);

--dodatkowy INSERT na potrzeby SELECT zapytanie 3
INSERT INTO Wizyta VALUES('80082027476',1, '2022.01.12 10:00', 'badanie', NULL, NULL, 1);

--dodatkowy INSERT na potrzeby SELECT zapytanie 3
INSERT INTO Wizyta VALUES('94092654793',1, '2022.01.12 8:00', 'badanie', NULL, NULL, 1);

--dodatkowy INSERT na potrzeby SELECT zapytanie6
INSERT INTO Wizyta VALUES('71030818920',3, '2022.03.12 12:00', 'badanie', NULL, NULL, 1);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), 2, 'lekki', 'wyzdrowieje');

--dodatkowy INSERT na potrzeby SELECT zapytanie6
INSERT INTO Wizyta VALUES('71030818920',3, '2022.04.12 8:30', 'badanie', NULL, NULL, 1);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), 3, 'ciê¿ki', 'nie ma szans na wyzdrowienie, przypadek beznadziejny');

--dodatkowy INSERT na potrzeby SELECT zapytanie4
INSERT INTO Wizyta VALUES('81070527210', 1, '2022.01.01 10:00', 'badanie', NULL, NULL, 1);







