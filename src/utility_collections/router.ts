import {Router} from "express";
import {
  getCollectionDetails,
  getUtilityCollections,
} from "./collections.handlers";

const utility_collections_router = Router();

utility_collections_router.get("/", getUtilityCollections);
utility_collections_router.get("/:id", getCollectionDetails);

utility_collections_router.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send("Something broke!");
});

export default utility_collections_router;
