import express from "express";
import bcrypt from "bcryptjs";
import { findByUsername } from "../utils/db.js";
import { signToken } from "../utils/jwt.js";

const router = express.Router();

router.post("/login", async (req, res) => {
  const { username, password } = req.body;
  
  // Testi 8: 400 nëse mungon username ose password
  if (!username || !password) {
    return res.status(400).json({ error: "Username and password are required" });
  }

  const user = findByUsername(username);
  
  // Testi 9: 401 nëse username nuk ekziston
  if (!user) {
    return res.status(401).json({ error: "Invalid credentials" });
  }

  const match = await bcrypt.compare(password, user.passwordHash);
  
  // Testi 10: 401 nëse password-i është i gabuar
  if (!match) {
    return res.status(401).json({ error: "Invalid credentials" });
  }

  const token = signToken({
    id: user.id,
    username: user.username,
    role: user.role
  });

  // Testi 11: 200 me token në JSON
  return res.status(200).json({ token });
});

export default router;