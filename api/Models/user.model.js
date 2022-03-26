const mongoose = require("mongoose");
const unipueValidator = require("mongoose-unique-validator");

const userSchema = new mongoose.Schema({
  username: {
    type: String,
    required: true,
    unique: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  password: {
    type: String,
    required: true,
  },
  date: {
    type: Date,
    default: Date.now(),
  },
  bio: {
    type: String,
    required: false,
    default: "No Bio",
  },
  mobile: {
    type: String,
    required: false,
    default: "No Number",
  },
  myposts: [
    { type: mongoose.Schema.Types.ObjectId, required: false, ref: "forums" },
  ],
  mydiaries: [
    { type: mongoose.Schema.Types.ObjectId, required: false, ref: "diaries" },
  ],
});

userSchema.set("toJSON", {
  transform: (document, returnedObject) => {
    returnedObject.id = returnedObject._id.toString();
    delete returnedObject._id;
    delete returnedObject.__v;
    delete returnedObject.password;
  },
});

//userSchema.plugin(unipueValidator, { message: "Email already in use" });

const User = mongoose.model("user", userSchema);
module.exports = User;
