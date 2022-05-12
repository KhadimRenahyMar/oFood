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

      
      async postNewMeals(req,res){
        debug('appel méthode post new meals')

        // const meals ={
        //     user.id: req.params.userId,
        //     startDate:'2022-05-10 06:56:30.513834+00'
        // }

        //pour le test fct version 1
        const meals ={
            start_date:'2022-05-10 06:56:30.513834+00',
            users_id: req.params.userId,
            recipes_id:1
        }

      // pour le test fct version 2

      // Etape 1 & 2 en même tps
      // On récupère toutes les recettes en bdd (getAllRecipes)
      //Etape 2
      // on filtre toutes celles qui ne font pas parties du régime spécifique du user

      // On fait Etape 1 & 2 & 3en même tps
      // on selectionne toutes les recettes en BDD qui font parties du regime spécifique du user
      // qui ont un max_imc <=  à son imc

      // Etape 4 (limit avec random)
      // Soit on sélectionne les 21 ere recettes (return sous tableau), soit on fait un random de 21
      const profil_user ={
        users_id: 1,
      }

     //  const result = await recipesDataMapper.getRecipes_With_ImcMax_and_Specific_diet_for_user(profil_user);


      //on construit l'objet meals et on le passe à postNewMeals, (la 1er du 3 grp de 3 doit être 0 ) 
      const meals_v2 ={
        start_date:'2022-05-10 06:56:30.513834+00',
        users_id: req.params.userId,
        recipes_id:[0,1,2,4,7,8,9,15,20,17,34,14,24,4,7,8,9,15,20,17,34,27]}
    
        const result = await mealsDataMapper.postNewMeals(meals_v2);

        res.status(201).json(result);
        
      },


};

module.exports = mealController;


