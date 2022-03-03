--Zapytanie 3
--Lekarz chce uzyska� list� pacjent�w um�wionych u niego w danym dniu na wizyt�, aby przygotowa� si� na ich przyj�cie.
--Wizyty maj� by� uszeregowane w spos�b chronologiczny.

SELECT Osoba.Imie AS Imie_pacjenta, Osoba.Nazwisko AS Nazwisko_pacjenta, Wizyta.Data_godzina
FROM Wizyta
	INNER JOIN Pacjenci ON Pacjenci.PESEL=Wizyta.PESEL
	INNER JOIN Osoba ON Osoba.Osoba_ID=Pacjenci.Osoba_ID
	INNER JOIN Lekarze ON Lekarze.Lekarz_ID=Wizyta.Lekarz_ID
WHERE Lekarze.Lekarz_ID=1 AND CAST(Wizyta.Data_godzina as date)='2022-01-12'
ORDER BY Wizyta.Data_godzina;

--SELECT s�u��cy do sprawdzenia, czy zapytanie jest poprawne
SELECT Osoba.Imie AS Imie_pacjenta, Osoba.Nazwisko AS Nazwisko_pacjenta, Wizyta.Data_godzina
FROM Wizyta
	INNER JOIN Pacjenci ON Pacjenci.PESEL=Wizyta.PESEL
	INNER JOIN Osoba ON Osoba.Osoba_ID=Pacjenci.Osoba_ID
	INNER JOIN Lekarze ON Lekarze.Lekarz_ID=Wizyta.Lekarz_ID
WHERE Lekarze.Lekarz_ID=1
ORDER BY Wizyta.Data_godzina;