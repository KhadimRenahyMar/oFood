const client = require("../client_pg");
const debug = require("debug")("Meals_DataMapper");
const APIError = require("../../Errors/APIError");


const mealsDataMapper = {
  async postNewMeals(meals) {

    const query = {
      text: `SELECT * FROM populate_meals($1);`,
      values: [meals],
    };
    await client.query(query);
    
    if(!results.rowCount){
      throw new APIError ("No recipe saved yet", 404);
    };

    debug('fct_sql',results.rows )
    return results.rows;

  },
};


module.exports = mealsDataMapper;
