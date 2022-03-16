const router = require("express").Router();
const Flower = require("../Models/FlowerModel");

router.post("/",(req,res)=>{
    const {
        kingdom,
        family,
        genus,
        tribe,
        bloom,
        description,
        imageURL,
    } = req.body;

    const flowerDetails = new Flower({
        kingdom,
        family,
        genus,
        tribe,
        bloom,
        description,
        imageURL,
    });

    flowerDetails.save().then((result)=>{
        res.status(200).send({result});
    })
    .catch((err)=>{
        res.send(err);
    });
});

router.get("/", async(req,res)=>{
    await Flower.find().then((result)=>{
        res.status(200).send(result);
    }).catch((err)=>{
        res.send(err);
    });
});

router.get('/:id', async (req,res) => {
    const id = req.params.id;

    await Flower.findById({_id: id}).then(result => {
        res.status(200).send(result);
    }).catch(err =>{
        res.status(500).send(err);
    })
})

router.delete('/:id', async (req,res) => {
    const id = req.params.id;

    await Flower.findByIdAndRemove(id).then(result => {
        res.status(200).send(result);
    }).catch(err =>{
        res.status(500).send(err);
    })
})

router.put('/:id',async (req,res) => {
    const id = req.params.id;

    await Flower.updateOne({_id: id},{
        $set: {
            kingdom:req.body.kingdom,
            family:req.body.family,
            genus:req.body.genus,
            tribe:req.body.tribe,
            bloom:req.body.bloom,
            description:req.body.description,
            imageURL:req.body.imageURL,
        }
    }).then(result => {
        res.status(200).send(result);
    }).catch(err => {
        res.status(500).send(err);
    })
});



module.exports = router;