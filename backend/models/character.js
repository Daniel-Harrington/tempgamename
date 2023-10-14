import { sequelize } from "../datasource";
import { DataTypes } from "sequelize";
import { User } from "./user.js";

export const Character = sequelize.define("Character", {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  level: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  hp: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  mp: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  exp: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  strength: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  dexterity: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  intelligence: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  defense: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  image: {
    type: DataTypes.STRING,
    allowNull: false,
  },
});

Character.belongsTo(User);
User.hasOne(Character);