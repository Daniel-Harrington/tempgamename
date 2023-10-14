import { sequelize } from "../datasource.js";
import { DataTypes } from "sequelize";

export const User = sequelize.define("User", {
  username: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  moneySpent: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  diamonds: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
});
