CREATE (:Airport {name: 'Paris Charles de Gaulle Airport', code: 'CDG'})
CREATE (:Airport {name: 'São Paulo–Guarulhos International Airport', code: 'GRU'})
CREATE (:Airport {name: 'Rio de Janeiro–Galeão International Airport', code: 'GIG'})
CREATE (:Airport {name: 'Tokyo Haneda International Airport', code: 'HND'})
CREATE (:Airport {name: 'Tokyo Narita International Airport', code: 'NRT'})

CREATE (:Flight {flight_number: 'AF123', departure_time: datetime('2023-04-13T10:00:00Z'), arrival_time: datetime('2023-04-13T18:00:00Z')})
CREATE (:Flight {flight_number: 'AF456', departure_time: datetime('2023-04-14T02:00:00Z'), arrival_time: datetime('2023-04-14T10:00:00Z')})
CREATE (:Flight {flight_number: 'AF789', departure_time: datetime('2023-04-15T12:00:00Z'), arrival_time: datetime('2023-04-16T06:00:00Z')})

MATCH (paris:Airport {code: 'CDG'}), (brazil1:Airport {code: 'GRU'}), (brazil2:Airport {code: 'GIG'}), (japan1:Airport {code: 'HND'}), (japan2:Airport {code: 'NRT'})
CREATE (paris)-[:DEPARTS]->(:Flight {flight_number: 'AF123'})-[:ARRIVES]->(brazil1)
CREATE (:Flight {flight_number: 'AF234', departure_time: datetime('2023-04-14T20:00:00Z'), arrival_time: datetime('2023-04-15T08:00:00Z')})-[:DEPARTS]->(brazil1)-[:ARRIVES]->(brazil2)
CREATE (:Flight {flight_number: 'AF345', departure_time: datetime('2023-04-15T12:00:00Z'), arrival_time: datetime('2023-04-16T06:00:00Z')})-[:DEPARTS]->(brazil2)-[:ARRIVES]->(japan1)
CREATE (:Flight {flight_number: 'AF456'})-[:DEPARTS]->(japan1)-[:ARRIVES]->(japan2)



1d) 
Veuillez fournir la liste des villes accessibles depuis Paris
MATCH (a:Airport {code:'CDG'})-[:DEPARTS*]->(f:Flight)-[:ARRIVES*]->(a1:Airport)
RETURN a1.name