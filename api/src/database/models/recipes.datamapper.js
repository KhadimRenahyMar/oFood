const client = require("../client_pg");
const debug = require("debug")("Recipes_DataMapper");
const APIError = require("../../Errors/APIError");

const recipesDataMapper = {
  async getAllRecipes() {
    const query = "SELECT * FROM recipes;";
    const results = await client.query(query);
    if (!results.rowCount) {
      throw new APIError("No recipe saved yet", 404);
    }
    return results.rows;
  },

  async get21Recipes(type) {
    //methode test 1
    //const query = `SELECT * FROM recipes ORDER BY RANDOM() LIMIT 21;`

    //methode front
    const query = {
      text: `SELECT * FROM "recipes"
             WHERE type=$1
             ORDER BY RANDOM() LIMIT 21;`,
      values: [type],
    };
    const results = await client.query(query);
    if (!results.rowCount) {
      throw new APIError("No recipe saved yet", 404);
    }
    return results.rows;
  },

  async getRecipeById(recipeId) {

    debug('recipeId depuis datamapper',recipeId )
    const query = {
      text: `SELECT * FROM "recipes"
                  WHERE "id" = $1;`,
      values: [recipeId],
    };
    const results = await client.query(query);
    if (!results.rowCount) {
      throw new APIError("This recipe is still not saved in base.", 404);
    }
    return results.rows[0];
  },

  async getRecipes_With_ImcMax_and_Specific_diet_for_user_type_0(usersId){

      const query = {
      text: `SELECT
             users.id,
             recipes.id
             FROM public.users
             join users_choose_specific_diet on users_choose_specific_diet.users_id=users.id
             join specific_diet on specific_diet.id=users_choose_specific_diet.specific_diet_id
             join specific_diet_has_recipes on specific_diet_has_recipes.specific_diet_id=specific_diet.id
             join recipes on recipes.id = specific_diet_has_recipes.recipes_id
             where users.id = $1 and users.imc<=recipes.max_imc and recipes.type =0
             ORDER BY RANDOM() LIMIT 21;`,
             
        values: [usersId],
      };

      const results = await client.query(query);
      
    //si on a pas de recettes qui correspondent au petit dej on retourne 0
      if (!results.rowCount) {
        return 0;
      }

      return results.rows;

  },

  async getRecipes_With_ImcMax_and_Specific_diet_for_user_type_1_2(usersId){

    const query = {
    text: `SELECT
           users.id,
           recipes.id
           FROM public.users
           join users_choose_specific_diet on users_choose_specific_diet.users_id=users.id
           join specific_diet on specific_diet.id=users_choose_specific_diet.specific_diet_id
           join specific_diet_has_recipes on specific_diet_has_recipes.specific_diet_id=specific_diet.id
           join recipes on recipes.id = specific_diet_has_recipes.recipes_id
           where users.id = $1 and users.imc<=recipes.max_imc and  ( recipes.type =1 or recipes.type =2)
           ORDER BY RANDOM() LIMIT 21;`,
           
      values: [usersId],
    };

    const results = await client.query(query);

    //si on a pas de recettes qui correspondent on retourne 0
    if (!results.rowCount) {
        return 0;
    }

    return results.rows;

},



  async postNewRecipe(recipe) {
    const query = {
      text: `INSERT INTO "recipes"("name","photo_link", "meal_time", "max_imc","type", "steps_desc","ingredient_desc") VALUES ($1,$2,$3,$4,$5,$5,$6,$7);`,
      values: [
        recipe.name,
        recipe.photo_link,
        recipe.meal_time,
        recipe.max_imc,
        recipe.type,
        recipe.steps_desc,
        recipe.ingredient_desc,
      ],
    };
    await client.query(query);
    return "The recipe has been saved into database";
  },

  async recipesBy_IntolerancesAnd_Imc(userId,typeRecipes) {
    const query = {
      text: `SELECT * FROM recipesBy_IntolerancesAnd_Imc($1,$2);`,
      values: [userId,typeRecipes],
    };

    const results = await client.query(query);
    
    if(!results.rowCount){
      throw new APIError ("No recipe saved yet", 404);
    };

    debug('fct_sql_recipesBy_IntolerancesAnd_Imc',results.rows)

    return results.rows;
  },



};

module.exports = recipesDataMapper;
