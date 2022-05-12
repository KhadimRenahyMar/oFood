const debug = require('debug')('Meal_Controller');
const mealsDataMapper = require('../database/models/meals.datamapper');
const recipesDataMapper = require('../database/models/recipes.datamapper');

const APIError = require('../Errors/APIError');

const mealController = {
  
  
    async getAllMealsByUserID(req, res) {
        const userId = req.params.userId;
        const result = await mealsDataMapper.getAllMealsByUserID(userId);
        res.status(200).json(result);
      },

    // Methode pour phase de test
    async addMeals(req,res){
        debug('appel méthode add meals')
        const type = 2;
        const result = await recipesDataMapper.get21Recipes(type);

          //methode test 1
          //const planning =[]

          //  for (const repas of result) {

          //      planning.push ({  
          //          startDate :'2022-05-10 06:56:30.513834+00',
          //          repas_id:repas.id,
          //          repas: repas
          //       })
          //   }
          //   debug('planning',planning ) 
          //res.status(201).json(planning);


       //methode front

        res.status(201).json(result);

      },


      //
      async postNewMeals(req,res){
        debug('appel méthode post new meals')

        // const meals ={
        //     user.id: req.params.userId,
        //     startDate:'2022-05-10 06:56:30.513834+00'
        // }

        //pour le test
        const meals ={
            start_date:'2022-05-10 06:56:30.513834+00',
            users_id: req.params.userId,
            recipes_id:1
        }

        const result = await mealsDataMapper.postNewMeals(meals);

        res.status(201).json(result);
        
      },


};

module.exports = mealController;


