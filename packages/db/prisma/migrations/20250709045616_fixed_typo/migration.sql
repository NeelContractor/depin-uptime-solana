/*
  Warnings:

  - You are about to drop the column `createdAr` on the `WebsiteTrick` table. All the data in the column will be lost.
  - Added the required column `createdAt` to the `WebsiteTrick` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "WebsiteTrick" DROP COLUMN "createdAr",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL;
