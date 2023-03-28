DROP DATABASE IF EXISTS COMPAGNIE_AERIENNE;
CREATE DATABASE COMPAGNIE_AERIENNE DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE COMPAGNIE_AERIENNE;

SET foreign_key_checks = 0;
drop table if exists CIA, VOL, AEROPORT, AVION, SIEGE, CLASSE, CLIENT, PRIX_VOL, RES_CLIENT;
SET foreign_key_checks = 1;

CREATE TABLE Compagnie (
    ID_compagnie INT AUTO_INCREMENT PRIMARY KEY,
    nom_compagnie VARCHAR(255) NOT NULL
);

CREATE TABLE Aeroport (
    ID_aeroport INT AUTO_INCREMENT PRIMARY KEY,
    nom_aeroport VARCHAR(255) NOT NULL UNIQUE,
    ville VARCHAR(255) NOT NULL,
    pays VARCHAR(255) NOT NULL
);

CREATE TABLE Vol (
    ID_vol INT AUTO_INCREMENT PRIMARY KEY,
    numero_vol INT NOT NULL,
    ID_compagnie INT,
    date_heure_depart DATETIME NOT NULL,
    ID_aeroport_depart INT,
    terminal_depart VARCHAR(255) NOT NULL,
    ID_aeroport_arrivee INT,
    terminal_arrivee VARCHAR(255) NOT NULL,
    date_heure_arrivee DATETIME NOT NULL,
    FOREIGN KEY (ID_compagnie) REFERENCES Compagnie (ID_compagnie),
    FOREIGN KEY (ID_aeroport_depart) REFERENCES Aeroport (ID_aeroport),
    FOREIGN KEY (ID_aeroport_arrivee) REFERENCES Aeroport (ID_aeroport)
);
    



