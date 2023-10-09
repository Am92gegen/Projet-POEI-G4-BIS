BEGIN TRANSACTION;

-- Creating tables
CREATE TABLE IF NOT EXISTS "vehicule" (
	"vehicule_id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"vehicule_desc"	TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS "poste" (
	"poste_id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"poste_desc"	TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS "ordre" (
	"ordre_id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"ordre_desc"	TEXT NOT NULL UNIQUE,
	"poste"	INTEGER NOT NULL,
	"vehicule"	INTEGER NOT NULL,
	FOREIGN KEY("vehicule") REFERENCES "vehicule"("vehicule_id"),
	FOREIGN KEY("poste") REFERENCES "poste"("poste_id")
);

CREATE TABLE IF NOT EXISTS "incident" (
	"incident_id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"incident_desc"	TEXT NOT NULL UNIQUE,
	"ordre"	INTEGER NOT NULL,
	"etat"	TEXT NOT NULL,
	FOREIGN KEY("ordre") REFERENCES "ordre"("ordre_id")
);

-- Inserting data into 'vehicule' with existence check
INSERT INTO "vehicule" ("vehicule_desc") 
SELECT 'Vehicle A' WHERE NOT EXISTS (SELECT 1 FROM "vehicule" WHERE "vehicule_desc" = 'Vehicle A');
INSERT INTO "vehicule" ("vehicule_desc") 
SELECT 'Vehicle B' WHERE NOT EXISTS (SELECT 1 FROM "vehicule" WHERE "vehicule_desc" = 'Vehicle B');
INSERT INTO "vehicule" ("vehicule_desc") 
SELECT 'Vehicle C' WHERE NOT EXISTS (SELECT 1 FROM "vehicule" WHERE "vehicule_desc" = 'Vehicle C');
INSERT INTO "vehicule" ("vehicule_desc") 
SELECT 'Vehicle D' WHERE NOT EXISTS (SELECT 1 FROM "vehicule" WHERE "vehicule_desc" = 'Vehicle D');
INSERT INTO "vehicule" ("vehicule_desc") 
SELECT 'Vehicle E' WHERE NOT EXISTS (SELECT 1 FROM "vehicule" WHERE "vehicule_desc" = 'Vehicle E');
INSERT INTO "vehicule" ("vehicule_desc") 
SELECT 'Vehicle F' WHERE NOT EXISTS (SELECT 1 FROM "vehicule" WHERE "vehicule_desc" = 'Vehicle F');

-- Inserting data into 'poste' with existence check
INSERT INTO "poste" ("poste_desc") 
SELECT 'Workstation 1' WHERE NOT EXISTS (SELECT 1 FROM "poste" WHERE "poste_desc" = 'Workstation 1');
INSERT INTO "poste" ("poste_desc") 
SELECT 'Workstation 2' WHERE NOT EXISTS (SELECT 1 FROM "poste" WHERE "poste_desc" = 'Workstation 2');
INSERT INTO "poste" ("poste_desc") 
SELECT 'Workstation 3' WHERE NOT EXISTS (SELECT 1 FROM "poste" WHERE "poste_desc" = 'Workstation 3');

-- Inserting data into 'ordre' with existence check
INSERT INTO "ordre" ("ordre_desc","poste","vehicule") 
SELECT 'Order 1',1,1 WHERE NOT EXISTS (SELECT 1 FROM "ordre" WHERE "ordre_desc" = 'Order 1');
INSERT INTO "ordre" ("ordre_desc","poste","vehicule") 
SELECT 'Order 2',2,2 WHERE NOT EXISTS (SELECT 1 FROM "ordre" WHERE "ordre_desc" = 'Order 2');
INSERT INTO "ordre" ("ordre_desc","poste","vehicule") 
SELECT 'Order 3',3,3 WHERE NOT EXISTS (SELECT 1 FROM "ordre" WHERE "ordre_desc" = 'Order 3');
INSERT INTO "ordre" ("ordre_desc","poste","vehicule") 
SELECT 'Order 4',1,4 WHERE NOT EXISTS (SELECT 1 FROM "ordre" WHERE "ordre_desc" = 'Order 4');

-- Inserting data into 'incident' with existence check
INSERT INTO "incident" ("incident_desc","ordre","etat") 
SELECT 'Incident 1',1,'OPEN' WHERE NOT EXISTS (SELECT 1 FROM "incident" WHERE "incident_desc" = 'Incident 1');
INSERT INTO "incident" ("incident_desc","ordre","etat") 
SELECT 'Incident 2',2,'CLOSED' WHERE NOT EXISTS (SELECT 1 FROM "incident" WHERE "incident_desc" = 'Incident 2');
INSERT INTO "incident" ("incident_desc","ordre","etat") 
SELECT 'Incident 3',3,'OPEN' WHERE NOT EXISTS (SELECT 1 FROM "incident" WHERE "incident_desc" = 'Incident 3');
INSERT INTO "incident" ("incident_desc","ordre","etat") 
SELECT 'Incident 4',4,'CLOSED' WHERE NOT EXISTS (SELECT 1 FROM "incident" WHERE "incident_desc" = 'Incident 4');

COMMIT;
SELECT * from vehicule;
/*
   This SQL query retrieves all columns from the joined tables: incident, ordre, vehicule, and poste.
   It joins the tables based on the foreign key relationships defined in the original SQL code.
SELECT *
FROM incident
JOIN ordre ON incident.ordre = ordre.ordre_id
JOIN vehicule ON ordre.vehicule = vehicule.vehicule_id
JOIN poste ON ordre.poste = poste.poste_id;

*/

