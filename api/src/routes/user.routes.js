const express = require('express');
const usersController = require('../controllers/user.controller');

// Gestion des erreurs
const handleError = require('../middlewares/handleError');
const routerWrapper = require('../middlewares/routerWrapper');

// Joi validation compulsary for each payload containing data
const validate = require('../validation/validator');
const { userSchema } = require('../validation/schemas/');

const usersRouter = require('express').Router();

usersRouter
  /**
   * Save a new user in database
   * @route POST /users/register
   * @group - Users
   * @param {User}  user- user object credentials
   * @returns {String} 200 - success response
   * @returns {APIError} 404 - fail response
   */
.post('/signup',validate('body',userSchema),routerWrapper(usersController.postNewUser))
  /**
   * Log the user comparing entered credentails with hashed datas in database,
   * then pass usefull infos to the session
   * @route POST /users/login
   * @group - Users
   * @param {User} user - user object credentials
   * @returns {User} 200 - success response
   * @returns {APIError} 404 - fail response
   */
   //.post('/login', validate('body',userSchema), routerWrapper(usersController.logUser))
   .post('/login', validate('body',userSchema), routerWrapper(usersController.logUser))
    /**
   * Disconnect user, suppressing the session.user
   * @route GET /users/logout
   * @group - Users
   * @return {String} 200 - success response
   * @return {APIError} 404 - fail response
   */
   .get('/logout', routerWrapper(usersController.logOutUser))
       /**
   * Return users listing
   * @route GET /users/
   * @group - Users
   * @returns {String} 200 - success response
   * @returns {APIError} 404 - fail response
   */
  .get('/', routerWrapper(usersController.getUsers))


usersRouter.use(handleError);

module.exports = usersRouter;

// const response = await fetch(BASE_URL, {
//   method: 'POST',
//   body: JSON.stringify(userForm),
//   headers: {
//       'Content-Type': 'application/json'
//   }
// });
// if (response.ok) {
//   return response.json();
// } else {
//   throw await response.json();
// }