import {Router} from "express";
import {getUtilityCollections} from "./handlers/collections";

const router = Router();

router.get("/", getUtilityCollections);

export default router;
