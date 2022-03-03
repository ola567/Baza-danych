--baza lek�w, kt�re lekarz mo�e przepisa�
INSERT INTO Leki VALUES
	('lek przeciwbo�lowy', 'Ketonal', 0),
	(NULL, 'paracetamol', 0),
	('ma�� do stosowania na sk�r�', 'ma�� ch�odz�ca', 0),
	('steryd do stosowania zewn�trzengo', 'Elocom', 0),
	('lek na astm�', 'Orem', 1),
	('antybiotyk dla dzieci', 'Klabax', 0),
	('antybotyk dla doros�ych', 'Augmentin', 0),
	(NULL, 'Ketonal', 0),
	('na kaszel', 'ACC Optima', 0),
	('lek przeciwb�lowy', 'acomitum', 1),
	('lek na osteoporoz�', 'Solgar', 0),
	('witaminaD', 'Advanitn', 0),
	('na dn� moczanow�','Milurit', 0);

--baza lekarzy pracuj�cych w przychodni
INSERT INTO Osoba VALUES('Anna','Nowak','698283481','ania.nowak@wp.pl');
INSERT INTO Lekarze VALUES(1, IDENT_CURRENT('Osoba'), 1);
INSERT INTO Osoba VALUES('Jan','Kowalski','432684712',NULL);
INSERT INTO Lekarze VALUES(2, IDENT_CURRENT('Osoba'), 1);
INSERT INTO Osoba VALUES('Aleksander','Wi�niewski','695483754','aleksa.msa@wp.pl');
INSERT INTO Lekarze VALUES(3,IDENT_CURRENT('Osoba'), 1);
INSERT INTO Osoba VALUES('Alina','Kowalczyk','796485692',NULL);
INSERT INTO Lekarze VALUES(4,IDENT_CURRENT('Osoba'), 1);
INSERT INTO Osoba VALUES('Barbara','Zieli�ska','806805923','barba.ziel@o2.pl');
INSERT INTO Lekarze VALUES(3,IDENT_CURRENT('Osoba'), 0);
INSERT INTO Osoba VALUES('Bogumi�','P�achecki','897029132',NULL);
INSERT INTO Lekarze VALUES(2,IDENT_CURRENT('Osoba'), 0);
INSERT INTO Osoba VALUES('Bernadeta','Wo�niak','236847353',NULL);
INSERT INTO Lekarze VALUES(3,IDENT_CURRENT('Osoba'), 0);
INSERT INTO Osoba VALUES('Kamil','Bogus�awski','694382574','kamis@wp.pl');
INSERT INTO Lekarze VALUES(1,IDENT_CURRENT('Osoba'), 0);
INSERT INTO Osoba VALUES('Boles�awa','Kwiatkowska','685372812',NULL);
INSERT INTO Lekarze VALUES(1,IDENT_CURRENT('Osoba'), 0);
INSERT INTO Osoba VALUES('Marian','Krawczyk','685743829',NULL);
INSERT INTO Lekarze VALUES(2,IDENT_CURRENT('Osoba'), 0);

--zarejstrowanie pacjenta, kt�ry niekoniecznie chce i�� na wizyt�
INSERT INTO Osoba VALUES('Aleksandra', 'Hein', '694718475', 'aleksandra.hein@02.pl');
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Sienkiewicza', '8a', NULL);
INSERT INTO Pacjenci VALUES('76092258719', '2001.02.23', 'K', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);

--rejstracja pacjent�w, kt�rzy chc� skorzysta� z porady lekarza i um�wi� si� na wizyt� lub wzi�� recept�
--przypadek, gdy wizyta zosta�a um�wiona, ale si� nie odby�a
INSERT INTO Osoba VALUES('Jakub', 'Windak', '660483500', 'jakub.windak@wp.pl');
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Bajkowa', '7', 7);
INSERT INTO Pacjenci VALUES('81070527210', '2001.02.23', 'M', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('81070527210',3, '2022.01.12 10:00:00', 'badanie', NULL, NULL, 0);

--przypadek, gdy pacjent chce tylko recept�, co jest r�wnoznaczne z tym, �e warto�� bool pola Czy_sie_odbyla jest ustawiona na 0
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

--przypadek, gdy pacjent jest chory i jest wpisane zwolnienie L4 oraz skierowanie na prze�wietleni p�uc w celu
--zobaczenia stanu p�uc, czy kwalifikuje si� do leczenia szpitalnego oraz wst�pne przepisanie lek�w
INSERT INTO Osoba VALUES('Julia', 'Mazur', NULL, NULL);
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Sienkiewicza', '13b', 8);
INSERT INTO Pacjenci VALUES('68041661219', '1989.01.02', 'K', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('68041661219',1, '2022.01.13 9:00:00', 'badanie', '2022.01.13', '2022.01.27', 1);
INSERT INTO Choroby VALUES('Zapalenie p�uc', 'ci�ki'); 
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.13', '2022.02.13', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(7, IDENT_CURRENT('Recepta'), 'jedna tabletka rano', 12, 2);
INSERT INTO Rodzaj_skierowania VALUES('prze�wietlenie p�uc');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.13', '2022.02.13');

--przypadek, gdy pacjent chce klika recept na wizycie, jedna choroba zosta�a zdiagnozowana i na ni� zostaj� przepisane leki
--a druga recepta zawiera leki, kt�re pacjent przyjmuje ze wzgledu na swoj� przewlek�� chorob�
--ponadto pacjent chce r�wnie� skierowanie na badanie krwi w celach profilaktycznych, kt�re wykona po wyzdrowieniu
INSERT INTO Osoba VALUES('Kacper', 'Strzy�a', '432981920', NULL);
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Kwiatowa', '199',12);
INSERT INTO Pacjenci VALUES('80082027476', '1973.06.03', 'm', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('80082027476',2, '2022.01.10 8:20:00', 'badanie+diagnoza', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Grypa', '�redni'); 
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.10', '2022.02.10', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(7, IDENT_CURRENT('Recepta'), 'dwie tabletki w ci�gu doby', 7, DEFAULT);
INSERT INTO Recepta VALUES('2022.01.10', '2022.02.10', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(3, IDENT_CURRENT('Recepta'), 'dwie tabletki w ci�gu doby', 31, 2);
INSERT INTO Rodzaj_skierowania VALUES('badanie krwii - podstawowe');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.10', '2022.02.10');

--kilka lek�w na jednej recepcie
--lekarz wypisuje skierowanie do lekarza specjalisty, gdy� mo�e podejrzewa� jeszcze inne choroby
INSERT INTO Osoba VALUES('Maciej', 'R�a', '453958295', NULL);
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Miodowa', '132D', NULL);
INSERT INTO Pacjenci VALUES('05241424965', '1999.06.08', 'm', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('05241424965',2, '2022.01.09 11:25:00', 'recepta+wst�pna diagnoza', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Wrzody �o��dka', 'ci�ki'); 
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), 'zaawnsowane', 'choroba nieuleczalna');
INSERT INTO Recepta VALUES('2022.01.09', '2022.02.09', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(1, IDENT_CURRENT('Recepta'), 'stosowa� jedn� na dzie�, gdy silny atak b�lu', 1, DEFAULT);
INSERT INTO Leki_na_recepcie VALUES(11, IDENT_CURRENT('Recepta'), 'jedna na dzie�', 31, DEFAULT);
INSERT INTO Leki_na_recepcie VALUES(12, IDENT_CURRENT('Recepta'), 'jedna na dzie�', 31, DEFAULT);
INSERT INTO Rodzaj_skierowania VALUES('badanie krwii - podstawowe');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.09', '2022.02.09');

--dodatkowy insert do SELECT zapytanie 2
INSERT INTO Wizyta VALUES('05241424965',2, '2022.01.10 13:00', 'recepta', NULL, NULL, 1);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), 3, 'zaawnsowane', 'choroba nieuleczalna');
INSERT INTO Recepta VALUES('2022.01.09', '2022.02.09', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(1, IDENT_CURRENT('Recepta'), 'stosowa� jedn� na dzie�, gdy silny atak b�lu', 1, DEFAULT);
INSERT INTO Leki_na_recepcie VALUES(11, IDENT_CURRENT('Recepta'), 'jedna na dzie�', 31, DEFAULT);

--zdiagnozowanie dw�ch chor�b u pacjenta na podstawie opisu dolegliwo�ci i wypisanie skierwania do szpitala
INSERT INTO Osoba VALUES('Marcin','Kubiak', NULL, 'kubiak@o2.pl');
INSERT INTO Adresy VALUES('80-100', 'Borzyszkowy', 'Sienkiewicza', '8c', NULL);
INSERT INTO Pacjenci VALUES('69101364583', '1982.12.05', 'm', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('69101364583',1, '2022.01.12 12:00:00', 'badanie', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Covid-19', 'bezobjawowy'); 
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, 'prze�yje');
INSERT INTO Choroby VALUES('Zapalenie wyrostka robaczkowego', 'stan pacjenta jest stabliny');
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), 'do operacji', 'prze�yje');
INSERT INTO Rodzaj_skierowania VALUES('skierowanie do szpitala');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.12', '2022.01.12');

--przypadek, gdy lekarz nie mo�e zdefiniowa� choroby i wystawia szereg skierowa� na badanie
INSERT INTO Osoba VALUES('Miros�awa', 'K�apsia', '430958698', NULL);
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Wojska Polskiego', '3a', 12);
INSERT INTO Pacjenci VALUES('71030818925', '2000.02.12', 'K', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('71030818925',3, '2022.01.12 9:35:00', 'badanie', NULL, NULL, 1);
INSERT INTO Rodzaj_skierowania VALUES('skierowanie na USG brzucha');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.12', '2022.02.12');
INSERT INTO Rodzaj_skierowania VALUES('skierowanie na gastroskopi�');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.12', '2022.02.12');
INSERT INTO Rodzaj_skierowania VALUES('skierowanie na kolonoskopi�');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.12', '2022.02.12');

--lekarz wystawia dwie recepty, bo na pierwszej zapomnia� doda� jednego leku oraz skierowanie na badanie
--modyfikacja do SELECT zapytanie 2
INSERT INTO Osoba VALUES('Luzia', 'Nierzwicka', NULL, 'lui@wp.pl');
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Mieros�awskiego', '1c',20);
INSERT INTO Pacjenci VALUES('01222301008', '1956.06.20', 'K', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('01222301008',4, '2022.01.13 12:30:00', 'badanie', NULL, NULL, 1);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), 5, NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.13', '2022.02.13', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(13, IDENT_CURRENT('Recepta'), 'dwie na dob�', 31, 2);
INSERT INTO Recepta VALUES('2022.01.13', '2022.02.13', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(5, IDENT_CURRENT('Recepta'), 'stosowa� dwukrotnie w ciagu dnia', 31, DEFAULT);
INSERT INTO Rodzaj_skierowania VALUES('badanie moczu');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'), '2022.01.13', '2022.02.13');

--wpisanie przez lekarza diagnozy z o�rodka specjalistycznego i wypisanie recepty na lek
INSERT INTO Osoba VALUES('Emil', 'Hojnacka', NULL, NULL);
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Mieros�awskiego', '12b', 2);
INSERT INTO Pacjenci VALUES('04291191816', '2001.11.11', 'M', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('04291191816',4, '2022.01.14 9:30:00', 'recepta+wpis choroby', NULL, NULL, 1);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), 5, NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.14', '2022.02.14', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(13, IDENT_CURRENT('Recepta'), 'dwie na dob�', 31, 2);

--lekarz postawi� wst�pn� diagnoz�, jednak aby si� upewni� kieruje pacjenta na badania
--przepisuje recept� na leki do chor�by przewlek�ej pacjenta, gdy� te mu si� sko�czy�y
INSERT INTO Osoba VALUES('Wiktor','Zygier', '695838284', 'wiki@wp.pl');
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Polanek', '23a', NULL);
INSERT INTO Pacjenci VALUES('94092654793', '2002.10.10', 'U', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 0);
INSERT INTO Wizyta VALUES('94092654793',2, '2022.01.14 12:30:00', 'badanie', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Atopowe zapalenie sk�ry','�agodny');
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.14', '2022.02.14', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(4,IDENT_CURRENT('Recepta'), 'raz dziennie', 2, 1);
INSERT INTO Rodzaj_skierowania VALUES('testy sk�rne');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'),'2022.01.14','2022.02.14');

--wizyta, na kt�rej lekarz sprawdza wyniki bada� kontrolnych pacjenta, kt�ry ju� wcze�niej by� w przychodni, wypisuje skierowania na dalsze badania w przypadku z�ych wynik�w oraz
--stawia prawdopodobn� diagnoz�
INSERT INTO Wizyta VALUES('01222301008',2,'2022.01.12 13:00:00', 'ocena wynik�w', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Choroba wie�cowa serca', NULL);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, NULL);
INSERT INTO Rodzaj_skierowania VALUES('echokardiografia');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'),'2022.01.12','2022.02.12');
INSERT INTO Rodzaj_skierowania VALUES('krew: cholesterol, tryponina; mocz');
INSERT INTO Wizyta_skierowanie VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Rodzaj_skierowania'),'2022.01.12','2022.02.12');

--wizyta, na kt�rej lekarz stawia diagnoz� na podstawie wynik�w bada� i przepisuje leki
INSERT INTO Wizyta VALUES('80082027476', 1, '2022.01.07 8:30:00', 'diagnoza', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Wrzody �o��dka',NULL);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.07','2022.02.07', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(1, IDENT_CURRENT('Recepta'), 'dwie na dob�', 5, DEFAULT);

--dodatkowa tabela do SELECT
INSERT INTO Wizyta VALUES('80082027476', 1, '2022.01.15 8:30', 'diagnoza', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Mia�d�yca',NULL);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), IDENT_CURRENT('Choroby'), NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.15','2022.01.15', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(1, IDENT_CURRENT('Recepta'), 'dwie na dob�', 5, DEFAULT);

--dodatkowy INSERT na potrzeby SELECT
INSERT INTO Wizyta VALUES('01222301008', 2, '2022.01.15 8:30', 'diagnoza', NULL, NULL, 1);
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), 8, NULL, NULL);
INSERT INTO Recepta VALUES('2022.01.15','2022.01.15', IDENT_CURRENT('Wizyta'));
INSERT INTO Leki_na_recepcie VALUES(1, IDENT_CURRENT('Recepta'), 'dwie na dob�', 5, DEFAULT);

--dodatkowy INSERT na potrzeby SELECT zapytanie 2
INSERT INTO Osoba VALUES('S�awomir', 'Nikt', '123123123', NULL);
INSERT INTO Adresy VALUES(DEFAULT, DEFAULT, 'Wojska Polskiego', '3a', 12);
INSERT INTO Pacjenci VALUES('71030818920', '2000.02.12', 'K', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Osoba'), 1);
INSERT INTO Wizyta VALUES('71030818920',3, '2022.01.12 9:35:00', 'badanie', NULL, NULL, 1);
INSERT INTO Choroby VALUES('Nadci�nienie t�tnicze',NULL);
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
INSERT INTO Diagnozy VALUES(IDENT_CURRENT('Wizyta'), 3, 'ci�ki', 'nie ma szans na wyzdrowienie, przypadek beznadziejny');

--dodatkowy INSERT na potrzeby SELECT zapytanie4
INSERT INTO Wizyta VALUES('81070527210', 1, '2022.01.01 10:00', 'badanie', NULL, NULL, 1);







