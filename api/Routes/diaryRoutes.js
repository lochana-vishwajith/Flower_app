const router = require("express").Router();
const diary = require("../Models/diaryModel");

router.post("/", (req, res) => {
  console.log("diary");
  const obj = req.body;

  const newDiary = new diary(obj);

  newDiary
    .save()
    .then((result) => {
      res.status(200).send({ result });
    })
    .catch((err) => {
      res.status(500).send(err);
    });
});

router.get("/", async (req, res) => {
  console.log("diary get");

  await diary
    .find()
    .then((result) => {
      res.status(200).send(result);
    })
    .catch((err) => {
      res.status(500).send(err);
    });
});

router.get("/:id", async (req, res) => {
  const id = req.params.id;

  console.log("diary by id");

  await diary
    .findById({ _id: id })
    .then((result) => {
      res.status(200).send(result);
    })
    .catch((err) => {
      res.status(500).send(err);
    });
});

router.delete("/:id", async (req, res) => {
  const id = req.params.id;

  console.log("diary delete");

  await diary
    .findByIdAndRemove(id)
    .then((result) => {
      res.status(200).send(result);
    })
    .catch((err) => {
      res.status(500).send(err);
    });
});

// router.put("/:id", async (req, res) => {
//   const id = req.params.id;

//   await diary
//     .update(
//       { _id: id },
//       {
//         $set: {
//           description: req.body.description,
//         },
//       }
//     )
//     .then((result) => {
//       res.status(200).send(result);
//     })
//     .catch((err) => {
//       res.status(500).send(err);
//     });
// });

// //

router.put("/:id", async (req, res) => {
  const id = req.params.id;
  const chngedDiary = req.body;
  diary
    .findByIdAndUpdate(id, chngedDiary)
    .then((data) => {
      console.log(data);
      res.status(200).send({ data: data });
    })
    .catch((error) => {
      res.send(error);
    });
});

module.exports = router;
