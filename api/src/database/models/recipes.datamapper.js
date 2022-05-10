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

  async get21Recipes() {
    const query = `SELECT * FROM recipes ORDER BY RANDOM() LIMIT 21;`
    const results = await client.query(query);
    if (!results.rowCount) {
      throw new APIError("No recipe saved yet", 404);
    }
    return results.rows;
  },

  async getRecipeInfosById(recipeId) {
    const query = {
      text: `SELECT * FROM "recipes"
                  WHERE "id" = $1;`,
      values: [recipeId],
    };
    const results = await client.query(query);
    if (!results.rowCount) {
      throw new APIError("This recipe is still not saved in base.", 404);
    }
    return results.rows;
  },

  async postNewRecipe(recipe) {
    const query = {
      text: `INSERT INTO "recipes"(photo_link, meal_time, max_imc, steps_desc,) VALUES ($1,$2,$3,$4,$5)`,
      values: [
        recipe.photo_link,
        recipe.meal_time,
        recipe.max_imc,
        recipe.steps_desc,
        recipe.ingredient_desc,
      ],
    };
    await client.query(query);
    return "The recipe has been saved into database";
  },
};

module.exports = recipesDataMapper;
