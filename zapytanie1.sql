--Zapytanie 1
--Lekarz dosta³ informacjê, ¿e pewnien lek zosta³ wycofany z obrotu. Wydaje mu siê, ¿e przepisa³ ten lek jednemu pacjentowi.
--W zwi¹zku z powy¿szym chce sprawdziæ, czy na ostatnio wypisanej recepcie dla pacjenta nie znajduje siê jakikolwiek wycofany lek.
--Gdyby taka sytuacja zaistnia³a, lekarz poinformowa³by pacjenta o tym i wystawi³ now¹ receptê z w³aœciwymi lekami.

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
		WHERE Osoba.Imie='Maciej' AND Osoba.Nazwisko='Ró¿a'
		ORDER BY Recepta.Recepta_ID DESC);

--SELECT do sprawdzenia, czy zapytanie dzia³a prawid³owo
SELECT Leki.Czy_wycofany, Leki.Nazwa, Osoba.Imie AS Imie_pacjenta, Osoba.Nazwisko AS Nazwisko_pacjenta, Osoba.Nr_tel, Recepta.Data_wystawienia, Recepta.Recepta_ID
FROM Leki
	INNER JOIN Leki_na_recepcie ON Leki_na_recepcie.Lek_ID=Leki.Lek_ID
	INNER JOIN Recepta ON Recepta.Recepta_ID=Leki_na_recepcie.Recepta_ID
	INNER JOIN Wizyta ON Wizyta.Wizyta_ID=Recepta.Wizyta_ID
	INNER JOIN Pacjenci ON Pacjenci.PESEL=Wizyta.PESEL
	INNER JOIN Osoba ON Osoba.Osoba_ID=Pacjenci.Osoba_ID
WHERE Osoba.Imie='Maciej' AND Osoba.Nazwisko='Ró¿a'
ORDER BY Recepta.Recepta_ID DESC;

