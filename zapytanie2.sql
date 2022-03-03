--Zapytanie 2
--Lekarz przychodni zdrowia potrzebuje uzyskaæ liczbê ¿ywych pacjentów z chorob¹ uk³adu kr¹¿eniowego na rzecz badañ dotycz¹cych 
--liczby ludzi choruj¹cych na t¹ przypad³oœæ prowadzonych przez NFZ.

SELECT COUNT(Nazwa)
FROM Choroby
	INNER JOIN Diagnozy ON Diagnozy.Choroba_ID=Choroby.Choroba_ID
	INNER JOIN Wizyta ON Wizyta.Wizyta_ID=Diagnozy.Wizyta_ID
	INNER JOIN Pacjenci ON Wizyta.PESEL=Pacjenci.PESEL
WHERE (Nazwa='Choroba wieñcowa serca' OR Nazwa='Mia¿d¿yca' OR Nazwa='Nadciœnienie têtnicze' OR Nazwa='Zaburzenia lipidowe'
	  OR Nazwa='Choroba niedokrwienna serca' OR Nazwa='Niewydolnoœæ serca' OR Nazwa='Wady zastawkowe serca' OR Nazwa='Niewydolnoœæ ¿y³'
	  OR Nazwa='Migotanie przedsionków') AND Pacjenci.Czy_umarl=0;

--SELECT do tego, aby zobaczyæ, czy zapytanie dzia³a prawid³owo
SELECT * FROM Choroby;
SELECT Pacjenci.Czy_umarl, Choroby.Nazwa, Osoba.Imie, Osoba.Nazwisko
FROM Pacjenci
	INNER JOIN Osoba ON Osoba.Osoba_ID=Pacjenci.Osoba_ID
	INNER JOIN Wizyta ON Wizyta.PESEL=Pacjenci.PESEL
	INNER JOIN Diagnozy ON Diagnozy.Wizyta_ID=Wizyta.Wizyta_ID
	INNER JOIN Choroby ON Choroby.Choroba_ID=Diagnozy.Choroba_ID;