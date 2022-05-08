const client = require("../client_pg");
const debug = require("debug")("Meals_DataMapper");
const APIError = require("../../Errors/APIError");


const mealsDataMapper = {
  async postNewMeals(meals) {
    const query = {
      text: `INSERT INTO adds_new_meals($1,$2)`,
      values: [meals.startDate, meals.nbrRepas],
    };
    await client.query(query);
    return `The meals ${meals.nbrRepas} has been saved into database`;
  },
};


module.exports = mealsDataMapper;
