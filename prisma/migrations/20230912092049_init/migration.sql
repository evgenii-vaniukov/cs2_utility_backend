-- CreateEnum
CREATE TYPE "GrenadeTypeCode" AS ENUM ('FLASH', 'SMOKE', 'MOLOTOV', 'DECOY', 'HE');

-- CreateEnum
CREATE TYPE "MapCode" AS ENUM ('DE_INFERNO', 'DE_NUKE', 'DE_MIRAGE', 'DE_OVERPASS', 'DE_VERTIGO', 'DE_ANUBIS', 'DE_ANCIENT');

-- CreateEnum
CREATE TYPE "TeamCode" AS ENUM ('T_SIDE', 'CT_SIDE');

-- CreateEnum
CREATE TYPE "PlantCode" AS ENUM ('A', 'B');

-- CreateTable
CREATE TABLE "GrenadeTypes" (
    "grenadeTypeCode" "GrenadeTypeCode" NOT NULL,
    "grenadeTypeName" VARCHAR(10) NOT NULL,

    CONSTRAINT "GrenadeTypes_pkey" PRIMARY KEY ("grenadeTypeCode")
);

-- CreateTable
CREATE TABLE "Maps" (
    "mapCode" "MapCode" NOT NULL,
    "mapName" VARCHAR(20) NOT NULL,

    CONSTRAINT "Maps_pkey" PRIMARY KEY ("mapCode")
);

-- CreateTable
CREATE TABLE "Teams" (
    "teamCode" "TeamCode" NOT NULL,
    "team_name" VARCHAR(20) NOT NULL,

    CONSTRAINT "Teams_pkey" PRIMARY KEY ("teamCode")
);

-- CreateTable
CREATE TABLE "Plants" (
    "plantCode" "PlantCode" NOT NULL,
    "plantName" VARCHAR(10) NOT NULL,

    CONSTRAINT "Plants_pkey" PRIMARY KEY ("plantCode")
);

-- CreateTable
CREATE TABLE "MapPositions" (
    "positionId" TEXT NOT NULL,
    "mapCode" "MapCode" NOT NULL,
    "positionName" VARCHAR(20) NOT NULL,

    CONSTRAINT "MapPositions_pkey" PRIMARY KEY ("positionId")
);

-- CreateTable
CREATE TABLE "Utility" (
    "utilityId" TEXT NOT NULL,
    "label" VARCHAR(255) NOT NULL,
    "fromPositionId" TEXT NOT NULL,
    "toPositionId" TEXT NOT NULL,
    "grenadeTypeCode" "GrenadeTypeCode" NOT NULL,
    "plantCode" "PlantCode" NOT NULL,
    "throwing" TEXT NOT NULL,
    "landing" TEXT NOT NULL,
    "crosshairAlignment" TEXT NOT NULL,

    CONSTRAINT "Utility_pkey" PRIMARY KEY ("utilityId")
);

-- CreateTable
CREATE TABLE "UtilityCollection" (
    "utilityCollectonId" TEXT NOT NULL,
    "teamCode" "TeamCode" NOT NULL,
    "plantCode" "PlantCode" NOT NULL,
    "mapCode" "MapCode" NOT NULL,

    CONSTRAINT "UtilityCollection_pkey" PRIMARY KEY ("utilityCollectonId")
);

-- CreateTable
CREATE TABLE "_UtilityToUtilityCollection" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "GrenadeTypes_grenadeTypeName_key" ON "GrenadeTypes"("grenadeTypeName");

-- CreateIndex
CREATE UNIQUE INDEX "Maps_mapName_key" ON "Maps"("mapName");

-- CreateIndex
CREATE UNIQUE INDEX "Teams_team_name_key" ON "Teams"("team_name");

-- CreateIndex
CREATE UNIQUE INDEX "Plants_plantName_key" ON "Plants"("plantName");

-- CreateIndex
CREATE UNIQUE INDEX "_UtilityToUtilityCollection_AB_unique" ON "_UtilityToUtilityCollection"("A", "B");

-- CreateIndex
CREATE INDEX "_UtilityToUtilityCollection_B_index" ON "_UtilityToUtilityCollection"("B");

-- AddForeignKey
ALTER TABLE "MapPositions" ADD CONSTRAINT "MapPositions_mapCode_fkey" FOREIGN KEY ("mapCode") REFERENCES "Maps"("mapCode") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Utility" ADD CONSTRAINT "Utility_fromPositionId_fkey" FOREIGN KEY ("fromPositionId") REFERENCES "MapPositions"("positionId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Utility" ADD CONSTRAINT "Utility_grenadeTypeCode_fkey" FOREIGN KEY ("grenadeTypeCode") REFERENCES "GrenadeTypes"("grenadeTypeCode") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Utility" ADD CONSTRAINT "Utility_plantCode_fkey" FOREIGN KEY ("plantCode") REFERENCES "Plants"("plantCode") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UtilityCollection" ADD CONSTRAINT "UtilityCollection_teamCode_fkey" FOREIGN KEY ("teamCode") REFERENCES "Teams"("teamCode") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UtilityCollection" ADD CONSTRAINT "UtilityCollection_plantCode_fkey" FOREIGN KEY ("plantCode") REFERENCES "Plants"("plantCode") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UtilityCollection" ADD CONSTRAINT "UtilityCollection_mapCode_fkey" FOREIGN KEY ("mapCode") REFERENCES "Maps"("mapCode") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UtilityToUtilityCollection" ADD CONSTRAINT "_UtilityToUtilityCollection_A_fkey" FOREIGN KEY ("A") REFERENCES "Utility"("utilityId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UtilityToUtilityCollection" ADD CONSTRAINT "_UtilityToUtilityCollection_B_fkey" FOREIGN KEY ("B") REFERENCES "UtilityCollection"("utilityCollectonId") ON DELETE CASCADE ON UPDATE CASCADE;
