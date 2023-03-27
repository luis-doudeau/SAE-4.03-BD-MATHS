DROP DATABASE IF EXISTS COMPAGNIE_AERIENNE;
CREATE DATABASE COMPAGNIE_AERIENNE DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE COMPAGNIE_AERIENNE;

SET foreign_key_checks = 0;
drop table if exists CIA, VOL, AEROPORT, AVION, SIEGE, CLASSE, CLIENT, PRIX_VOL, RES_CLIENT;
SET foreign_key_checks = 1;

CREATE TABLE CIA(
  codeCia VARCHAR(10) PRIMARY KEY,
  nomCia VARCHAR(42),
  chiffreAff VARCHAR(42),
  magFid VARCHAR(42)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE AEROPORT(
  aeroportNom VARCHAR(42) PRIMARY KEY,
  ville VARCHAR(42),
  pays VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE AVION(
  immAvion VARCHAR(42) PRIMARY KEY,
  modeleAvion VARCHAR(42),
  constAvion VARCHAR(42),
  etatAvion VARCHAR(10),
  nbPlaces INT,
  codeCia VARCHAR(10),
  FOREIGN KEY (codeCia) REFERENCES CIA(codeCia)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE VOL(
  codeCia VARCHAR(10),
  numVol VARCHAR(42),
  dateDep DATETIME,
  aeroportDep VARCHAR(42),
  termDep VARCHAR(42),
  aeroportArr VARCHAR(42),
  termArr VARCHAR(42),
  dateArr DATETIME,
  immAvion VARCHAR(42),
  PRIMARY KEY (codeCia, numVol, dateDep),
  FOREIGN KEY (aeroportDep) REFERENCES AEROPORT(aeroportNom),
  FOREIGN KEY (aeroportArr) REFERENCES AEROPORT(aeroportNom),
  FOREIGN KEY (immAvion) REFERENCES AVION(immAvion),
  FOREIGN KEY (codeCia) REFERENCES CIA(codeCia)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE SIEGE(
  immAvion VARCHAR(42),
  numSiege VARCHAR(10),
  categorie VARCHAR(42),
  etatSiege VARCHAR(10),
  PRIMARY KEY (immAvion, numSiege),
  FOREIGN KEY (immAvion) REFERENCES AVION(immAvion)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE CLASSE(
  immAvion VARCHAR(42),
  categorie VARCHAR(42),
  classe VARCHAR(42),
  PRIMARY KEY (immAvion, categorie),
  FOREIGN KEY (immAvion) REFERENCES AVION(immAvion)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE CLIENT(
  idCl INT PRIMARY KEY,
  nomCl VARCHAR(42),
  prenomCl VARCHAR(42),
  sexeCl VARCHAR(42),
  ddnCl DATE,
  adresseCli VARCHAR(255),
  telCli VARCHAR(42),
  emailCli VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE PRIX_VOL(
  codeCia VARCHAR(10),
  numVol VARCHAR(42),
  dateDep DATETIME,
  categorie VARCHAR(42),
  prix FLOAT,
  PRIMARY KEY (codeCia, numVol, dateDep, categorie),
  FOREIGN KEY (codeCia, numVol, dateDep) REFERENCES VOL(codeCia, numVol, dateDep)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE RES_CLIENT(
  codeCia VARCHAR(10),
  numVol VARCHAR(42),
  dateDep DATETIME,
  idCl int,
  codeRes VARCHAR(10),
  immAvion VARCHAR(42),
  numSiege VARCHAR(10),
  repas VARCHAR(42),
  PRIMARY KEY (codeCia, numVol, dateDep, idCl),
  UNIQUE (codeCia, numVol, dateDep, numSiege),
  FOREIGN KEY (codeCia, numVol, dateDep) REFERENCES VOL(codeCia, numVol, dateDep),
  FOREIGN KEY (idCl) REFERENCES CLIENT(idCl),
  FOREIGN KEY (immAvion, numSiege) REFERENCES SIEGE(immAvion, numSiege)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

    



