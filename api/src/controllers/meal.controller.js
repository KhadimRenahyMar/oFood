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

      async addMeals2(req,res){
        debug('appel méthode add meals')

        // const meals ={
        //     user.id: req.params.userId,
        //     startDate:'2022-05-10 06:56:30.513834+00'

        // }

        //pour le test

        const meals ={
            startDate:'2022-05-10 06:56:30.513834+00',
            users_id: 1,
            recipes_id:1
        }

        const result = await mealsDataMapper.postNewMeals(meals);


        res.status(201).json(planning);
        
      },



      

};

module.exports = mealController;

// -Etape 1
// -- -- On récupère toutes les recettes en bdd (getAllRecipes)
// --     SELECT * FROM recipes;


// -- --on filtre toutes celles qui ne font pas parties du régime spécifique du user
// -- --(joindre la table user à la table specific_diet )



// -- --on filtre sur les résultat précédents les recettes qui ont un max_imc <=  à son imc


// -- --Etape 2 (limit avec random)
// -- --Soit on sélectionne les 21 ere recettes (return sous tableau), soit on fait un random de 21


// -- --Etape 3
// -- --on boucle sur 7jours 

// -- --on boucle sur 3 menus 
// --  --On lance insert correspondants aux 3 repas du jour avec la startdate, 



// -- --(attention boucle si ) 
