import express from "express";
import router from "./utility_collections/collections.router";

const app = express();

app.use(express.json());
app.use(express.urlencoded({extended: true}));

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.use("/utilitycollections", router);

export default app;
