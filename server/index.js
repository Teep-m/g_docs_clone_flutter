const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");

const PORT = process.env.PORT | 3001;

const app = express();

app.use(express.json());
app.use(authRouter);

const DB = "mongodb+srv://tetsu:13silvia@cluster0.1x5pyca.mongodb.net/?retryWrites=true&w=majority";


mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection successful");
  })
  .catch((err) => {
    console.log(err);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
