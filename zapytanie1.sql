--Zapytanie 1
--Lekarz dosta� informacj�, �e pewnien lek zosta� wycofany z obrotu. Wydaje mu si�, �e przepisa� ten lek jednemu pacjentowi.
--W zwi�zku z powy�szym chce sprawdzi�, czy na ostatnio wypisanej recepcie dla pacjenta nie znajduje si� jakikolwiek wycofany lek.
--Gdyby taka sytuacja zaistnia�a, lekarz poinformowa�by pacjenta o tym i wystawi� now� recept� z w�a�ciwymi lekami.

SELECT Leki.Czy_wycofany, Leki.Nazwa, Osoba.Imie AS Imie_pacjenta, Osoba.Nazwisko AS Nazwisko_pacjenta, Osoba.Nr_tel, Recepta.Data_wystawienia
FROM Leki
	INNER JOIN Leki_na_recepcie ON Leki_na_recepcie.Lek_ID=Leki.Lek_ID
	INNER JOIN Recepta ON Leki_na_recepcie.Recepta_ID=Recepta.Recepta_ID
	INNER JOIN Wizyta ON Recepta.Wizyta_ID=Wizyta.Wizyta_ID
	INNER JOIN Lekarze ON Wizyta.Lekarz_ID=Lekarze.Lekarz_ID
	INNER JOIN Pacjenci ON Wizyta.PESEL=Pacjenci.PESEL
	INNER JOIN Osoba ON Osoba.Osoba_ID=Pacjenci.Osoba_ID
WHERE Recepta.Recepta_ID IN 
		(SELECT TOP 1 Recepta.Recepta_ID 
		 FROM Recepta
			INNER JOIN Wizyta ON Recepta.Wizyta_ID=Wizyta.Wizyta_ID
			INNER JOIN Lekarze ON Wizyta.Lekarz_ID=Lekarze.Lekarz_ID
			INNER JOIN Pacjenci ON Wizyta.PESEL=Pacjenci.PESEL
			INNER JOIN Osoba ON Osoba.Osoba_ID=Pacjenci.Osoba_ID
		WHERE Osoba.Imie='Maciej' AND Osoba.Nazwisko='R�a'
		ORDER BY Recepta.Recepta_ID DESC);

--SELECT do sprawdzenia, czy zapytanie dzia�a prawid�owo
SELECT Leki.Czy_wycofany, Leki.Nazwa, Osoba.Imie AS Imie_pacjenta, Osoba.Nazwisko AS Nazwisko_pacjenta, Osoba.Nr_tel, Recepta.Data_wystawienia, Recepta.Recepta_ID
FROM Leki
	INNER JOIN Leki_na_recepcie ON Leki_na_recepcie.Lek_ID=Leki.Lek_ID
	INNER JOIN Recepta ON Recepta.Recepta_ID=Leki_na_recepcie.Recepta_ID
	INNER JOIN Wizyta ON Wizyta.Wizyta_ID=Recepta.Wizyta_ID
	INNER JOIN Pacjenci ON Pacjenci.PESEL=Wizyta.PESEL
	INNER JOIN Osoba ON Osoba.Osoba_ID=Pacjenci.Osoba_ID
WHERE Osoba.Imie='Maciej' AND Osoba.Nazwisko='R�a'
ORDER BY Recepta.Recepta_ID DESC;

