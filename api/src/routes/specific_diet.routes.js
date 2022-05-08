const express = require('express');
const specificDietController = require('../controllers/specificDiet.controller');

// Gestion des erreurs
const handleError = require('../middlewares/handleError');
const routerWrapper = require('../middlewares/routerWrapper');


// Joi validation compulsary for each payload containing data
const validate = require('../validation/validator');
//const { xxxxSchema } = require('../validation/schemas');

const specificDietRouter = require('express').Router();

specificDietRouter
//.post('/signup',validate('body',userSchema),routerWrapper(xxxxxController.postNewUser))


specificDietRouter.use(handleError);

module.exports = specificDietRouter;