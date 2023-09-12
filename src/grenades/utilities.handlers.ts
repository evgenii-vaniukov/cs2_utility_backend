import prisma from "../db";

export const getUtilitiesFromCollection = async (req, res) => {
  const utilities = await prisma.utility.findMany({
    where: {
      utilityCollections: {
        some: {
          utilityCollectonId: req.params.collectionId,
        },
      },
    },
  });
  res.json({data: utilities});
};
