const debug = require('debug')('User_Controller');
const usersDataMapper = require('../database/models/users.datamapper');
const specificsDietDataMapper = require('../database/models/specificsDiet.datamapper');
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
                          profil_is_completed:result.profil_is_completed,
                          token: jwt.sign(
                            {userId:result.id},       
                            'RANDOM_TOKEN_SECRET',  
                            {expiresIn:'60s'})
                          }      

    debug('User récupéré en BDD :', result)
    req.login(result);

    // A réactiver pour gestion token par cookie ne pas oublier de commenter la ligne 54
    // res.status(200).json(result);
    
    //debug('returnedUser:', returnedUser)
    //temporaire pour gestion token par header sur authorization
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

  async updateProfilByUserId(req,res){
    const _id = req.params.id
    const Obj_UpdateUser = req.body

    const user ={
      id : req.params.id,
      firstname:Obj_UpdateUser.firstname,
      lastname:Obj_UpdateUser.lastname,
      sex:Obj_UpdateUser.sex,
      height:Obj_UpdateUser.height,
      weight:Obj_UpdateUser.weight,
      imc:Obj_UpdateUser.imc,
      profil_is_completed:true,
      intolerances:Obj_UpdateUser.intolerances
    }

    //En attendant de coder un fct (qui s'occupe du traitement du régime spé  avec sa création si il n'existe pas puis remplissage de la table pivot), on détruit les enregistrements de la table pivot pour ce user 
    const result_delete_SpecificDiet_Of_userID = await specificsDietDataMapper.deleteSpecificDietByUserID(user.id)

    //On reconstruit les liens sur la table pivot
    await specificsDietDataMapper.postNewSpecificDiet_Of_userID(user)
    
    const results_SpecificDiet_Of_userID = await specificsDietDataMapper.getSpecificDietByUserID(user.id)

    //on met à jour les autres infos du user
    const result_UpdateUserId = await usersDataMapper.findUserPerIdAndUpdate(user);

    const returnedUser = {
      id:result_UpdateUserId.id, 
      email: result_UpdateUserId.email,
      profil_is_completed:result_UpdateUserId.profil_is_completed
      }      

    res.status(200).json(returnedUser);

  }


};

module.exports = usersController;

