import prisma from "../db";

export const getUtilityCollections = async (req, res, next) => {
  try {
    const utilityCollections = await prisma.utilityCollection.findMany();
    res.json({data: utilityCollections});
  } catch (err) {
    next(err);
  }
};

export const getCollectionDetails = async (req, res, next) => {
  try {
    const {id} = req.params;
    const collection = await prisma.utilityCollection.findUnique({
      where: {
        utilityCollectonId: id,
      },
      include: {
        utilities: true,
      },
    });
    res.json({
      data: collection.utilities,
      utilitiesOrder: collection.utilitiesOrder,
    });
  } catch (err) {
    next(err);
  }
};
