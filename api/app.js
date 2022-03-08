const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mongoose = require('mongoose');
require('dotenv').config();

const app = express();
app.use(cors());
app.use(bodyParser.json());

const PORT = process.env.PORT || 5000;
const url = process.env.MONGO_DB_URL;

mongoose.connect(url, {});
const connection = mongoose.connection;

connection.once("open", () => {
    console.log("Mongo DB connected");
});

app.listen(PORT, () => {
    console.log(`Server is runninon on ${PORT}`);
});