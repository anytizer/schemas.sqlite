DROP TABLE IF EXISTS "customers";
CREATE TABLE "customers" (
	"customer_id"	TEXT NOT NULL,
	"customer_name"	TEXT NOT NULL,
	"customer_reference"	TEXT NOT NULL,
	"customer_contact"	TEXT NOT NULL,
	PRIMARY KEY("customer_id")
);

DROP TABLE IF EXISTS "statuses";
CREATE TABLE "statuses" (
	"status_id"	TEXT NOT NULL,
	"status_name"	TEXT NOT NULL,
	"status_weight"	TEXT NOT NULL,
	PRIMARY KEY("status_id")
);

DROP TABLE IF EXISTS "complaints";
CREATE TABLE "complaints" (
	"complaint_id"	TEXT NOT NULL,
	"customer_id"	TEXT NOT NULL,
	"complaint_on"	TEXT NOT NULL,
	"complaint_title"	TEXT NOT NULL,
	"complaint_description"	TEXT NOT NULL,
	PRIMARY KEY("complaint_id"),
	FOREIGN KEY("customer_id") REFERENCES "customers"("customer_id") ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS "resolutions";
CREATE TABLE "resolutions" (
	"resolution_id"	TEXT NOT NULL,
	"complaint_id"	TEXT NOT NULL,
	"status_id"	TEXT NOT NULL,
	"resolution_on"	TEXT NOT NULL,
	"resolution_description"	TEXT NOT NULL,
	PRIMARY KEY("resolution_id"),
	FOREIGN KEY("complaint_id") REFERENCES "complaints"("complaint_id") ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY("status_id") REFERENCES "resolutions"("resolution_id") ON UPDATE CASCADE ON DELETE CASCADE
);