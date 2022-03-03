--Zapytanie7
--Prowadzone s¹ badania statystyczne dotycz¹ce stanu zdrowia mieszkañców. Nale¿y podaæ chorobê, na któr¹ najczêœciej zapadaj¹
--mieszkañcy miasta, którzy urodzili siê wczeœniej ni¿ 2000 rok. 

--Zapytanie oryginalne 'Podaj wszystkie recepty wystawione w X o dacie wa¿noœci Y' zosta³o zast¹pione powy¿szym, które lepiej realizuje za³o¿enia biznesowe.

SELECT TOP 1 COUNT(Choroby.Nazwa), Choroby.Nazwa
FROM Choroby
	INNER JOIN Diagnozy ON Diagnozy.Choroba_ID=Choroby.Choroba_ID
	INNER JOIN Wizyta ON Wizyta.Wizyta_ID=Diagnozy.Wizyta_ID
	INNER JOIN Pacjenci ON Pacjenci.PESEL=Wizyta.PESEL
WHERE Pacjenci.Data_urodzenia < '2000-01-01'
GROUP BY Choroby.Nazwa
ORDER BY 1 DESC;

--SELECT pozwalaj¹cy sprawdziæ, czy zapytanie jest prawid³owe
SELECT Choroby.Nazwa, Pacjenci.Data_urodzenia, Osoba.Imie AS Imie_pacjenta, Osoba.Nazwisko AS Nazwisko_pacjenta
FROM Choroby
	INNER JOIN Diagnozy ON Diagnozy.Choroba_ID=Choroby.Choroba_ID
	INNER JOIN Wizyta ON Wizyta.Wizyta_ID=Diagnozy.Wizyta_ID
	INNER JOIN Pacjenci ON Pacjenci.PESEL=Wizyta.PESEL
	INNER JOIN Osoba ON Osoba.Osoba_ID=Pacjenci.Osoba_ID
ORDER BY Pacjenci.Data_urodzenia;

