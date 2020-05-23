DROP TABLE IF EXISTS "years";
CREATE TABLE "years" (
	"year_id"	TEXT NOT NULL,
	"year_year"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY ("year_id")
);

DROP TABLE IF EXISTS "batches";
CREATE TABLE "batches" (
	"batch_id"	TEXT NOT NULL,
	"year_id"	TEXT NOT NULL,
    "batch_name"	TEXT NOT NULL,
    "batch_code"	TEXT NOT NULL,
    FOREIGN KEY ("year_id") REFERENCES "years"("year_id") ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY ("batch_id")
);

DROP TABLE IF EXISTS "codes";
CREATE TABLE "codes" (
	"code_id"	TEXT NOT NULL,
	"batch_id"	TEXT NOT NULL,
	"code_snippet"	TEXT NOT NULL,
	"code_password"	TEXT NOT NULL,
	"generated_on"	TEXT NOT NULL,
	"generated_by"	TEXT NOT NULL,
    FOREIGN KEY ("batch_id") REFERENCES "batches"("batch_id") ON UPDATE CASCADE ON DELETE CASCADE,
	UNIQUE ("batch_id", "code_snippet"),
    PRIMARY KEY ("code_id")
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
    PRIMARY KEY ("person_id")
);

DROP TABLE IF EXISTS "contacts";
CREATE TABLE "contacts" (
	"contact_id"	TEXT NOT NULL,
	"person_id"	TEXT NOT NULL,
    "address_name"   TEXT NOT NULL,
    "address_apartment"   TEXT NOT NULL,
    "address_building"   TEXT NOT NULL,
    "address_street"   TEXT NOT NULL,
    "address_city"   TEXT NOT NULL,
    "address_state"   TEXT NOT NULL,
    "address_postalcode"   TEXT NOT NULL,
    "address_country"   TEXT NOT NULL,
    "contact_phone"   TEXT NOT NULL,
    "contact_fax"   TEXT NOT NULL,
    "contact_email"   TEXT NOT NULL,
    "contact_website"   TEXT NOT NULL,
    FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY ("contact_id")
);

DROP TABLE IF EXISTS "enrollments";
CREATE TABLE "enrollments" (
	"enrollment_id"	TEXT NOT NULL,
	"batch_id"	TEXT NOT NULL,
	"person_id"	TEXT NOT NULL,
	"scored_value"	TEXT NOT NULL,
	"checked_by"	TEXT NOT NULL,
	"is_accepted"	TEXT NOT NULL,
    FOREIGN KEY ("batch_id") REFERENCES "batches"("batch_id") ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY ("enrollment_id")
);

