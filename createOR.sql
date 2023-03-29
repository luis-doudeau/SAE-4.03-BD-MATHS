-- Suppression des tables et types précédemment créés (si existants)
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Vol';
   EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Aeroport';
   EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Compagnie';
   EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TYPE EquipageType';
   EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -4043 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TYPE IndiceQualiteType';
   EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -4043 THEN
         RAISE;
      END IF;
END;
/

-- Création des types
CREATE OR REPLACE TYPE EquipageType AS OBJECT (
  nom VARCHAR2(255),
  prenom VARCHAR2(255),
  fonction VARCHAR2(255)
);
/

CREATE OR REPLACE TYPE IndiceQualiteType AS OBJECT (
  nom VARCHAR2(255),
  poids NUMBER
);
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
  NumVol NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  AeroDep NUMBER NOT NULL,
  DateHeureDep TIMESTAMP NOT NULL,
  AeroArr NUMBER NOT NULL,
  DateHeureArr TIMESTAMP NOT NULL,
  Equipage EquipageType NOT NULL,
  IndicesQualite IndiceQualiteType NOT NULL,
  CONSTRAINT FK_AeroDep FOREIGN KEY (AeroDep) REFERENCES Aeroport (ID_aeroport),
  CONSTRAINT FK_AeroArr FOREIGN KEY (AeroArr) REFERENCES Aeroport (ID_aeroport)
);

-- Insertion des données dans la table IndicesQualite
INSERT INTO IndiceQualiteType (nom, poids) VALUES ('carbone', 0.4);
INSERT INTO IndiceQualiteType (nom, poids) VALUES ('sécurité', 0.3);
INSERT INTO IndiceQualiteType (nom, poids) VALUES ('prix', 0.3);
