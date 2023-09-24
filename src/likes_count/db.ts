import {collection, doc, getDocs, setDoc} from "firebase/firestore";

async function getLikesCount(db) {
  const likesCount = collection(db, "likesCount");
  const docs = await getDocs(likesCount);
  const count = docs.docs.map((doc) => doc.data());
  return count[0];
}

async function updateLikesCount(db, data) {
  await setDoc(doc(db, "likesCount", "likes_count"), data);
}

export {getLikesCount, updateLikesCount};
