import prisma from "../db";

export const getUtilities = async (req, res) => {
  const utilities = await prisma.utility.findMany();
  res.json({data: utilities});
};
