const debug = require('debug')('User_Controller');
const usersDataMapper = require('../database/models/users.datamapper');
const APIError = require('../Errors/APIError');

//temporaire
const jwt=require('jsonwebtoken')


const usersController = {
  async postNewUser(req, res) {

      //debug(req.body);
      const user = await usersDataMapper.createUser(req.body);
      debug('User retourné après ajout en bdd :',user)
      //const returnedUser = {email: user.email, is_admin_role: user.is_admin_role};
      const returnedUser = {id: user.id};
      debug('User passé à la fonction req.login :',user)

      req.login(user);

    
     // debug(user)
     res.status(201).json(user);

  },

  /**
   * Passes the pseudo and authorization level to the session
   * @param {*} req 
   * @param {*} res 
   * @returns {user Object} in json format
   */
   async logUser(req, res) {
  
    //Ici 2 cas 
    const user = req.body
    const result = await usersDataMapper.findUserPerEmail(user);
    const returnedUser = {
                          id:result.id, 
                          email: result.email, 
                          token: jwt.sign(
                            {userId:user._id},       
                            'RANDOM_TOKEN_SECRET',  
                            {expiresIn:'24h'})
                          }      

    debug('User récupéré en BDD :', result)
    req.login(result);

    // res.status(200).json(result);
    
    //temporaire
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

