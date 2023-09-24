import {Router} from "express";
import {getLikes, updateLikes} from "./likes.handler";

const likes_router = Router();

likes_router.get("/", getLikes);
likes_router.post("/", updateLikes);

likes_router.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send("Something broke!");
});

export default likes_router;
