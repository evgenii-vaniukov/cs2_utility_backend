import {Router} from "express";
import {getUtilitiesFromCollection} from "./utilities.handlers";

const utilities_router = Router();

utilities_router.get("/:collectionId", getUtilitiesFromCollection);

export default utilities_router;
