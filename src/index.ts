import config from "./config/";
import app from "./server";

app.listen(config.port, () => {
  console.log(`server started at http://localhost:${config.port}`);
});
