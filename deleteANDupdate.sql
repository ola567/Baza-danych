DELETE FROM Wizyta WHERE Wizyta_ID < 5;

--PESEL jest przypisany na sta³e do danej osoby i nie powinno siê go zmieniaæ. Jednak aby dobrze zobrazowaæ kaskadow¹ aktualizacjê
--zastosowano j¹ w³aœnie na tym przyk³adzie.
UPDATE Pacjenci SET PESEL='11111111111' WHERE PESEL='01222301008';
DELETE FROM Pacjenci WHERE PESEL='11111111111';
