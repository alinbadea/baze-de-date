create database Rezervari
go

use Rezervari
go

CREATE TABLE dbo.TipCamera(
Id int not null primary key identity(1,1),
Denumire varchar(50) NOT NULL
);

CREATE TABLE Camere(
Id int not null primary key IDENTITY(1,1),
IdTip int NOT NULL foreign key references TipCamera(Id),
Numar int NOT NULL,
Balcon bit NOT NULL default 0,
Baie bit NOT NULL default 1);

CREATE TABLE Clienti(
Id int not null primary key identity(1,1),
Nume varchar(50) NOT NULL,
Prenume varchar(50) NOT NULL,
DataNasterii datetime,
Telefon varchar(15) NULL);

CREATE TABLE dbo.Rezervari(
Id int not null primary key identity(1,1),
IdClient int NOT NULL foreign key references Clienti(id),
IdCamera int NOT NULL foreign key references Camere(id),
Checkin datetime NOT NULL,
Checkout datetime NOT NULL,
DataCreare datetime NOT NULL,
);


INSERT dbo.TipCamera (Denumire) 
VALUES  ('Single'),
		('Double'),
		('3 Bed'),
		('4 Bed'),
		('Masaj'),
		('Sauna');

INSERT dbo.Camere (IdTip, Numar, Balcon, Baie) 
VALUES (1, 101, 1, 1),
	   (1, 104, 0, 1),
	   (2, 102, 0, 1),
	   (1, 103, 1, 1),
	   (1, 105, 0, 1),
	   (2, 201, 0, 1),
	   (1, 202, 1, 1),
	   (3, 203, 0, 1),
	   (2, 204, 0, 1);


INSERT dbo.Clienti (Nume, Prenume, Telefon, DataNasterii) 
VALUES ('Badea', 'Ali', '0745489635','1989-10-23'),
	   ('Ionescu', 'Daniel', '0765489658','1990-09-21'),
	   ('Mari', 'Anca', '0744859632','1988-05-14'),
	   ('Ionescu', 'Cristina', NULL,'1995-09-28'),
	   ('Mari', 'Petre', NULL,'1998-07-30'),
	   ('Cristea', 'Andrei', NULL,'1994-03-15'),
	   ('Cristea', 'Maria', NULL,'1989-10-19'),
	   ('Popescu', 'Raluca', NULL,'1988-10-20');


INSERT dbo.Rezervari (IdClient, IdCamera, Checkin, Checkout, DataCreare) 
VALUES (1, 1, '2024-10-25 14:50:00', '2024-10-27 13:00:00', '2024-03-22 11:18:57'),
	   (1, 1, '2024-06-15 15:00:00', '2024-06-25 12:00:00', '2024-03-21 12:44:37'),
	   (1, 1, '2024-08-01 14:00:00', '2024-08-05 13:00:00', '2024-03-23 13:44:37'),
	   (1, 3, '2023-09-05 12:00:00', '2023-09-15 13:00:00', '2024-03-19 14:44:37'),
	   (2, 1, '2024-07-15 15:00:00', '2024-07-25 12:00:00', '2024-03-21 15:44:37'),
	   (2, 5, '2024-06-15 15:00:00', '2024-06-25 12:00:00', '2024-03-18 16:44:37'),
	   (3, 3, '2024-06-15 15:00:00', '2024-06-25 12:00:00', '2024-03-22 17:44:37');
