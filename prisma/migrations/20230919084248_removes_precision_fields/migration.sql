/*
  Warnings:

  - You are about to drop the column `precisionOfCrosshairAlignment` on the `Utility` table. All the data in the column will be lost.
  - You are about to drop the column `precisionOfPositionAlignment` on the `Utility` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Utility" DROP COLUMN "precisionOfCrosshairAlignment",
DROP COLUMN "precisionOfPositionAlignment";

-- DropEnum
DROP TYPE "Precision";
