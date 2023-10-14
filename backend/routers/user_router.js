import { Router } from "express";
import { User } from "../models/user.js";
import { isAuthenticated } from "../middleware/auth.js";
import bcrypt from "bcrypt";

export const userRouter = Router();

userRouter.get("/", (req, res) => {
  return res.json("Hello World!");
});

//attempts to create and save user to database
userRouter.post("/signup", async (req, res) => {
  const plaintextPassword = req.body.password;
  const salt = await bcrypt.genSalt(10);
  const hashedPassword = await bcrypt.hash(plaintextPassword, salt);
  const existing = await User.findOne({
    where: {
      username: req.body.username,
    },
  });

  if (existing) {
    return res.status(422).json({ error: "Username already taken" });
  }
  const user = new User({
    username: req.body.username,
    password: hashedPassword,
    moneySpent: 0.00,
    diamonds: 0,
  });

  try {
    await user.save();
  } catch (err) {
    return res.status(422).json(err);
  }

  return res.json({ message: "Signup successful" });
});

userRouter.post("/login", async (req, res) => {
  const user = await User.findOne({
    where: {
      username: req.body.username,
    },
  });

  if (!user) {
    return res.status(404).json({ error: "Credentials not found" });
  }

  if (!bcrypt.compareSync(req.body.password, user.password)) {
    return res.status(401).json({ error: "Incorrect Password" });
  }

  if(user.id == req.session.userId){
    return res.status(401).json({ error: "Already logged in" });
  }

  //stores the userId in the session cookie.
  req.session.userId = user.id;
  return res.json({ message: "Login successful" });
});

//attempts to logout the user
userRouter.post("/logout", isAuthenticated, (req, res) => {
  //Destroy the session
  req.session.destroy((err) => {
    if (err) {
      console.log("Error destroying session:", err);
    }
    return res.json({ message: "Logout successful" });
  });
});

//attempts to get the current user
userRouter.get("/getMe", isAuthenticated, async (req, res) => {
  const user = await User.findOne({
    where: {
      id: req.session.userId,
    },
  });
  if (!user) {
    return res.status(404).json({ error: "User not found" });
  }

  return res.json(user);
});

//attempts to get a user by id
userRouter.get("/id=:id", isAuthenticated, async (req, res) => {
  const user = await User.findOne({
    where: {
      id: req.params.id,
    },
  });
  if (!user) {
    return res.status(404).json({ error: "User not found" });
  }

  return res.json(user);
});