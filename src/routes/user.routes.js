const express = require('express');
const usersController = require('../controllers/user.controller');

// Gestion des erreurs
const handleError = require('../middlewares/handleError');
const routerWrapper = require('../middlewares/routerWrapper');



// Checking user and privegies


// Joi validation compulsary for each payload containing data
const validate = require('../validation/validator');
const { userSchema } = require('../validation/schemas/');


const usersRouter = require('express').Router();

usersRouter
.route('/signup')
.post(validate('body',userSchema),routerWrapper(usersController.postNewUser))



usersRouter.use(handleError);

module.exports = usersRouter;