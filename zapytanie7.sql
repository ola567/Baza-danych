--Zapytanie7
--Prowadzone s� badania statystyczne dotycz�ce stanu zdrowia mieszka�c�w. Nale�y poda� chorob�, na kt�r� najcz�ciej zapadaj�
--mieszka�cy miasta, kt�rzy urodzili si� wcze�niej ni� 2000 rok. 

--Zapytanie oryginalne 'Podaj wszystkie recepty wystawione w X o dacie wa�no�ci Y' zosta�o zast�pione powy�szym, kt�re lepiej realizuje za�o�enia biznesowe.

SELECT TOP 1 COUNT(Choroby.Nazwa), Choroby.Nazwa
FROM Choroby
	INNER JOIN Diagnozy ON Diagnozy.Choroba_ID=Choroby.Choroba_ID
	INNER JOIN Wizyta ON Wizyta.Wizyta_ID=Diagnozy.Wizyta_ID
	INNER JOIN Pacjenci ON Pacjenci.PESEL=Wizyta.PESEL
WHERE Pacjenci.Data_urodzenia < '2000-01-01'
GROUP BY Choroby.Nazwa
ORDER BY 1 DESC;

--SELECT pozwalaj�cy sprawdzi�, czy zapytanie jest prawid�owe
SELECT Choroby.Nazwa, Pacjenci.Data_urodzenia, Osoba.Imie AS Imie_pacjenta, Osoba.Nazwisko AS Nazwisko_pacjenta
FROM Choroby
	INNER JOIN Diagnozy ON Diagnozy.Choroba_ID=Choroby.Choroba_ID
	INNER JOIN Wizyta ON Wizyta.Wizyta_ID=Diagnozy.Wizyta_ID
	INNER JOIN Pacjenci ON Pacjenci.PESEL=Wizyta.PESEL
	INNER JOIN Osoba ON Osoba.Osoba_ID=Pacjenci.Osoba_ID
ORDER BY Pacjenci.Data_urodzenia;

