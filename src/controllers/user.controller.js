const debug = require('debug')('User_Controller');
const usersDataMapper = require('../database/models/users.datamapper');
const APIError = require('../Errors/APIError');

const usersController = {
  async postNewUser(req, res) {

      const user = req.body;
      debug(user);
      const result = await usersDataMapper.createUser(user);
      res.status(201).json(result);

  },


};

module.exports = usersController;

