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


INSERT INTO Camere(IdTip, numar, balcon, baie) VALUES 
(1, 301, 1, 1),
(1, 302, 0, 1),
(2, 401, 1, 1),
(2, 402, 0, 1),
(1, 303, 1, 1),
(2, 403, 1, 1),
(1, 304, 0, 1),
(2, 404, 1, 1),
(1, 105, 0, 1),
( 2, 205, 1, 1);

INSERT INTO Clienti(nume, prenume, telefon) VALUES 
('Smith', 'John', '123-456-7890'),
('Doe', 'Jane', '234-567-8901'),
('Johnson', 'Emily', '345-678-9012'),
('Williams', 'Michael', '456-789-0123'),
('Brown', 'Chris', '567-890-1234'),
('Jones', 'Sarah', '678-901-2345'),
('Garcia', 'David', '789-012-3456'),
('Martinez', 'Laura', '890-123-4567'),
('Davis', 'James', '901-234-5678'),
( 'Rodriguez', 'Linda', '012-345-6789');

declare @cId int;
-- John Smith
select @cid=id from Clienti where nume='Smith' and prenume='John';
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 1, '2024-12-01', '2024-12-05');
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 3, '2024-12-10', '2024-12-15');
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 5, '2025-01-05', '2025-01-10');

-- Jane Doe
select @cid=id from Clienti where nume='Doe' and prenume='Jane';
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 13, '2024-12-02', '2024-12-06');
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 14, '2025-02-12', '2025-02-22');

-- Emily Johnson
select @cid=id from Clienti where nume='Johnson' and prenume='Emily';
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 4, '2024-12-03', '2024-12-07');
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 15, '2024-12-08', '2024-12-12');
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 5, '2025-01-15', '2025-01-20');

-- Michael Williams
select @cid=id from Clienti where nume='Williams' and prenume='Michael';
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 5, '2024-12-04', '2024-12-09');
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 7, '2025-02-01', '2025-02-05');

-- Chris Brown
select @cid=id from Clienti where nume='Brown' and prenume='Chris';
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 7, '2024-12-05', '2024-12-10');
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 13, '2024-12-18', '2024-12-27');
-- Sarah Jones
select @cid=id from Clienti where nume='Jones' and prenume='Sarah';
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 8, '2024-12-06', '2024-12-11');
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 8, '2024-12-06', '2024-12-11');
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 9, '2025-03-01', '2025-03-05');
-- David Garcia
select @cid=id from Clienti where nume='Garcia' and prenume='David';
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 9, '2024-12-07', '2024-12-12');
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 5, '2025-03-01', '2025-03-12');
-- Laura Martinez
select @cid=id from Clienti where nume='Martinez' and prenume='Laura';
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 10, '2024-12-08', '2024-12-13');
INSERT INTO Rezervari (IdClient, IdCamera, checkin, checkout) VALUES (@cid, 1, '2025-04-01', '2025-04-05');