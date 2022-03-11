const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const flowerSchema = new Schema({
    kingdom:{
        type: String,
        required: true,
    },
    family:{
        type: String,
        required: true,
    },
    genus:{
        type: String,
        required: true,
    },
    tribe:{
        type: String,
        required: true,
    },
    bloom:{
        type: String,
        required: true,
    },
    synonyms:{
        type: String,
        required: true,
    },
    description:{
        type: String,
        required: true,
    },
    imageURL:{
        type: String,
        required: false,
    },
});

const flowerDetails = mongoose.model("flowers",flowerSchema);

module.exports = flowerDetails;