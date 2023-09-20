-- AlterTable
ALTER TABLE "GrenadeTypes" ALTER COLUMN "grenadeTypeName" SET DATA TYPE VARCHAR(20);

-- AlterTable
ALTER TABLE "Maps" ALTER COLUMN "mapName" SET DATA TYPE VARCHAR(100);

-- AlterTable
ALTER TABLE "Utility" ALTER COLUMN "positionAlignment" SET DEFAULT '';

-- AlterTable
ALTER TABLE "UtilityCollection" ALTER COLUMN "label" SET DEFAULT '';
