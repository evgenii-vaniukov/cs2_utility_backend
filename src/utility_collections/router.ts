import {Router} from "express";
import {
  getCollectionDetails,
  getUtilityCollections,
} from "./collections.handlers";

const utility_collections_router = Router();

utility_collections_router.get("/", getUtilityCollections);
utility_collections_router.get("/:id", getCollectionDetails);

export default utility_collections_router;
