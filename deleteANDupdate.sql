DELETE FROM Wizyta WHERE Wizyta_ID < 5;

--PESEL jest przypisany na sta�e do danej osoby i nie powinno si� go zmienia�. Jednak aby dobrze zobrazowa� kaskadow� aktualizacj�
--zastosowano j� w�a�nie na tym przyk�adzie.
UPDATE Pacjenci SET PESEL='11111111111' WHERE PESEL='01222301008';
DELETE FROM Pacjenci WHERE PESEL='11111111111';
