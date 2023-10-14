import { Router } from "express";

export const userRouter = Router();

userRouter.get("/", (req, res) => {
  return res.json("Hello World!");
});