const client = require("../client_pg");
const debug = require("debug")("Meals_DataMapper");
const APIError = require("../../Errors/APIError");


const mealsDataMapper = {

  async getAllMealsByUserID(userId) {

    // A Adapter

    // const query = {
    //   text: `SELECT * FROM "recipes"
    //               WHERE "id" = $1;`,
    //   values: [recipeId],
    // };
    // const results = await client.query(query);
    // if (!results.rowCount) {
    //   throw new APIError("This recipe is still not saved in base.", 404);
    // }
    // return results.rows;
  },



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
