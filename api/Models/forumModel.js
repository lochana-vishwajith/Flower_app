const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const forumSchema = new Schema({
    question : {
        type: String,
        required: true,
    },
    description : {
        type: String,
        required: true,
    },
    userId : {
        type: String,
        required: false,
    },
    image : [
        {type: String,
        required: false,}
    ]
});

const forumDetails = mongoose.model("forum",forumSchema);
module.exports = forumDetails;