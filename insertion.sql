-- Insertion des données dans la table CIA
INSERT INTO CIA (codeCia, nomCia, chiffreAff, magFid)
VALUES ('AF', 'Air France', '30000000', 'Flying Blue'),
       ('LH', 'Lufthansa', '35000000', 'Miles & More'),
       ('BA', 'British Airways', '32000000', 'Executive Club'),
       ('DL', 'Delta Airlines', '40000000', 'SkyMiles'),
       ('AA', 'American Airlines', '38000000', 'AAdvantage');

-- Insertion des données dans la table AEROPORT
INSERT INTO AEROPORT (aeroportNom, ville, pays)
VALUES ('CDG', 'Paris', 'FR'),
       ('FRA', 'Frankfurt', 'ALL'),
       ('LHR', 'Londres', 'GB'),
       ('JFK', 'New York', 'US'),
       ('GIG', 'Rio', 'BR'),
       ('LAX', 'Los Angeles', 'US');

-- Insertion des données dans la table AVION
INSERT INTO AVION (immAvion, modeleAvion, constAvion, etatAvion, nbPlaces, codeCia)
VALUES ('F-GOMA', 'Airbus A380', 'Airbus', 'OK', '853', 'AF'),
       ('D-AIMH', 'Airbus A380', 'Airbus', 'OK', '853', 'LH'),
       ('G-XLEF', 'Airbus A380', 'Airbus', 'OK', '853', 'BA'),
       ('N668US', 'Boeing 747-400', 'Boeing', 'OK', '660', 'DL'),
       ('N77006', 'Boeing 777-200', 'Boeing', 'OK', '273', 'AA');

-- Insertion des données dans la table SIEGE
INSERT INTO SIEGE (immAvion, numSiege, categorie, etatSiege)
VALUES ('F-GOMA', '1A', 'C1', 'OK'),
       ('F-GOMA', '1B', 'C1', 'OK'),
       ('F-GOMA', '2A', 'C2', 'OK'),
       ('F-GOMA', '2B', 'C2', 'OK'),
       ('F-GOMA', '3A', 'C3', 'OK'),
       ('D-AIMH', '1A', 'C1', 'OK'),
       ('D-AIMH', '1B', 'C1', 'OK'),
       ('D-AIMH', '2A', 'C2', 'OK'),
       ('D-AIMH', '2B', 'C2', 'OK'),
       ('D-AIMH', '3A', 'C3', 'OK');

-- Insertion des données dans la table CLASSE
INSERT INTO CLASSE (immAvion, categorie, classe)
VALUES ('F-GOMA', 'C1', 'First'),
       ('F-GOMA', 'C2', 'Business'),
       ('F-GOMA', 'C3', 'Economy'),
       ('D-AIMH', 'C1', 'First'),
       ('D-AIMH', 'C2', 'Business'),
       ('D-AIMH', 'C3', 'Economy');

-- Insertion des données dans la table CLIENT
INSERT INTO CLIENT (idCl, nomCl, prenomCl, sexeCl, ddnCl, adresseCli, telCli, emailCli)
VALUES (1, 'DUPONT', 'Pierre', 'M', '1980-05-12', '10 rue des Fleurs, 75001 Paris', '0612345678', 'pierre.dupont@email.com'),
       (2, 'MARTIN', 'Sophie', 'F', '1990-08-30', '5 avenue des Champs, 69001 Lyon', '0698765432', 'sophie.martin@email.com'),
       (3, 'SMITH', 'John', 'M', '1985-10-18', '123 Main St, London', '+447912345678', 'john.smith@email.com'),
       (4, 'MEYER', 'Michael', 'M', '1972-12-01', '22 Bahnhofstrasse, 8001 Zurich', '+417912345678', 'michael.meyer@email.com'),
       (5, 'GARCIA', 'Maria', 'F', '1988-03-15', 'Calle Gran Via 20, 28001 Madrid', '+346112345678', 'maria.garcia@email.com');

-- Insertion des données dans la table VOL
INSERT INTO VOL (codeCia, numVol, dateDep, aeroportDep, termDep, aeroportArr, termArr, dateArr, immAvion)
VALUES ('AF', '0442', '2023-07-10 23:30:00', 'CDG', '2E', 'GIG', '1', '2023-07-11 05:30:00', 'F-GOMA'),
       ('LH', '1234', '2023-07-10 08:30:00', 'FRA', '1A', 'JFK', '4', '2023-07-10 11:30:00', 'D-AIMH'),
       ('BA', '5678', '2023-07-10 15:30:00', 'LHR', '5C', 'LAX', '6', '2023-07-10 18:30:00', 'G-XLEF'),
       ('DL', '9012', '2023-07-10 10:00:00', 'JFK', '4', 'FRA', '1A', '2023-07-10 13:00:00', 'N668US'),
       ('AA', '3456', '2023-07-10 12:30:00', 'LAX', '6', 'LHR', '5C', '2023-07-10 15:30:00', 'N77006');

-- Insertion des données dans la table PRIX_VOL
INSERT INTO PRIX_VOL (codeCia, numVol, dateDep, categorie, prix)
VALUES ('LH', '1234', '2023-07-10 08:30:00', 'C1', 2600),
       ('LH', '1234', '2023-07-10 08:30:00', 'C2', 1600),
       ('LH', '1234', '2023-07-10 08:30:00', 'C3', 900),
       ('BA', '5678', '2023-07-10 15:30:00', 'C1', 2700),
       ('BA', '5678', '2023-07-10 15:30:00', 'C2', 1700),
       ('BA', '5678', '2023-07-10 15:30:00', 'C3', 1000),
       ('DL', '9012', '2023-07-10 10:00:00', 'C1', 2800),
       ('DL', '9012', '2023-07-10 10:00:00', 'C2', 1800),
       ('DL', '9012', '2023-07-10 10:00:00', 'C3', 1100),
       ('AA', '3456', '2023-07-10 12:30:00', 'C1', 2900),
       ('AA', '3456', '2023-07-10 12:30:00', 'C2', 1900),
       ('AA', '3456', '2023-07-10 12:30:00', 'C3', 1200);


-- Insertion des données dans la table RES_CLIENT
INSERT INTO RES_CLIENT (codeCia, numVol, dateDep, idCl, codeRes, numSiege, repas)
VALUES ('AF', '0442', '2023-07-10 23:30:00', 1, '8RNZTS', '1A', 'normal'),
       ('AF', '0442', '2023-07-10 23:30:00', 2, '8RNZTS', '1B', 'végétarien'),
       ('LH', '1234', '2023-07-10 08:30:00', 3, '4XJYZA', '2A', 'normal'),
       ('LH', '1234', '2023-07-10 08:30:00', 4, '4XJYZA', '2B', 'végétarien'),
       ('BA', '5678', '2023-07-10 15:30:00', 5, '1QWERT', '3A', 'normal'),
       ('BA', '5678', '2023-07-10 15:30:00', 1, '1QWERT', '3B', 'végétarien'),
       ('DL', '9012', '2023-07-10 10:00:00', 2, '9ZXYPL', '4A', 'normal'),
       ('DL', '9012', '2023-07-10 10:00:00', 4, '9ZXYPL', '4B', 'végétarien'),
       ('AA', '3456', '2023-07-10 12:30:00', 5, '3ASDFG', '5A', 'normal'),
       ('AA', '3456', '2023-07-10 12:30:00', 1, '3ASDFG', '5B', 'végétarien');


