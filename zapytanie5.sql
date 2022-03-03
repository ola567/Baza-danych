--Zapytanie 5
--Pewna osoba jest przewlekle chora i co miesi¹c potrzebuje recepty na te same leki. W tej sytuacji pielêgniarka potrzebuje znaleŸæ leki, które by³y ju¿ wczesniej przepisywane
--pacjentowi, aby móc przygotowaæ receptê gotow¹ tylko do podpisu przez lekarza. Nale¿y podaæ listê wszystkich dotychczas przepisanych leków. Powinna byæ widoczna nazwa leku
--oraz jego opis, gdy¿ pielêgniarka mo¿e bêdzie chcia³a dopytaæ na podstawie opisu, czy to na pewno o ten lek chodzi.Nazwy leków nie powinny siê powtarzaæ.

--Jako ¿e do zapytania 'podaj wszystkieg wycofane leki wypisane na receptach' nie jest jasna sytuacja, w której takowe zapytanie by³oby wykorzystane, 
--zast¹piono je powy¿szym.

SELECT Leki.Nazwa, MAX(Leki.Opis) AS Opis
FROM Leki
	INNER JOIN Leki_na_recepcie ON Leki_na_recepcie.Lek_ID=Leki.Lek_ID
	INNER JOIN Recepta ON Leki_na_recepcie.Recepta_ID=Recepta.Recepta_ID
	INNER JOIN Wizyta ON Recepta.Wizyta_ID=Wizyta.Wizyta_ID
	INNER JOIN Lekarze ON Wizyta.Lekarz_ID=Lekarze.Lekarz_ID
	INNER JOIN Pacjenci ON Wizyta.PESEL=Pacjenci.PESEL
WHERE Pacjenci.PESEL='81070527219'
GROUP BY Leki.Nazwa;

--SELECT sprawdzaj¹cy czy zapytanie jest poprawne
SELECT Leki.Nazwa, Leki.Opis, Recepta.Data_wystawienia, Osoba.Imie AS Imie_Lekarza, Osoba.Nazwisko AS Nazwisko_lekarza 
FROM Leki
	INNER JOIN Leki_na_recepcie ON Leki_na_recepcie.Lek_ID=Leki.Lek_ID
	INNER JOIN Recepta ON Leki_na_recepcie.Recepta_ID=Recepta.Recepta_ID
	INNER JOIN Wizyta ON Recepta.Wizyta_ID=Wizyta.Wizyta_ID
	INNER JOIN Lekarze ON Wizyta.Lekarz_ID=Lekarze.Lekarz_ID
	INNER JOIN Pacjenci ON Wizyta.PESEL=Pacjenci.PESEL
	INNER JOIN Osoba ON Osoba.Osoba_ID=Lekarze.Osoba_ID
WHERE Pacjenci.PESEL='81070527219';