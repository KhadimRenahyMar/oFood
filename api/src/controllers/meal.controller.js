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

      // pour test à refactoriser sur la même fonction en passant un type

      let recipes_temp = [];

      for (let i = 0; i < 21; i++) {
        recipes_temp.push(0)
      }

      const recipes_type_0_for_user = await recipesDataMapper.getRecipes_With_ImcMax_and_Specific_diet_for_user_type_0(profil_user);

      debug('recipes_type_0_for_user',recipes_type_0_for_user )

      if (!recipes_type_0_for_user == 0) {

        let first_time = true 
        
        for (let i = 0; i < recipes_temp.length; i++) {
          
           if (first_time) {
            
            if (recipes_type_0_for_user[0] !== undefined) {
              recipes_temp[0] = recipes_type_0_for_user[0].id
            }

            first_time= false;

            continue;

           }

          if (recipes_type_0_for_user[i] !== undefined) {
            recipes_temp[i+3] = recipes_type_0_for_user[i].id;

          }
          
        }
      }

      debug('recipes_temp apres recherche petit dej',recipes_temp )

      const recipes_type_2_for_user = await recipesDataMapper.getRecipes_With_ImcMax_and_Specific_diet_for_user_type_1_2(profil_user);

      debug('recipes_type_2_for_user',recipes_type_2_for_user )

      if (!recipes_type_2_for_user == 0) {

        let first_time = true 

        for (let i = 0; i < recipes_temp.length; i+=2) {
  
          if (first_time) {
      
            if (recipes_type_2_for_user[1] !== undefined) {
              recipes_temp[1] = recipes_type_2_for_user[1].id;
            }
            
            first_time= false;
            
            continue;
            
          }
          
          if (recipes_type_2_for_user[i] !== undefined) {
            recipes_temp[i+1] = recipes_type_2_for_user[i].id;
          }

        }
      }

      debug('recipes_temp apres recherche type 1 ou 2',recipes_temp )

     //res.status(201).json('recipes_for_user');

      //on construit l'objet meals et on le passe à postNewMeals, (la 1er du 3 grp de 3 doit être 0 ) 

      // en post http://localhost:3001/api/meals/1/postnewmeals
      const meals_v3 ={
        start_date:'2022-05-10 06:56:30.513834+00',
        users_id: req.params.userId,
        recipes_id:[0,1,2,4,7,8,9,15,20,17,34,14,24,4,7,8,9,15,20,17,34,27]}

      // const meals_v3 ={
      //   start_date:'2022-05-10 06:56:30.513834+00',
      //   users_id: req.params.userId,
      //   recipes_id: recipes_temp }
    
      const result = await mealsDataMapper.postNewMeals(meals_v3);

      res.status(201).json(result);
        

      },


};

module.exports = mealController;


