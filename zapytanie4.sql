--Zapytanie 4
--Nowy pacjent nie wie, do którego gabinetu ma siê udaæ na wizytê. W zwi¹zku z tym pyta siê o to pani¹ w recepcji, która akurat zapomnia³a przypisany do tego lekarza gabinet.
--Istnieje zatem potrzeba sprawdzenia numeru gabinetu w którym przyjmuje dany lekarz. Za³o¿ono, ¿e pacjent nie pamiêta nazwiska i imienia lekarza, 
--wiêc pielêgniarka wyszukuje potrzebne dane za pomoc¹ numeru PESEL pacjenta oraz dnia wizyty.
--Nale¿y podaæ numer gabinetu lekarza, do którego na wizytê udaje siê pacjent X.

--Zapytanie oryginalne 'podaj nr gabinetów wszystkich wci¹¿ pracuj¹cych lekarzy' zosta³o lekko zmodyfikowane, aby lepiej odnosi³o siê do za³o¿eñ bazy oraz
--by³o sensowne pod wzglêdem biznesowym.

SELECT Lekarze.Nr_gabinetu, Osoba.Imie AS Imie_lekarza, Osoba.Nazwisko AS Nazwisko_Lekarza, Wizyta.Data_godzina
FROM Lekarze
	INNER JOIN Wizyta ON Wizyta.Lekarz_ID=Lekarze.Lekarz_ID
	INNER JOIN Osoba ON Osoba.Osoba_ID=Lekarze.Lekarz_ID
WHERE Wizyta.Wizyta_ID IN (SELECT * FROM Widok);

--SELECT pozwalaj¹cy sprawdziæ poprawnoœæ zapytania
SELECT Osoba.Imie AS Imie_lekarza, Osoba.Nazwisko AS Nazwisko_lekarza, Wizyta.Data_godzina AS Wizyta, Lekarze.Nr_gabinetu
FROM Osoba
	INNER JOIN Lekarze ON Lekarze.Osoba_ID=Osoba.Osoba_ID
	INNER JOIN Wizyta ON Wizyta.Lekarz_ID=Lekarze.Lekarz_ID
	INNER JOIN Pacjenci ON Pacjenci.PESEL=Wizyta.PESEL
WHERE Pacjenci.PESEL='81070527210';


