import merge from "lodash.merge";

process.env.NODE_ENV = process.env.NODE_ENV || "development";

const stage = process.env.STAGE || "local";
let envConfig;

switch (stage) {
  case "local":
    envConfig = require("./local").default;
    break;
  case "development":
    envConfig = require("./development").default;
    break;
  case "production":
    envConfig = require("./production").default;
    break;
  default:
    envConfig = require("./local").default;
}

const defaultConfig = {
  stage,
  env: process.env.NODE_ENV,
  port: process.env.PORT || 3001,
  secrets: {
    dbUrl: process.env.DATABASE_URL,
  },
};

export default merge(defaultConfig, envConfig);
