const debug = require('debug')('User_Controller');
const usersDataMapper = require('../database/models/users.datamapper');
const APIError = require('../Errors/APIError');

const usersController = {
  async postNewUser(req, res) {

      //debug(req.body);
      const user = await usersDataMapper.createUser(req.body);
      //debug(user)
      req.login(user);
      debug(user)
      res.status(201).json(user);
  },

  /**
   * Passes the pseudo and authorization level to the session
   * @param {*} req 
   * @param {*} res 
   * @returns {user Object} in json format
   */
   async logUser(req, res) {
    const user = req.body;
    //const result = await usersDataMapper.findUserPerEmail(user);
    //const returnedUser = {email: result.email, is_admin_role: result.is_admin_role};
    const result = await usersDataMapper.findUserPerEmail(user);
    const returnedUser = {email: result.email, is_admin_role: result.is_admin_role};

    req.login(returnedUser);
    res.status(200).json(returnedUser);

  },

  logOutUser(req, res) {

    if(!req.user){
      throw new APIError('You are not logged.')
    };
    req.logout();
    res.status(200).json('You have successfuly logged out.');
  },
  
  async getUsers(_,res) {
    const results = await usersDataMapper.GetUsers();
    res.status(200).json(results);
  },


};

module.exports = usersController;

