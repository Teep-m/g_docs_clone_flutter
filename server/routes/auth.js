const express = require("express");
const User = require("../models/user");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, profilePic } = req.body;

    //Check if email already exists
    let user = await User.findOne({ email});

    if(!user) {
      user = new User({
        email,
        profilePic,
        name,
      });
      user = await user.save();
    }

    res.json({user});
  } catch (e) {

  }
});

module.exports = authRouter;