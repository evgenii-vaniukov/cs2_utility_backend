import prisma from "../../db";

export const getUtilityCollections = async (req, res) => {
  const utilityCollections = await prisma.utilityCollection.findMany();
  res.json({data: utilityCollections});
};
