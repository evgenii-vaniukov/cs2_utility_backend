-- AlterTable
ALTER TABLE "UtilityCollection" ADD COLUMN     "label" TEXT NOT NULL DEFAULT 'pending',
ADD COLUMN     "thumbnail" TEXT NOT NULL DEFAULT 'pending';
