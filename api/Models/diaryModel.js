const mongoose = require("mongoose");

const diarySchema = new mongoose.Schema({
  title: {
    type: String,
  },
  description: {
    type: String,
  },
  date: {
    type: Date,
    default: Date.now(),
  },
  image: [{ type: String, required: false }],
  keyword: {
    type: String,
  },
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "user",
    required: true,
  },
});

const diary = mongoose.model("diaries", diarySchema);
module.exports = diary;
