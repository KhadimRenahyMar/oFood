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

      // pour le test fct version 2
      // On fait Etape 1 & 2 & 3en même tps
      // on selectionne toutes les recettes en BDD qui font parties du regime spécifique du user
      // qui ont un max_imc <=  à son imc par type 
      // Etape 4 (limit avec random)
      // Soit on sélectionne les 21 ere recettes (return sous tableau), soit on fait un random de 21

      let recipes_temp = [];

      for (let i = 0; i < 21; i++) {
        recipes_temp.push(0)
      }

      const recipes_type_0_for_user = await recipesDataMapper.getRecipes_With_ImcMax_and_Specific_diet_for_user_type_0(req.params.userId);

      //debug('recipes_type_0_for_user',recipes_type_0_for_user )

      if (!recipes_type_0_for_user == 0) {

        //pour les 7 petits dèj de la semaine 

        for (let i = 0; i < 7; i++) {

           if (recipes_type_0_for_user[i] !== undefined ) {

            recipes_temp[i*3] = recipes_type_0_for_user[i].id;

          }
          
        }
      }
      

     // debug('recipes_temp apres recherche petit dej',recipes_temp )

      const recipes_type_2_for_user = await recipesDataMapper.getRecipes_With_ImcMax_and_Specific_diet_for_user_type_1_2(req.params.userId);

      //debug('recipes_type_2_for_user',recipes_type_2_for_user )

      if (!recipes_type_2_for_user == 0) {


        let first =true;
        let u = 2;

        //on se place sur le 2 ème elément (le dejeuner)
        for (let i = 1; i < 22; i+=3) {
          
          
          if (first){
            
            if (recipes_type_2_for_user[0] !== undefined) {
              
              recipes_temp[i] = recipes_type_2_for_user[0].id;
              first=false;
              continue;
              
            }
            
          }
          
          if (recipes_type_2_for_user[u] !== undefined) {

            // debug('i1 :', i )
            //debug('u1 :', u )
            recipes_temp[i] = recipes_type_2_for_user[u].id;
            u=u+2;
          }

        }

        first = true;
        u = 3;

        //on se place sur le 3 ème elément (le diner)
        for (let i = 2; i < 22; i+=3) {
          
          
          if (first){
            
            if (recipes_type_2_for_user[1] !== undefined) {
              
              recipes_temp[i] = recipes_type_2_for_user[1].id;
              first=false;
              continue;
              
            }
            
          }
          
          if (recipes_type_2_for_user[u] !== undefined) {
            
            //debug('i2 :', i )
           // debug('u2 :', u )
            recipes_temp[i] = recipes_type_2_for_user[u].id;
            u=u+2;
          }

        }

      }

      debug('recipes_temp apres recherche type 1 ou 2',recipes_temp )


      //on construit l'objet meals et on le passe à postNewMeals, 
      //(la 1er du 3 grp de 3 doit être de typ 0 (petit dèj))
      // const meals_v3 ={
      //   start_date:'2022-05-10 06:56:30.513834+00',
      //   users_id: req.params.userId,
      //   recipes_id:[0,1,2,4,7,8,9,15,20,17,34,14,24,4,7,8,9,15,20,17,34]}



      const meals_v3 ={
        start_date: req.body.start_date,
        users_id: req.params.userId,
        recipes_id: recipes_temp }

        debug('meals_v3',meals_v3 )

      const result = await mealsDataMapper.postNewMeals(meals_v3);
      res.status(201).json(result);
     
  },


};

module.exports = mealController;


