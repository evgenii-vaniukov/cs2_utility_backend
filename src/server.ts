import cors from "cors";
import express from "express";
import utilities_router from "./grenades/router";
import utility_collections_router from "./utility_collections/router";

const app = express();

app.use(
  cors({
    origin: "*",
  })
);

app.use(express.json());
app.use(express.urlencoded({extended: true}));

app.use("/utilitycollections", utility_collections_router);
app.use("/utilities", utilities_router);

app.get("/", (req, res) => {
  res.send("Hello World!");
});

export default app;
