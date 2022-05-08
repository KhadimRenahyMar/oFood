const debug = require('debug')('Recipe_Controller');
const recipesDataMapper = require('../database/models/recipes.datamapper');
const APIError = require('../Errors/APIError');

const recipeController = {

    async getAllRecipes(_, res) {
        const result = await recipesDataMapper.getAllRecipes();
        res.status(200).json(result);
      },
      async getRecipInfosByID(req, res) {
        const recipeId = req.params.recipeId;
        const result = await recipesDataMapper.getRecipeInfosById(recipeId);
        res.status(200).json(result);
      },
      async addNewRecipe(req,res){
        const recipe = req.body;
        const result = await recipesDataMapper.postNewRecipe(recipe);
        res.status(201).json(result);
      },

};

module.exports = recipeController;