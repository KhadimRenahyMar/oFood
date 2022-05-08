const debug = require('debug')('Meal_Controller');
const mealsDataMapper = require('../database/models/meals.datamapper');
const APIError = require('../Errors/APIError');

const mealController = {

    async addNewMeals(req,res){

        const meals = {
            startDate : req.body,
            nbrRepas: 21
        }

        const result = await mealsDataMapper.postNewMeals(meals);
        res.status(201).json(result);
      },


};

module.exports = mealController;