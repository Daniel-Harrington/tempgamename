import express from "express";
import bodyParser from "body-parser";
import { sequelize } from "./datasource.js";
import session from "express-session";
import { userRouter } from "./routers/user_router.js";
import { characterRouter } from "./routers/character_router.js";
import { inventoryRouter } from "./routers/inventory_router.js";
import { itemRouter } from "./routers/item_router.js";


export const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(
  session({
    secret: "very secure secret",
    resave: false,
    saveUninitialized: false,
  })
);

try {
  await sequelize.authenticate();

  await sequelize.sync({ alter: { drop: false } });
  console.log("Connection has been established successfully.");
} catch (error) {
  console.error("Unable to connect to the database:", error);
}

app.use(function (req, res, next) {
  console.log("HTTP request", req.method, req.url, req.body);
  next();
});

app.use("/api/characters", characterRouter);
app.use("/api/inventorys", inventoryRouter);
app.use("/api/users", userRouter);
app.use("/api/items", itemRouter);

const PORT = 3000;

app.listen(PORT, (err) => {
  if (err) console.log(err);
  else console.log("HTTP server on http://localhost:%s", PORT);
});