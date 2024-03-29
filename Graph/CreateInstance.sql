
/*
Cette modélisation utilise des nœuds pour représenter des aéroports et des relations pour représenter des vols.
Les nœuds aéroport ont des propriétés telles que le nom et la ville, tandis que les relations vol ont des propriétés telles que le numéro de vol,
la date et l'heure de départ et d'arrivée.
Les relations vol sont utilisées pour connecter les nœuds aéroport dans l'ordre dans lequel les vols sont effectués. Par exemple,
le vol "AF123" part de l'aéroport de Paris Charles de Gaulle et arrive à l'aéroport JFK de New York.
La relation de vol est donc créée entre ces deux nœuds aéroport avec les propriétés appropriées pour le vol.
Cette modélisation permet de représenter facilement les vols entre différents aéroports et de rechercher des itinéraires de vol en utilisant des requêtes Cypher.*/

CREATE (cdg:Aeroport {nom: "Charles de Gaulle", ville: "Paris"})
CREATE (jfk:Aeroport {nom: "JFK", ville: "New York"})
CREATE (lax:Aeroport {nom: "LAX", ville: "Los Angeles"})
CREATE (bkk:Aeroport {nom: "Suvarnabhumi Airport", ville: "Bangkok"})
CREATE (syd:Aeroport {nom: "Kingsford Smith Airport", ville: "Sydney"})
CREATE (hnd:Aeroport {nom: "Haneda Airport", ville: "Tokyo"})
CREATE (hwa:Aeroport {nom: "Hwaii Airport", ville: "Hawaii"})


CREATE (:Vol {numVol: "AF123", dateHeureDepart: "2023-04-01T01:30:00Z", dateHeureArrivee: "2023-04-01T02:45:00Z"})-[:DEPART_DE]->(cdg)-[:ARRIVEE_A]->(jfk)
CREATE (:Vol {numVol: "DL456", dateHeureDepart: "2023-04-02T03:00:00Z", dateHeureArrivee: "2023-04-02T06:15:00Z"})-[:DEPART_DE]->(jfk)-[:ARRIVEE_A]->(lax)
CREATE (:Vol {numVol: "EK789", dateHeureDepart: "2023-04-03T08:30:00Z", dateHeureArrivee: "2023-04-03T23:45:00Z"})-[:DEPART_DE]->(lax)-[:ARRIVEE_A]->(bkk)
CREATE (:Vol {numVol: "QR123", dateHeureDepart: "2023-04-04T03:30:00Z", dateHeureArrivee: "2023-04-04T15:00:00Z"})-[:DEPART_DE]->(bkk)-[:ARRIVEE_A]->(syd)
CREATE (:Vol {numVol: "JL456", dateHeureDepart: "2023-04-05T10:00:00Z", dateHeureArrivee: "2023-04-05T18:30:00Z"})-[:DEPART_DE]->(syd)-[:ARRIVEE_A]->(hnd)
CREATE (:Vol {numVol: "JFAFA", dateHeureDepart: "2023-04-02T15:00:00Z", dateHeureArrivee: "2023-04-05T18:30:00Z"})-[:DEPART_DE]->(syd)-[:ARRIVEE_A]->(hwa)

-- Veuillez fournir la liste des villes accessibles depuis Paris
MATCH (start:Aeroport {ville: "Paris"})-[:DEPART_DE|ARRIVEE_A*]->(destination:Aeroport)
RETURN DISTINCT destination.ville AS Ville ORDER BY Ville

--Veuillez fournir la liste des ville accessible depuis Paris en prenant compte des horraires
MATCH(start:Vol)-[:DEPART_DE]->(a:Aeroport {ville :"Paris"})-[c:DEPART_DE|ARRIVEE_A*]->(destination:Aeroport)<-[r:DEPART_DE]-(v:Vol) 
WHERE duration.between(datetime(start.dateHeureArrivee), datetime(v.dateHeureDepart)).days > 0
RETURN DISTINCT destination.ville AS Ville ORDER BY Ville

--Veuillez fournir la liste des ville accessible depuis Paris-Sydney en prenant compte des horraires
MATCH (start:Aeroport {ville: "Paris"})-[r:DEPART_DE|ARRIVEE_A*]->(destination:Aeroport)-[:ARRIVEE_A*]->(end:Aeroport {ville:"Sydney"})
return destination.ville
