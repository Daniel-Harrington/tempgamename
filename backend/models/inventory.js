import { sequelize } from "../datasource";
import { DataTypes } from "sequelize";
import { Item } from "./item.js";
import { Character } from "./character";

export const Inventory = sequelize.define("Inventory", {
});

Inventory.belongsTo(Character);
Character.hasOne(Inventory);