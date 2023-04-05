-- Supprimer les tables si elles existent déjà
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

-- Créer les tables
CREATE TABLE Compagnie (
    ID_compagnie NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_compagnie VARCHAR2(255) NOT NULL
);

CREATE TABLE Aeroport (
    ID_aeroport NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_aeroport VARCHAR2(255) NOT NULL UNIQUE,
    ville VARCHAR2(255) NOT NULL,
    pays VARCHAR2(255) NOT NULL
);

CREATE TABLE Vol (
    ID_vol NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    numero_vol NUMBER NOT NULL,
    ID_compagnie NUMBER,
    date_heure_depart DATE NOT NULL,
    ID_aeroport_depart NUMBER,
    terminal_depart VARCHAR2(255) NOT NULL,
    ID_aeroport_arrivee NUMBER,
    terminal_arrivee VARCHAR2(255) NOT NULL,
    date_heure_arrivee DATE NOT NULL,
    FOREIGN KEY (ID_compagnie) REFERENCES Compagnie (ID_compagnie),
    FOREIGN KEY (ID_aeroport_depart) REFERENCES Aeroport (ID_aeroport),
    FOREIGN KEY (ID_aeroport_arrivee) REFERENCES Aeroport (ID_aeroport)
);
