--Zapytanie 5
--Pewna osoba jest przewlekle chora i co miesi�c potrzebuje recepty na te same leki. W tej sytuacji piel�gniarka potrzebuje znale�� leki, kt�re by�y ju� wczesniej przepisywane
--pacjentowi, aby m�c przygotowa� recept� gotow� tylko do podpisu przez lekarza. Nale�y poda� list� wszystkich dotychczas przepisanych lek�w. Powinna by� widoczna nazwa leku
--oraz jego opis, gdy� piel�gniarka mo�e b�dzie chcia�a dopyta� na podstawie opisu, czy to na pewno o ten lek chodzi.Nazwy lek�w nie powinny si� powtarza�.

--Jako �e do zapytania 'podaj wszystkieg wycofane leki wypisane na receptach' nie jest jasna sytuacja, w kt�rej takowe zapytanie by�oby wykorzystane, 
--zast�piono je powy�szym.

SELECT Leki.Nazwa, MAX(Leki.Opis) AS Opis
FROM Leki
	INNER JOIN Leki_na_recepcie ON Leki_na_recepcie.Lek_ID=Leki.Lek_ID
	INNER JOIN Recepta ON Leki_na_recepcie.Recepta_ID=Recepta.Recepta_ID
	INNER JOIN Wizyta ON Recepta.Wizyta_ID=Wizyta.Wizyta_ID
	INNER JOIN Lekarze ON Wizyta.Lekarz_ID=Lekarze.Lekarz_ID
	INNER JOIN Pacjenci ON Wizyta.PESEL=Pacjenci.PESEL
WHERE Pacjenci.PESEL='81070527219'
GROUP BY Leki.Nazwa;

--SELECT sprawdzaj�cy czy zapytanie jest poprawne
SELECT Leki.Nazwa, Leki.Opis, Recepta.Data_wystawienia, Osoba.Imie AS Imie_Lekarza, Osoba.Nazwisko AS Nazwisko_lekarza 
FROM Leki
	INNER JOIN Leki_na_recepcie ON Leki_na_recepcie.Lek_ID=Leki.Lek_ID
	INNER JOIN Recepta ON Leki_na_recepcie.Recepta_ID=Recepta.Recepta_ID
	INNER JOIN Wizyta ON Recepta.Wizyta_ID=Wizyta.Wizyta_ID
	INNER JOIN Lekarze ON Wizyta.Lekarz_ID=Lekarze.Lekarz_ID
	INNER JOIN Pacjenci ON Wizyta.PESEL=Pacjenci.PESEL
	INNER JOIN Osoba ON Osoba.Osoba_ID=Lekarze.Osoba_ID
WHERE Pacjenci.PESEL='81070527219';