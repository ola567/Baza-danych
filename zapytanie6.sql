--Zapytanie 6
--Do lekarza przychodzi pacjent X. Lekarz chce uzyska� informacj� o stanie zdrowia pacjenta. Podaj list� chor�b oraz pe�n� informacj� o nich. Choroby powinny si� wy�wietla� od 
--najp�niej zdiagnozowanej, do najwczesniej zdiagnozowanej.

SELECT Diagnozy.Stadium_choroby, Diagnozy.Rokowania, Choroby.Nazwa, Choroby.Przebieg, Wizyta.Data_godzina
FROM Diagnozy
	INNER JOIN Wizyta ON Wizyta.Wizyta_ID=Diagnozy.Wizyta_ID
	INNER JOIN Choroby ON Choroby.Choroba_ID=Diagnozy.Choroba_ID
	INNER JOIN Pacjenci ON Pacjenci.PESEL=Wizyta.PESEL
WHERE Pacjenci.PESEL='71030818920'
ORDER BY Wizyta.Data_godzina DESC;