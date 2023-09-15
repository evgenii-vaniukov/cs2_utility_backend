import {Router} from "express";
import {getUtilities} from "./utilities.handlers";

const utilities_router = Router();

utilities_router.get("/", getUtilities);

export default utilities_router;
