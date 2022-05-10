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
  .post('/addmeals', routerWrapper(mealController.addMeals))

mealRouter.use(handleError);

module.exports = mealRouter;