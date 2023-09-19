/*
  Warnings:

  - You are about to drop the column `precisionOPosition` on the `Utility` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Utility" DROP COLUMN "precisionOPosition",
ADD COLUMN     "precisionOfPositionAlignment" "Precision" NOT NULL DEFAULT 'IMPORTANT';
