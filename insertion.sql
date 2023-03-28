INSERT INTO Compagnie (nom_compagnie)
VALUES ('Air France'), ('Lufthansa'), ('British Airways');

INSERT INTO Aeroport (nom_aeroport, ville, pays)
VALUES ('Charles de Gaulle', 'Paris', 'FR'),
       ('Antonio Carlos Jobim', 'Rio de Janeiro', 'BR'),
       ('Heathrow', 'London', 'UK'),
       ('Frankfurt Airport', 'Frankfurt', 'DE');

INSERT INTO Vol (numero_vol, ID_compagnie, date_heure_depart, ID_aeroport_depart, terminal_depart, ID_aeroport_arrivee, terminal_arrivee, date_heure_arrivee)
VALUES (0442, 1, '2023-07-10 23:30:00', 1, '2E', 2, '1', '2023-07-11 05:30:00'),
       (0356, 1, '2023-07-10 20:00:00', 1, '2F', 3, '5', '2023-07-10 21:30:00'),
       (1215, 2, '2023-07-10 18:00:00', 1, '1A', 4, '3', '2023-07-10 19:45:00'),
       (7812, 3, '2023-07-10 07:45:00', 3, '4', 4, '2', '2023-07-10 10:30:00');
