const router = require("express").Router();
const Flower = require("../Models/FlowerModel");

router.post("/",(req,res)=>{
    const {
        kingdom,
        family,
        genus,
        tribe,
        bloom,
        synonyms,
        description,
        imageURL,
    } = req.body;
 console.log("debug req:",req);
    const flowerDetails = new Flower({
        kingdom,
        family,
        genus,
        tribe,
        bloom,
        synonyms,
        description,
        imageURL,
    });

    flowerDetails.save().then((result)=>{
        res.status(200).send({result});
        console.log(result);
    })
    .catch((err)=>{
        res.send(err);
        console.log(err);
    });
});

router.get("/", async(req,res)=>{
    await Flower.find().then((result)=>{
        res.status(200).send(result);
        console.log(result);
    }).catch((err)=>{
        res.send(err);
        console.log(err);
    });
});

module.exports = router;