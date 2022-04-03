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
  image : [
    {type: String,
    required: false,}
],
  keyword:{
    type:String
  }
});


const diary = mongoose.model("diaries", diarySchema);
module.exports = diary;
