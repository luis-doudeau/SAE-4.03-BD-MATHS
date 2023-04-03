-- PARTIE 3.4
-- VERSION 1

CREATE (jfk:Aeroport {nom: "JFK", terminal: "4", ville:"New York"})
CREATE (cdg:Aeroport {nom: "Charles de Gaulle", terminal: "2E", ville:"Paris"})
CREATE (narita:Aeroport {nom: "Narita", terminal: "1", ville:"Tokyo"})
CREATE (honolulu:Aeroport {nom: "Daniel K. Inouye", terminal: "B", ville:"Honolulu"})
CREATE (domodedovo:Aeroport {nom: "Domodedovo", terminal: "A", ville:"Moscou"})

CREATE (:Vol {numVol: "DL456", dateHeureDepart: "2023-04-02T09:00:00Z", dateHeureArrivee: "2023-04-02T12:15:00Z"})-[:DEPART_DE]->(jfk)-[:ARRIVEE_A]->(cdg)

CREATE (:Vol {numVol: "JL789", dateHeureDepart: "2023-04-03T11:30:00Z", dateHeureArrivee: "2023-04-04T05:45:00Z"})-[:DEPART_DE]->(narita)-[:ARRIVEE_A]->(cdg)

CREATE (:Vol {numVol: "AF123", dateHeureDepart: "2023-04-01T14:30:00Z", dateHeureArrivee: "2023-04-01T17:45:00Z"})-[:DEPART_DE]->(cdg)-[:ARRIVEE_A]->(jfk)

CREATE (:Vol {numVol: "NY123", dateHeureDepart: "2023-04-10T12:00:00Z", dateHeureArrivee: "2023-04-11T16:00:00Z"})-[:DEPART_DE]->(jfk)-[:ARRIVEE_A]->(narita)

CREATE (:Vol {numVol: "HA456", dateHeureDepart: "2023-04-20T08:00:00Z", dateHeureArrivee: "2023-04-20T20:00:00Z"})-[:DEPART_DE]->(honolulu)-[:ARRIVEE_A]->(jfk)

CREATE (:Vol {numVol: "SU123", dateHeureDepart: "2023-04-15T10:30:00Z", dateHeureArrivee: "2023-04-15T16:00:00Z"})-[:DEPART_DE]->(narita)-[:ARRIVEE_A]->(domodedovo)

-- Permet de récupérer tous les aéroports d'arrivés d'un Avion partant de Paris :

MATCH (start:Aeroport {ville: "Paris"})-[:DEPART_DE|ARRIVEE_A*]->(destination:Aeroport) RETURN DISTINCT destination.ville AS Ville ORDER BY Ville








CREATE (jfk:Aeroport {nom: "JFK", terminal: "4", ville:"New York"})
CREATE (cdg:Aeroport {nom: "Charles de Gaulle", terminal: "2E", ville:"Paris"})
CREATE (narita:Aeroport {nom: "Narita", terminal: "1", ville:"Tokyo"})
CREATE (honolulu:Aeroport {nom: "Daniel K. Inouye", terminal: "B", ville:"Honolulu"})
CREATE (domodedovo:Aeroport {nom: "Domodedovo", terminal: "A", ville:"Moscou"}) 

CREATE (:Vol {numVol: "AF123", dateHeureDepart: "2023-04-01T01:30:00Z", dateHeureArrivee: "2023-04-01T02:45:00Z"})-[:DEPART_DE]->(cdg)-[:ARRIVEE_A]->(jfk)


CREATE (:Vol {numVol: "DL456", dateHeureDepart: "2023-06-01T15:00:00Z", dateHeureArrivee: "2023-06-01T17:15:00Z"})-[:DEPART_DE]->(jfk)-[:ARRIVEE_A]->(cdg)
CREATE (:Vol {numVol: "NY123", dateHeureDepart: "2023-02-01T03:00:00Z", dateHeureArrivee: "2023-02-01T10:00:00Z"})-[:DEPART_DE]->(jfk)-[:ARRIVEE_A]->(narita)


CREATE (:Vol {numVol: "JL789", dateHeureDepart: "2023-07-01T11:30:00Z", dateHeureArrivee: "2023-07-01T05:45:00Z"})-[:DEPART_DE]->(narita)-[:ARRIVEE_A]->(cdg)
CREATE (:Vol {numVol: "SU123", dateHeureDepart: "2023-07-01T09:30:00Z", dateHeureArrivee: "2023-07-01T16:00:00Z"})-[:DEPART_DE]->(narita)-[:ARRIVEE_A]->(domodedovo)


CREATE (:Vol {numVol: "HA456", dateHeureDepart: "2023-08-01T08:00:00Z", dateHeureArrivee: "2023-08-01T20:00:00Z"})-[:DEPART_DE]->(honolulu)-[:ARRIVEE_A]->(jfk)
