CREATE TABLE "Other_Parties" (
  "property_id" integer,
  "Guarantor" varchar,
  "Current_Tenant" varchar
);

CREATE TABLE "Property" (
  "id" integer PRIMARY KEY,
  "property_name" varchar,
  "Date_of_lease" varchar
);

CREATE TABLE "Tenant_obligation" (
  "id" integer,
  "property_id" integer,
  "Tenant_Determine" varchar,
  "Repair_obligation" varchar,
  "Repair_decoration" varchar,
  "Permitted_Use" varchar,
  "Alteration_structural" varchar,
  "Alteration_non_structural" varchar,
  "Assignment" varchar,
  "Underlet_whole" varchar,
  "Underlet_part" varchar,
  "Service_proportion" varchar,
  "Service_cap" varchar,
  "Yield_up" varchar
);

CREATE TABLE "Landlord_obligation" (
  "property_id" integer,
  "id" integer,
  "service_landlord" varchar,
  "Act_1954" varchar,
  "Full_reinstatement" varchar,
  "VAT" varchar,
  "uninsured_risk" varchar,
  "Landlord_determine" varchar
);

CREATE TABLE "Rent" (
  "property_id" integer,
  "Term_period" varchar,
  "Annual_rent" varchar,
  "Rent_payable" varchar,
  "Rent_deduction" varchar,
  "Rent_review_method" varchar,
  "Rent_review_upward" varchar,
  "Rent_Commence_date" varchar,
  "Remain_review_date" varchar,
  "suspension" varchar
);

CREATE UNIQUE INDEX ON "Other_Parties" ("property_id", "Guarantor", "Current_Tenant");

CREATE UNIQUE INDEX ON "Tenant_obligation" ("id", "property_id");

CREATE UNIQUE INDEX ON "Landlord_obligation" ("property_id", "id");

CREATE UNIQUE INDEX ON "Rent" ("property_id", "Rent_Commence_date");

ALTER TABLE "Tenant_obligation" ADD FOREIGN KEY ("property_id") REFERENCES "Property" ("id");

ALTER TABLE "Landlord_obligation" ADD FOREIGN KEY ("property_id") REFERENCES "Property" ("id");

ALTER TABLE "Rent" ADD FOREIGN KEY ("property_id") REFERENCES "Property" ("id");

ALTER TABLE "Other_Parties" ADD FOREIGN KEY ("property_id") REFERENCES "Property" ("id");
