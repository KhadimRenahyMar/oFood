const express = require('express');
const mealController = require('../controllers/meal.controller');

// Gestion des erreurs
const handleError = require('../middlewares/handleError');
const routerWrapper = require('../middlewares/routerWrapper');


// Joi validation compulsary for each payload containing data
const validate = require('../validation/validator');
//const { xxxxSchema } = require('../validation/schemas');

const mealRouter = require('express').Router();

 mealRouter
//  .get('/', routerWrapper(recipeController.getAllRecipes))
//  .get('/:recipeId', routerWrapper(recipeController.getRecipInfosByID)) 
//.post('/newrecipe/:user_id', validate('body', recipeSchema), routerWrapper(recipeController.addNewRecipe))
  .post('/newmeals', routerWrapper(mealController.addNewMeals))

mealRouter.use(handleError);

module.exports = mealRouter;