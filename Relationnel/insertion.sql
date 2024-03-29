-- insertion des données dans la table Compagnie
INSERT INTO Compagnie (nom_compagnie) VALUES ('Air France');
INSERT INTO Compagnie (nom_compagnie) VALUES ('Lufthansa');
INSERT INTO Compagnie (nom_compagnie) VALUES ('British Airways');

-- insertion des données dans la table Aeroport
INSERT INTO Aeroport (nom_aeroport, ville, pays) VALUES ('Charles de Gaulle', 'Paris', 'FR');
INSERT INTO Aeroport (nom_aeroport, ville, pays) VALUES ('Antonio Carlos Jobim', 'Rio de Janeiro', 'BR');
INSERT INTO Aeroport (nom_aeroport, ville, pays) VALUES ('Heathrow', 'London', 'UK');
INSERT INTO Aeroport (nom_aeroport, ville, pays) VALUES ('Frankfurt Airport', 'Frankfurt', 'DE');

-- insertion des données dans la table Vol
INSERT INTO Vol (numero_vol, ID_compagnie, date_heure_depart, ID_aeroport_depart, terminal_depart, ID_aeroport_arrivee, terminal_arrivee, date_heure_arrivee)
VALUES (0442, 1, TO_DATE('2023-07-10 23:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, '2E', 2, '1', TO_DATE('2023-07-11 05:30:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Vol (numero_vol, ID_compagnie, date_heure_depart, ID_aeroport_depart, terminal_depart, ID_aeroport_arrivee, terminal_arrivee, date_heure_arrivee)
VALUES (0356, 1, TO_DATE('2023-07-10 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, '2F', 3, '5', TO_DATE('2023-07-10 21:30:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Vol (numero_vol, ID_compagnie, date_heure_depart, ID_aeroport_depart, terminal_depart, ID_aeroport_arrivee, terminal_arrivee, date_heure_arrivee)
VALUES (1215, 2, TO_DATE('2023-07-10 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, '1A', 4, '3', TO_DATE('2023-07-10 19:45:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Vol (numero_vol, ID_compagnie, date_heure_depart, ID_aeroport_depart, terminal_depart, ID_aeroport_arrivee, terminal_arrivee, date_heure_arrivee)
VALUES (7812, 3, TO_DATE('2023-08-10 07:45:00', 'YYYY-MM-DD HH24:MI:SS'), 3, '4', 4, '2', TO_DATE('2023-08-10 10:30:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Vol (numero_vol, ID_compagnie, date_heure_depart, ID_aeroport_depart, terminal_depart, ID_aeroport_arrivee, terminal_arrivee, date_heure_arrivee)
VALUES (0442, 1, TO_DATE('2023-07-10 23:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, '2E', 2, '1', TO_DATE('2023-07-11 05:30:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Vol (numero_vol, ID_compagnie, date_heure_depart, ID_aeroport_depart, terminal_depart, ID_aeroport_arrivee, terminal_arrivee, date_heure_arrivee)
VALUES(0356, 1, TO_DATE('2023-07-10 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, '2F', 3, '5', TO_DATE('2023-07-10 21:30:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Vol (numero_vol, ID_compagnie, date_heure_depart, ID_aeroport_depart, terminal_depart, ID_aeroport_arrivee, terminal_arrivee, date_heure_arrivee)
VALUES(1215, 2, TO_DATE('2023-07-10 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, '1A', 4, '3', TO_DATE('2023-07-10 19:45:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Vol (numero_vol, ID_compagnie, date_heure_depart, ID_aeroport_depart, terminal_depart, ID_aeroport_arrivee, terminal_arrivee, date_heure_arrivee)
VALUES(7812, 3, TO_DATE('2023-11-10 07:45:00', 'YYYY-MM-DD HH24:MI:SS'), 4, '4', 2, '2', TO_DATE('2023-11-10 10:30:00', 'YYYY-MM-DD HH24:MI:SS'));
