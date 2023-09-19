-- CreateEnum
CREATE TYPE "Precision" AS ENUM ('IMPORTANT', 'NOT_IMPORTANT');

-- CreateEnum
CREATE TYPE "Bind" AS ENUM ('NONE', 'JUMPTHROW', 'RUNTHROW');

-- AlterTable
ALTER TABLE "Utility" ADD COLUMN     "bind" "Bind" NOT NULL DEFAULT 'NONE',
ADD COLUMN     "description" VARCHAR(255) NOT NULL DEFAULT '',
ADD COLUMN     "precisionOPosition" "Precision" NOT NULL DEFAULT 'IMPORTANT',
ADD COLUMN     "precisionOfCrosshairAlignment" "Precision" NOT NULL DEFAULT 'IMPORTANT';
