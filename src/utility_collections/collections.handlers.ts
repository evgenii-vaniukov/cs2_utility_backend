import prisma from "../db";

export const getUtilityCollections = async (req, res) => {
  const utilityCollections = await prisma.utilityCollection.findMany();
  res.json({data: utilityCollections});
};

export const getCollectionDetails = async (req, res) => {
  const {id} = req.params;
  const collection = await prisma.utilityCollection.findUnique({
    where: {
      utilityCollectonId: id,
    },
    include: {
      utilities: true,
    },
  });
  res.json({data: collection.utilities});
};
