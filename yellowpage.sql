DROP TABLE IF EXISTS "categories";
CREATE TABLE "categories" (
    "category_id"	TEXT NOT NULL,
    "category_name"	TEXT NOT NULL,
    "category_description"	TEXT NOT NULL,
    "is_visible"	TEXT NOT NULL,
    PRIMARY KEY("category_id")
);

DROP TABLE IF EXISTS "persons";
CREATE TABLE "persons" (
    "person_id"	TEXT NOT NULL,
    "person_code"	TEXT NOT NULL,
    "person_title"	TEXT NOT NULL,
    "person_firstname"	TEXT NOT NULL,
    "person_middlename"	TEXT NOT NULL,
    "person_lastname"	TEXT NOT NULL,
    "person_nickname"	TEXT NOT NULL,
    PRIMARY KEY("person_id")
);

DROP TABLE IF EXISTS "businesses";
CREATE TABLE "businesses" (
    "business_id"	TEXT NOT NULL,
    "person_id" 	TEXT NOT NULL,
    "business_name"	TEXT NOT NULL,
    "business_license"	TEXT NOT NULL,
    "business_registration"	TEXT NOT NULL,
    "established_on" TEXT NOT NULL,
    "is_visible"	TEXT NOT NULL,
    FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY("business_id")
);

DROP TABLE IF EXISTS "business_categories";
CREATE TABLE "business_categories" (
    "business_category_id"	TEXT NOT NULL,
    "business_id"	TEXT NOT NULL,
    "category_id"	TEXT NOT NULL,
    PRIMARY KEY("business_category_id")
);

DROP TABLE IF EXISTS "addresses";
CREATE TABLE "addresses" (
    "address_id"	TEXT NOT NULL,
    "person_id" 	TEXT NOT NULL,
    "address_name"	TEXT NOT NULL,
    "address_address"	TEXT NOT NULL,
    "address_city"	TEXT NOT NULL,
    "address_state"	TEXT NOT NULL,
    "address_postalcode"	TEXT NOT NULL,
    "address_country"	TEXT NOT NULL,
    "is_visible"	TEXT NOT NULL,
    FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY("address_id")
);

DROP TABLE IF EXISTS "credentials";
CREATE TABLE "credentials" (
    "credential_id"	TEXT NOT NULL,
    "person_id" 	TEXT NOT NULL,
    "credential_email"	TEXT NOT NULL UNIQUE,
    "credential_password"	TEXT NOT NULL,
    "credential_question"	TEXT NOT NULL,
    "credential_answer"	TEXT NOT NULL,
    "is_visible"	TEXT NOT NULL,
    FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY("credential_id")
);

DROP TABLE IF EXISTS "contacts";
CREATE TABLE "contacts" (
    "contact_id"	TEXT NOT NULL,
    "person_id" 	TEXT NOT NULL,
    "contact_email"	TEXT NOT NULL,
    "contact_website"	TEXT NOT NULL,
    "contact_phone"	TEXT NOT NULL,
    "contact_fax"	TEXT NOT NULL,
    "is_visible"	TEXT NOT NULL,
    FOREIGN KEY ("person_id") REFERENCES "persons"("person_id") ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY("contact_id")
);
