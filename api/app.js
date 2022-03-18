const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const mongoose = require("mongoose");
require("dotenv").config();

//IT19152806
const auth = require("./middlewares/auth");
const errors = require("./middlewares/errors");
const unless = require("express-unless");

const app = express();
app.use(cors());
app.use(bodyParser.json());

const PORT = process.env.PORT || 5000;
const url = process.env.MONGO_DB_URL;

mongoose.connect(url, {});
const connection = mongoose.connection;

//IT19152806

// auth.authenticateToken.unless = unless;
// app.use(
//   auth.authenticateToken.unless({
//     path: [
//       { url: "/users/login", methods: ["POST"] },
//       { url: "/users/register", methods: ["POST"] },
//     ],
//   })
// );

app.use(express.json());

const Flower = require("./Routes/FlowerRoute");
app.use("/flower", Flower);

const Forum = require("./Routes/forumRoutes");
app.use("/forum", Forum);

//IT19152806
app.use("/users", require("./Routes/users.routes"));
app.use(errors.errorHandler);

connection.once("open", () => {
  console.log("Mongo DB connected");
});

app.listen(PORT, () => {
  console.log(`Server is runninon on ${PORT}`);
});
