-- Insertion dans la table Aeroport
INSERT INTO Aeroport (nom, ville)
VALUES ('Aéroport Charles de Gaulle', 'Paris');

INSERT INTO Aeroport (nom, ville)
VALUES ('Aéroport de Nice-Côte d''Azur', 'Nice');

INSERT INTO Aeroport (nom, ville)
VALUES ('Aéroport International de Dubaï', 'Dubaï');

-- Insertion dans la table Compagnie
INSERT INTO Compagnie (nom)
VALUES ('Air France');

INSERT INTO Compagnie (nom)
VALUES ('Emirates');

INSERT INTO Compagnie (nom)
VALUES ('Lufthansa');

-- Insertion dans la table Vol
INSERT INTO Vol (NumVol, AeroDep, DateHeureDep, AeroArr, DateHeureArr, Equipage, IndiceQualite)
VALUES (101, 1, TO_TIMESTAMP('2023-04-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, TO_TIMESTAMP('2023-04-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
        EquipageTable(EquipageType('Dupont', 'Jean', 'Pilote'), EquipageType('Martin', 'Sophie', 'Hôtesse de l''air')), 
        IndiceQualiteTableType(IndiceQualiteType('Service à bord', 5, 5), IndiceQualiteType('Ponctualité', 3, 3)));

INSERT INTO Vol (NumVol, AeroDep, DateHeureDep, AeroArr, DateHeureArr, Equipage, IndiceQualite)
VALUES (202, 2, TO_TIMESTAMP('2023-04-05 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, TO_TIMESTAMP('2023-04-05 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
        EquipageTable(EquipageType('Smith', 'John', 'Pilote'), EquipageType('Garcia', 'Maria', 'Hôtesse de l''air'), EquipageType('Doe', 'Jane', 'Steward')), 
        IndiceQualiteTableType(IndiceQualiteType('Service à bord', 4, 4), IndiceQualiteType('Sécurité', 2, 2), IndiceQualiteType('Confort', 3, 3)));
