--Zapytanie 2
--Lekarz przychodni zdrowia potrzebuje uzyska� liczb� �ywych pacjent�w z chorob� uk�adu kr��eniowego na rzecz bada� dotycz�cych 
--liczby ludzi choruj�cych na t� przypad�o�� prowadzonych przez NFZ.

SELECT COUNT(Nazwa)
FROM Choroby
	INNER JOIN Diagnozy ON Diagnozy.Choroba_ID=Choroby.Choroba_ID
	INNER JOIN Wizyta ON Wizyta.Wizyta_ID=Diagnozy.Wizyta_ID
	INNER JOIN Pacjenci ON Wizyta.PESEL=Pacjenci.PESEL
WHERE (Nazwa='Choroba wie�cowa serca' OR Nazwa='Mia�d�yca' OR Nazwa='Nadci�nienie t�tnicze' OR Nazwa='Zaburzenia lipidowe'
	  OR Nazwa='Choroba niedokrwienna serca' OR Nazwa='Niewydolno�� serca' OR Nazwa='Wady zastawkowe serca' OR Nazwa='Niewydolno�� �y�'
	  OR Nazwa='Migotanie przedsionk�w') AND Pacjenci.Czy_umarl=0;

--SELECT do tego, aby zobaczy�, czy zapytanie dzia�a prawid�owo
SELECT * FROM Choroby;
SELECT Pacjenci.Czy_umarl, Choroby.Nazwa, Osoba.Imie, Osoba.Nazwisko
FROM Pacjenci
	INNER JOIN Osoba ON Osoba.Osoba_ID=Pacjenci.Osoba_ID
	INNER JOIN Wizyta ON Wizyta.PESEL=Pacjenci.PESEL
	INNER JOIN Diagnozy ON Diagnozy.Wizyta_ID=Wizyta.Wizyta_ID
	INNER JOIN Choroby ON Choroby.Choroba_ID=Diagnozy.Choroba_ID;