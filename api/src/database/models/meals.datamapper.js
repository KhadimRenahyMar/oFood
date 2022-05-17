const client = require("../client_pg");
const debug = require("debug")("Meals_DataMapper");
const APIError = require("../../Errors/APIError");


const mealsDataMapper = {

  async getAllMealsByUserID(userId) {

//  SELECT users.id,meals.start_date, json_agg(recipes.*) AS user_recipes
//  FROM "users"
//  join meals on meals.users_id=users.id
//  join recipes on recipes.id = meals.recipes_id
//  where users.id = 1
//  GROUP BY users.id,meals.start_date ;
   
    const query = {
     // text: `SELECT * FROM meals_by_user_id($1);`,

     text:` SELECT users.id,meals.start_date, json_agg(recipes.*) AS user_recipes
     FROM "users"
     join meals on meals.users_id=users.id
     join recipes on recipes.id = meals.recipes_id
     where users.id = $1
     GROUP BY users.id,meals.start_date ;`,

    //  text: `SELECT users.id,meals.start_date,recipes.id,recipes.name,recipes.photo_link,recipes.meal_time,
    //  recipes.max_imc,recipes.type,recipes.steps_desc,recipes.ingredient_desc
    //  FROM public.users
    //  join meals on meals.users_id=users.id
    //  join recipes on recipes.id = meals.recipes_id
    //  where users.id = $1;`,

      values: [userId],
    };


    const results = await client.query(query);

    debug('meals',results )
    if (!results.rowCount) {
      throw new APIError("This user have not meals saved in base.", 404);
    }
    return results.rows;

  },

  
  async postNewMeals(meals) {

    //pour le test fct version 2
    // const query = {
    //   text: `SELECT * FROM populate_meals_v2($1);`,
    //   values: [meals],
    // };

     //pour le test fct version 3
    const query = {
      text: `SELECT * FROM populate_meals_v3($1,$2,$3);`,
      values: [meals.start_date,meals.users_id,meals.recipes_id],
    };


    const results= await client.query(query);
    
    if(!results.rowCount){
      throw new APIError ("No recipe saved yet", 404);
    };

   // debug('fct_sql',results.rows )
    return results.rows;

  },

};


module.exports = mealsDataMapper;
