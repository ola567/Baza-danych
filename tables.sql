CREATE TABLE Adresy(
	Adres_ID INT IDENTITY(1,1) PRIMARY KEY, 
	Kod_pocztowy CHAR(6) DEFAULT '77-100', 
	Miasto VARCHAR(40) DEFAULT 'Bytow', 
	Ulica VARCHAR(40) NOT NULL, 
	Nr_budynku VARCHAR(4) NOT NULL, 
	Nr_lokalu INT,
	CONSTRAINT poprawny_kod CHECK (Kod_pocztowy LIKE '%[0-9][0-9]-[0-9][0-9][0-9]%'),
	CONSTRAINT poprawny_nr_budynku CHECK (Nr_budynku LIKE '%[1-9][Aa-Zz]%' OR Nr_budynku LIKE '%[1-9]%' OR Nr_budynku LIKE '%[1-9][0-9]%' OR Nr_budynku LIKE '%[1-9][0-9][Aa-Zz]%' OR Nr_budynku LIKE '%[1-9][0-9][0-9]%' OR Nr_budynku LIKE '%[1-9][0-9][0-9][Aa-Zz]%'),
	CONSTRAINT poprawny_nr_lokalu CHECK (Nr_lokalu BETWEEN 1 AND 800));

CREATE TABLE Osoba(
	Osoba_ID INT IDENTITY(1,1) PRIMARY KEY, 
	Imie VARCHAR(30) NOT NULL,
	Nazwisko VARCHAR(30) NOT NULL, 
	Nr_tel VARCHAR(11), 
	Email VARCHAR(30),
	CONSTRAINT poprawna_email CHECK (Email LIKE '%@%.%' AND Email NOT LIKE '%..%' AND Email NOT LIKE '%@%@%' AND Email NOT LIKE '%.@%' AND Email NOT LIKE '%@.%'));
--w powy¿szej linijce mamy sprawdzenie nastêpuj¹cch warunków: email ma zawieraæ '@' oraz '.', nie mo¿e zawierac dwóch kropek pod rz¹d, nie mo¿e zawieraæ dwóch '@' pod rz¹d itd. 

CREATE TABLE Pacjenci(
	PESEL CHAR(11) PRIMARY KEY,
	Data_urodzenia DATE NOT NULL,
	Plec CHAR(1) NOT NULL, 
	Adres_ID INT REFERENCES Adresy, 
	Osoba_ID INT REFERENCES Osoba,
	Czy_umarl BIT NOT NULL,
	CONSTRAINT poprawna_plec CHECK (Plec LIKE '%[KkMmUn]%'));

CREATE TABLE Lekarze(
	Lekarz_ID INT IDENTITY(1,1) PRIMARY KEY, 
	Nr_gabinetu INT NOT NULL, 
	Osoba_ID INT REFERENCES Osoba, 
	Czy_wciaz_pracuje BIT NOT NULL,
	CONSTRAINT poprawny_nr_gabinetu CHECK (Nr_gabinetu BETWEEN 0 AND 10));

CREATE TABLE Wizyta(
	Wizyta_ID INT IDENTITY(1,1) PRIMARY KEY, 
	PESEL CHAR(11) REFERENCES Pacjenci ON UPDATE CASCADE ON DELETE CASCADE, 
	Lekarz_ID INT REFERENCES Lekarze, 
	Data_godzina DATETIME NOT NULL, 
	Opis VARCHAR(255), 
	Zwolnienie_od DATE, 
	Zwolnienie_do DATE,
	Czy_sie_odbyla BIT NOT NULL);

CREATE TABLE Choroby(
	Choroba_ID INT IDENTITY(1,1) PRIMARY KEY, 
	Nazwa VARCHAR(100), 
	Przebieg VARCHAR(255));

CREATE TABLE Diagnozy(
	Wizyta_ID INT REFERENCES Wizyta ON DELETE CASCADE,
	Choroba_ID INT REFERENCES Choroby, 
	Stadium_choroby VARCHAR(30), 
	Rokowania VARCHAR(100),
	PRIMARY KEY(Wizyta_ID, Choroba_ID));

CREATE TABLE Recepta(
	Recepta_ID INT IDENTITY(1,1) PRIMARY KEY,
	Data_wystawienia DATE NOT NULL, 
	Data_waznosci DATE NOT NULL, 
	Wizyta_ID INT REFERENCES Wizyta ON DELETE CASCADE);

CREATE TABLE Leki(
	Lek_ID INT IDENTITY(1,1) PRIMARY KEY,
	Opis VARCHAR(255), 
	Nazwa VARCHAR(100) NOT NULL,
	Czy_wycofany BIT NOT NULL);

CREATE TABLE Leki_na_recepcie(
	Lek_ID INT REFERENCES Leki,
	Recepta_ID INT REFERENCES Recepta ON DELETE CASCADE,
	Dawkowanie VARCHAR(100) NOT NULL, 
	Czas_zazywania INT,
	Ilosc_opakowan INT DEFAULT 1,
	PRIMARY KEY(Lek_ID, Recepta_ID),
	CONSTRAINT poprawny_czas_zazywania CHECK(Czas_zazywania BETWEEN 0 AND 31),
	CONSTRAINT poprawna_ilosc CHECK(Ilosc_opakowan BETWEEN 1 AND 10));

CREATE TABLE Rodzaj_skierowania(
	Rodzaj_skierowania_ID INT IDENTITY(1,1) PRIMARY KEY, 
	Opis VARCHAR(255));

CREATE TABLE Wizyta_skierowanie(
	Wizyta_ID INT REFERENCES Wizyta ON DELETE CASCADE, 
	Rodzaj_skierowania_ID INT REFERENCES Rodzaj_skierowania,
	Data_wystawienia DATE NOT NULL, 
	Data_waznosci DATE NOT NULL,
	PRIMARY KEY(Wizyta_ID, Rodzaj_skierowania_ID));

