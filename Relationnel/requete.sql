-- PARTIE 3.1 -- 

-- Question A
-- Donner les villes que nous pouvons atteindre par vols directs qui partent de Paris.
SELECT DISTINCT a2.ville
FROM Vol v
JOIN Aeroport a1 ON v.ID_aeroport_depart = a1.ID_aeroport
JOIN Aeroport a2 ON v.ID_aeroport_arrivee = a2.ID_aeroport
WHERE a1.ville = 'Paris';


-- Question B
-- En considérant les horaires des vols, veuillez fournir la liste des villes accessibles depuis Paris avec un vol comprenant UNE correspondance. L’objectif est de permettre aux passagers de réaliser leur correspondance. 
SELECT DISTINCT a4.ville
FROM Vol v1
JOIN Aeroport a1 ON v1.ID_aeroport_depart = a1.ID_aeroport
JOIN Aeroport a2 ON v1.ID_aeroport_arrivee = a2.ID_aeroport
JOIN Vol v2 ON a2.ID_aeroport = v2.ID_aeroport_depart
JOIN Aeroport a3 ON v2.ID_aeroport_depart = a3.ID_aeroport
JOIN Aeroport a4 ON v2.ID_aeroport_arrivee = a4.ID_aeroport
WHERE a1.ville = 'Paris' AND v2.date_heure_depart > v1.date_heure_arrivee;


-- Question C
-- En considérant les horaires des vols, veuillez fournir la liste des villes accessibles depuis Paris avec un vol comprenant DEUX correspondances
SELECT DISTINCT a6.ville
FROM Vol v1
JOIN Aeroport a1 ON v1.ID_aeroport_depart = a1.ID_aeroport
JOIN Aeroport a2 ON v1.ID_aeroport_arrivee = a2.ID_aeroport
JOIN Vol v2 ON a2.ID_aeroport = v2.ID_aeroport_depart
JOIN Aeroport a3 ON v2.ID_aeroport_depart = a3.ID_aeroport
JOIN Aeroport a4 ON v2.ID_aeroport_arrivee = a4.ID_aeroport
JOIN Vol v3 ON a4.ID_aeroport = v3.ID_aeroport_depart
JOIN Aeroport a5 ON v3.ID_aeroport_depart = a5.ID_aeroport
JOIN Aeroport a6 ON v3.ID_aeroport_arrivee = a6.ID_aeroport
WHERE a1.ville = 'Paris' AND v2.date_heure_depart > v1.date_heure_arrivee AND v3.date_heure_depart > v2.date_heure_arrivee;


-- Question D
-- Veuillez fournir la liste des villes accessibles depuis Paris, en tenant compte des horaires de vol, avec des vols directs ou un nombre quelconque de correspondances.
WITH accessible_cities (ID_aeroport_depart, ID_aeroport_arrivee, ville, date_heure_depart, date_heure_arrivee, correspondances) AS (
-- Cas de base: vols directs depuis Paris
SELECT v.ID_aeroport_depart, v.ID_aeroport_arrivee, a2.ville, v.date_heure_depart, v.date_heure_arrivee, 0
FROM Vol v
JOIN Aeroport a1 ON v.ID_aeroport_depart = a1.ID_aeroport
JOIN Aeroport a2 ON v.ID_aeroport_arrivee = a2.ID_aeroport
WHERE a1.ville = 'Paris'
UNION ALL
-- Cas récursif: correspondances
SELECT v.ID_aeroport_depart, v.ID_aeroport_arrivee, a2.ville, ac.date_heure_depart, v.date_heure_arrivee, ac.correspondances + 1
FROM Vol v
JOIN Aeroport a1 ON v.ID_aeroport_depart = a1.ID_aeroport
JOIN Aeroport a2 ON v.ID_aeroport_arrivee = a2.ID_aeroport
JOIN accessible_cities ac ON v.ID_aeroport_depart = ac.ID_aeroport_arrivee
WHERE v.date_heure_depart > ac.date_heure_arrivee AND v.date_heure_depart <= ac.date_heure_arrivee + INTERVAL '2' DAY
)

SELECT DISTINCT *
FROM accessible_cities
WHERE ville != 'Paris';

