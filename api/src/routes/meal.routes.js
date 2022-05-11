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
  .get('/:userId', routerWrapper(mealController.getAllMealsByUserID)) 

  // temporaire pour test front réception de menus
  .post('/addmeals', routerWrapper(mealController.addMeals))
  
  // Route en phase de dev et test 
  .post('/postnewmeals', routerWrapper(mealController.postNewMeals))




mealRouter.use(handleError);

module.exports = mealRouter;