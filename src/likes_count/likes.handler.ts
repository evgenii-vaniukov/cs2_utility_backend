import {db} from "../firebase";
import {getLikesCount, updateLikesCount} from "./db";

export const getLikes = async (req, res, next) => {
  try {
    const likesCount = await getLikesCount(db);
    res.json({likesCount: likesCount.count});
  } catch (err) {
    next(err);
  }
};

export const updateLikes = async (req, res, next) => {
  try {
    await updateLikesCount(db, req.body);
    res.sendStatus(200);
  } catch (err) {
    next(err);
  }
};
