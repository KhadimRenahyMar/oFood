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

    const query = {
      text: `SELECT * FROM populate_meals($1);`,
      values: [meals],
    };
    const results= await client.query(query);
    
    if(!results.rowCount){
      throw new APIError ("No recipe saved yet", 404);
    };

    debug('fct_sql',results.rows )
    return results.rows;

  },
};

// -Etape 1
// -- -- On récupère toutes les recettes en bdd (getAllRecipes)
// --     SELECT * FROM recipes;


// -- --on filtre toutes celles qui ne font pas parties du régime spécifique du user
// -- --(joindre la table user à la table specific_diet )



// -- --on filtre sur les résultat précédents les recettes qui ont un max_imc <=  à son imc


// -- --Etape 2 (limit avec random)
// -- --Soit on sélectionne les 21 ere recettes (return sous tableau), soit on fait un random de 21


// -- --Etape 3
// -- --on boucle sur 7jours 

// -- --on boucle sur 3 menus 
// --  --On lance insert correspondants aux 3 repas du jour avec la startdate, 


// -- --(attention boucle si ) 



module.exports = mealsDataMapper;
