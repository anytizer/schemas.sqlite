DROP TABLE IF EXISTS "years";
CREATE TABLE "years" (
	"year_id"	TEXT NOT NULL,
	"year_year"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("year_id")
);

DROP TABLE IF EXISTS "codes";
CREATE TABLE "codes" (
	"code_id"	TEXT NOT NULL,
	"code_year"	TEXT NOT NULL,
	"code_snippet"	TEXT NOT NULL,
	"code_password"	TEXT NOT NULL,
	"generated_on"	TEXT NOT NULL,
	"generated_by"	TEXT NOT NULL,
    FOREIGN KEY ("code_year") REFERENCES "years"("year_year") ON UPDATE CASCADE ON DELETE CASCADE,
	UNIQUE ("code_year", "code_snippet"),
    PRIMARY KEY("code_id")
);

DROP TABLE IF EXISTS "persons";
CREATE TABLE "persons" (
	"person_id"	TEXT NOT NULL,
	"code_id"	TEXT NOT NULL,
	"person_fullname"	TEXT NOT NULL,
	"person_firstname"	TEXT NOT NULL,
	"person_middlename"	TEXT NOT NULL,
	"person_lastname"	TEXT NOT NULL,
	"person_dob"	TEXT NOT NULL,
    FOREIGN KEY ("code_id") REFERENCES "codes"("code_id") ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY("person_id")
);

DROP TABLE IF EXISTS "addresses";
CREATE TABLE "addresses" (
	"address_id"	TEXT NOT NULL,
	"person_id"	TEXT NOT NULL,
    "address_apartment"   TEXT NOT NULL,
    "address_building"   TEXT NOT NULL,
    "address_street"   TEXT NOT NULL,
    "address_city"   TEXT NOT NULL,
    "address_state"   TEXT NOT NULL,
    "address_postalcode"   TEXT NOT NULL,
    "address_country"   TEXT NOT NULL,
    FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY("address_id")
);

DROP TABLE IF EXISTS "contacts";
CREATE TABLE "contacts" (
	"contact_id"	TEXT NOT NULL,
	"person_id"	TEXT NOT NULL,
    "contact_phone"   TEXT NOT NULL,
    "contact_fax"   TEXT NOT NULL,
    "contact_email"   TEXT NOT NULL,
    "contact_website"   TEXT NOT NULL,
    FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY("contact_id")
);
