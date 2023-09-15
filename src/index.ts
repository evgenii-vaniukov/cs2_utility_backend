import app from "./server";

const port = 3001;

app.listen(port, () => {
  console.log(`server started at http://localhost:${port}`);
});
