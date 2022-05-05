const client = require('../client_pg');
const debug = require('debug')("User_DataMapper");
const APIError = require('../../Errors/APIError');

const bcrypt = require('bcrypt');

const usersDataMapper = {

  async createUser(user) {

      debug(user);

      let {email, password} = user;
      const salt = await bcrypt.genSalt(10);
      const encryptedPassword = await bcrypt.hash(password,salt);
      //const encryptedPassword = password
      const query = {
        text : `INSERT INTO "users"(email, password) VALUES ($1,$2)`,
        values:[email,encryptedPassword],
      };
      const results = await client.query(query);
      debug(results.rows);
      if(!results.rowCount){
        throw new APIError ("This email is already taken. Please choose another one.", 404);
      };
      return 'User successfully registered, please login to continue.';
  
  },
  
  async findUserPerEmail(user) {
    const query = {
      text : `SELECT email, is_admin_role, password FROM "users"
              WHERE email = $1`,
      values:[user.email],
    }
    const results = await client.query(query);
    if(!results.rowCount){
      throw new APIError ("This account doesn't exist.", 404);
    };
    const isCorrect = await bcrypt.compare(user.password,results.rows[0].password);
    if(!isCorrect){
      throw new APIError("Credentials don't match, please retry.",404);
    }
    return results.rows[0];
  },

  findUserPerId(id){



  },

  /**
   * Return a list containing all registered users
   * @returns {ARRAY} of pseudos String
   * @throws {APIError} if the table user is empty
   */
   async GetUsers(){
    const query = `SELECT * FROM "users";`;
    const results = await client.query(query);

    debug(results.rows)
    if(!results.rowCount){
      throw new APIError ("No user in BDD.", 404);
    };
    return results.rows;
  },

};

module.exports = usersDataMapper;