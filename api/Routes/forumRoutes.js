const router = require("express").Router();
const Forum = require('../Models/forumModel');

router.post('/', (req,res) => {
    const {question, description, image} = req.body;

    const forumcontents = new Forum({
        question, description, image
    });

    forumcontents.save().then(result => {
        res.status(200).send({result});
    }).catch(err => {
        res.status(500).send(err);
    })
}) 

module.exports = router;