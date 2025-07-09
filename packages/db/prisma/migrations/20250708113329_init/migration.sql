-- CreateEnum
CREATE TYPE "WebsiteStatus" AS ENUM ('Good', 'Bad');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Website" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Website_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Validator" (
    "id" TEXT NOT NULL,
    "publicKey" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "ip" TEXT NOT NULL,

    CONSTRAINT "Validator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WebsiteTrick" (
    "id" TEXT NOT NULL,
    "websiteId" TEXT NOT NULL,
    "validatorId" TEXT NOT NULL,
    "createdAr" TIMESTAMP(3) NOT NULL,
    "status" "WebsiteStatus" NOT NULL,
    "latency" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "WebsiteTrick_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "WebsiteTrick" ADD CONSTRAINT "WebsiteTrick_websiteId_fkey" FOREIGN KEY ("websiteId") REFERENCES "Website"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebsiteTrick" ADD CONSTRAINT "WebsiteTrick_validatorId_fkey" FOREIGN KEY ("validatorId") REFERENCES "Validator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
