CREATE DATABASE "money_bank"

CREATE TABLE "customers" (
    "id" SERIAL NOT NULL PRIMARY KEY,
    "fullName" TEXT NOT NULL,
    "cpf" VARCHAR(11) UNIQUE NOT NULL, 
    "email" TEXT UNIQUE NOT NULL,
    "password" VARCHAR(50) NOT NULL
)
CREATE TABLE "bankAccount"(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountNumber" VARCHAR(50) UNIQUE NOT NULL,
    "agency" TEXT NOT NULL,
    "openDate" DATE NOT NULL DEFAULT NOW(),
    "closeDate" DATE DEFAULT NULL
)
CREATE TYPE "transactionType" AS ENUM ('withdraw', 'deposit');
CREATE TABLE "transactions"(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "amount" INTEGER NOT NULL,
    "type" "transactionType" NOT NULL,
    "time" TIMESTAMP NOT NULL DEFAULT NOW(),
    "description" TEXT,
    "cancelled" BOOLEAN NOT NULL DEFAULT FALSE,
)
CREATE TABLE "creditCards"(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "name" VARCHAR(50) NOT NULL,
    "number" VARCHAR(16) NOT NULL,
    "securityCode" VARCHAR(3) NOT NULL,
    "expirationMonth" VARCHAR(2) NOT NULL,
    "expirationYear" VARCHAR(2) NOT NULL,
    "password" VARCHAR(4) NOT NULL,
    "limit" INTEGER
)
CREATE TYPE "phoneType" AS ENUM ('landline', 'mobile')
CREATE TABLE "customerPhones"(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "number" VARCHAR(9)
    "type" "phoneType" NOT NULL
)
CREATE TABLE "customerAddresses"(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "customerId" INTEGER UNIQUE NOT NULL REFERENCES "customers"("id"),
    "street" TEXT NOT NULL,
    "number" VARCHAR(10),
    "complement" VARCHAR(10),
    "postalCode" VARCHAR(10),
    "cityId" INTEGER UNIQUE NOT NULL REFERENCES "cities"("id")
)
CREATE TABLE "cities"(
    "id" SERIE
)
