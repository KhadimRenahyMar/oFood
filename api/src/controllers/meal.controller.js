const debug = require('debug')('Meal_Controller');
const mealsDataMapper = require('../database/models/meals.datamapper');
const recipesDataMapper = require('../database/models/recipes.datamapper');

const APIError = require('../Errors/APIError');

const mealController = {

    async addMeals(req,res){
        debug('appel méthode add meals')

       const planning =[]
       const result = await recipesDataMapper.get21Recipes();

       for (const repas of result) {

           
           planning.push ({  
               startDate :'2022-05-10 06:56:30.513834+00',
               repas_id:repas.id,
               repas: repas
               
            })
            
        }
        
        debug('planning',planning ) 

        res.status(201).json(planning);
      },


      

};

module.exports = mealController;