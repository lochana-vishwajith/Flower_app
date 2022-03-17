const User = require("../Models/user.model");
const bcrypt = require("bcryptjs");
const auth = require("../middlewares/auth");

async function login({ username, password }, callback) {
  const user = await User.findOne({ username });

  if (user != null) {
    if (bcrypt.compareSync(password, user.password)) {
      const token = auth.generateAccessToken(username);
      return callback(null, { ...user.toJSON(), token });
    } else {
      return callback({
        message: "Invalid Username/Password!",
      });
    }
  } else {
    return callback({
      message: "Invalid Username/Password!",
    });
  }
}

async function register(params, callback) {
  if (params.username === undefined) {
    return callback({ message: "Username Requied" });
  }

  const user = new User(params);
  user
    .save()
    .then((response) => {
      return callback(null, response);
    })
    .catch((error) => {
      return callback(error);
    });
}

async function deleteUser(params, callback) {
  const user = await User.findById(params);
  const a1 = await user
    .remove()
    .then((response) => {
      return callback(null, response);
    })
    .catch((error) => {
      return callback(error);
    });
}

async function updateUser({ id, username, bio, mobile }, callback) {
  const user = await User.findById(id);
  try {
    user.username = username ? username : user.username;
    user.bio = bio ? bio : user.bio;
    user.mobile = mobile ? mobile : user.mobile;

    const u1 = await user
      .save()
      .then((response) => {
        return callback(null, response);
      })
      .catch((error) => {
        return callback(error);
      });
  } catch (e) {
    console.log(e);
  }
}

module.exports = {
  login,
  register,
  deleteUser,
  updateUser,
};
