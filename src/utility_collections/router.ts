import {Router} from "express";
import {getUtilityCollections} from "./collections.handlers";

const utility_collections_router = Router();

utility_collections_router.get("/", getUtilityCollections);

export default utility_collections_router;
