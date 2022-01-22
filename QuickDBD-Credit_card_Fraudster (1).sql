-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1ZSuem
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "card_holder" (
    "id" int   NOT NULL,
    "name" varchar2(200)   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "credit_card" (
    "card" varchar2(20)   NOT NULL,
    "cardholder_id" int   NOT NULL,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "card"
     )
);

CREATE TABLE "merchant_category" (
    "id" int   NOT NULL,
    "name" varchar2(20)   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "merchant" (
    "id" int   NOT NULL,
    "name" varchar2(200)   NOT NULL,
    "id_merchant_category" int   NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "transaction" (
    "id" int   NOT NULL,
    "date" timestamp   NOT NULL,
    "amount" float   NOT NULL,
    "card" varchar2(20)   NOT NULL,
    "id_merchat" int   NOT NULL,
    CONSTRAINT "pk_transaction" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_cardholder_id" FOREIGN KEY("cardholder_id")
REFERENCES "card_holder" ("id");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_id_merchant_category" FOREIGN KEY("id_merchant_category")
REFERENCES "merchant_category" ("id");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_card" FOREIGN KEY("card")
REFERENCES "credit_card" ("card");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_id_merchat" FOREIGN KEY("id_merchat")
REFERENCES "merchant" ("id");

