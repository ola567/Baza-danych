--Zapytanie 4
--Nowy pacjent nie wie, do kt�rego gabinetu ma si� uda� na wizyt�. W zwi�zku z tym pyta si� o to pani� w recepcji, kt�ra akurat zapomnia�a przypisany do tego lekarza gabinet.
--Istnieje zatem potrzeba sprawdzenia numeru gabinetu w kt�rym przyjmuje dany lekarz. Za�o�ono, �e pacjent nie pami�ta nazwiska i imienia lekarza, 
--wi�c piel�gniarka wyszukuje potrzebne dane za pomoc� numeru PESEL pacjenta oraz dnia wizyty.
--Nale�y poda� numer gabinetu lekarza, do kt�rego na wizyt� udaje si� pacjent X.

--Zapytanie oryginalne 'podaj nr gabinet�w wszystkich wci�� pracuj�cych lekarzy' zosta�o lekko zmodyfikowane, aby lepiej odnosi�o si� do za�o�e� bazy oraz
--by�o sensowne pod wzgl�dem biznesowym.

SELECT Lekarze.Nr_gabinetu, Osoba.Imie AS Imie_lekarza, Osoba.Nazwisko AS Nazwisko_Lekarza, Wizyta.Data_godzina
FROM Lekarze
	INNER JOIN Wizyta ON Wizyta.Lekarz_ID=Lekarze.Lekarz_ID
	INNER JOIN Osoba ON Osoba.Osoba_ID=Lekarze.Lekarz_ID
WHERE Wizyta.Wizyta_ID IN (SELECT * FROM Widok);

--SELECT pozwalaj�cy sprawdzi� poprawno�� zapytania
SELECT Osoba.Imie AS Imie_lekarza, Osoba.Nazwisko AS Nazwisko_lekarza, Wizyta.Data_godzina AS Wizyta, Lekarze.Nr_gabinetu
FROM Osoba
	INNER JOIN Lekarze ON Lekarze.Osoba_ID=Osoba.Osoba_ID
	INNER JOIN Wizyta ON Wizyta.Lekarz_ID=Lekarze.Lekarz_ID
	INNER JOIN Pacjenci ON Pacjenci.PESEL=Wizyta.PESEL
WHERE Pacjenci.PESEL='81070527210';


