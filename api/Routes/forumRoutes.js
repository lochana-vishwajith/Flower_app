const router = require("express").Router();
const Forum = require('../Models/forumModel');

router.post('/', (req,res) => {
    console.log("forum post");
    const {question, description, image} = req.body;

    const forumcontents = new Forum({
        question, description, image
    });

    forumcontents.save().then(result => {
        res.status(200).send({result});
    }).catch(err => {
        res.status(500).send(err);
    })
});

router.get('/', async (req,res) => {
    console.log("forum get");

    await Forum.find().then(result => {
        res.status(200).send(result);
    }).catch(err =>{
        res.status(500).send(err);
    })
});

router.get('/:id', async (req,res) => {
    const id = req.params.id;

    console.log("forum get by id");

    await Forum.findById({_id:id}).then(result => {
        res.status(200).send(result);
    }).catch(err =>{
        res.status(500).send(err);
    })
});

router.delete('/:id', async (req,res) => {
    const id = req.params.id;

    console.log("forum delete");

    await Forum.findByIdAndRemove(id).then(result => {
        res.status(200).send(result);
    }).catch(err =>{
        res.status(500).send(err);
    })
});

router.get('/userId/:id',async (req,res) => {
    const userId = req.params.id;

    await Forum.find({userId: userId}).then(result => {

        res.status(200).send(result);
    }).catch(err => {
        res.status(500).send(err);
    })
});

router.put('/:id',(req,res) => {
    const id = req.params.id;

    await Forum.update({_id: id},{
        $set: {
            question: req.body.question,
            description: req.body.description
        }
    }).then(result => {
        res.status(200).send(result);
    }).catch(err => {
        res.status(500).send(err);
    })
});

module.exports = router;