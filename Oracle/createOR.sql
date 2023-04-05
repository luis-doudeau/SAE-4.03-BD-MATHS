DROP TABLE Vol;
DROP TABLE Compagnie;
DROP TABLE Aeroport;

DROP TYPE IndiceQualiteTableType;
DROP TYPE IndiceQualiteType;
DROP TYPE EquipageTable;
DROP TYPE EquipageType;


-- Création des types
CREATE OR REPLACE TYPE EquipageType AS OBJECT (
  nom VARCHAR2(255),
  prenom VARCHAR2(255),
  fonction VARCHAR2(255)
);
/


CREATE OR REPLACE TYPE IndiceQualiteType AS OBJECT (
  nom VARCHAR2(255),
  poids NUMBER,
  poids_actuel NUMBER

);
/

create type IndiceQualiteTableType as VARRAY(10) of IndiceQualiteType;
/
create type EquipageTable as table of EquipageType;
/

-- Création de la table Aeroport
CREATE TABLE Aeroport (
  ID_aeroport NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nom VARCHAR2(255) NOT NULL,
  ville VARCHAR2(255) NOT NULL
);


-- Création de la table Compagnie
CREATE TABLE Compagnie (
  ID_compagnie NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nom VARCHAR2(255) NOT NULL
);


-- Création de la table Vol
CREATE TABLE Vol (
  ID_vol NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  NumVol NUMBER NOT NULL,
  AeroDep NUMBER NOT NULL,
  DateHeureDep TIMESTAMP NOT NULL,
  AeroArr NUMBER NOT NULL,
  DateHeureArr TIMESTAMP NOT NULL,
  Equipage EquipageTable,
  IndiceQualite IndiceQualiteTableType,
  CONSTRAINT FK_AeroDep FOREIGN KEY (AeroDep) REFERENCES Aeroport (ID_aeroport),
  CONSTRAINT FK_AeroArr FOREIGN KEY (AeroArr) REFERENCES Aeroport (ID_aeroport)
)
NESTED TABLE Equipage STORE AS equipage_table;
