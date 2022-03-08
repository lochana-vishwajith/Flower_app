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

module.exports = router;