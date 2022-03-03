--Zapytanie 6
--Do lekarza przychodzi pacjent X. Lekarz chce uzyskaæ informacjê o stanie zdrowia pacjenta. Podaj listê chorób oraz pe³n¹ informacjê o nich. Choroby powinny siê wyœwietlaæ od 
--najpóŸniej zdiagnozowanej, do najwczesniej zdiagnozowanej.

SELECT Diagnozy.Stadium_choroby, Diagnozy.Rokowania, Choroby.Nazwa, Choroby.Przebieg, Wizyta.Data_godzina
FROM Diagnozy
	INNER JOIN Wizyta ON Wizyta.Wizyta_ID=Diagnozy.Wizyta_ID
	INNER JOIN Choroby ON Choroby.Choroba_ID=Diagnozy.Choroba_ID
	INNER JOIN Pacjenci ON Pacjenci.PESEL=Wizyta.PESEL
WHERE Pacjenci.PESEL='71030818920'
ORDER BY Wizyta.Data_godzina DESC;