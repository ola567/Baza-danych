CREATE VIEW Widok AS
SELECT Wizyta_ID 
FROM Wizyta
	INNER JOIN Pacjenci ON Pacjenci.PESEL=Wizyta.PESEL
	INNER JOIN Lekarze ON Lekarze.Lekarz_ID=Wizyta.Wizyta_ID
WHERE Pacjenci.PESEL='81070527210' AND Wizyta.Data_godzina='2022.01.12 10:00:00';
