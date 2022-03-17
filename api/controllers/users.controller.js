const bcryptjs = require("bcryptjs");
const userService = require("../services/users.services");

exports.register = (req, res, next) => {
  const { password } = req.body;
  const salt = bcryptjs.genSaltSync(10);

  req.body.password = bcryptjs.hashSync(password, salt);

  userService.register(req.body, (error, result) => {
    if (error) {
      return next(error);
    }
    return res.status(200).send({
      message: "Success",
      data: result,
    });
  });
};

exports.login = (req, res, next) => {
  const { username, password } = req.body;

  userService.login({ username, password }, (error, result) => {
    if (error) {
      return next(error);
    }
    return res.status(200).send({
      message: "Success",
      data: result,
    });
  });
};

exports.userProfile = (req, res, next) => {
  return res.status(200).json({ message: "Authorized User!" });
};

exports.delete = (req, res, next) => {
  const id = req.body.id;
  userService.deleteUser(id, (error, result) => {
    if (error) {
      return next(error);
    }
    return res.status(200).send({
      message: "Deleted Sucessfully",
      data: result,
    });
  });
};

exports.update = (req, res, next) => {
  // const id = req.body.id;
  // const username = req.body.username;
  const { id, username, bio, mobile } = req.body;

  userService.updateUser({ id, username, bio, mobile }, (error, result) => {
    if (error) {
      return next(error);
    }
    return res.status(200).send({
      message: "Updated Sucessfully",
      data: result,
    });
  });
};
