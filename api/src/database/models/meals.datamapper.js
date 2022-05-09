const client = require("../client_pg");
const debug = require("debug")("Meals_DataMapper");
const APIError = require("../../Errors/APIError");


const mealsDataMapper = {
  async postNewMeals(meals) {
    const query = {
      text: `SELECT New_create_meals($1)`,
      //values: [meals.user_id,meals.startDate, meals.nbrRepas],
      values: [meals.user_id],
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
