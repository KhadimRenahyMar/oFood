const debug = require('debug')('Meal_Controller');
const mealsDataMapper = require('../database/models/meals.datamapper');
const recipesDataMapper = require('../database/models/recipes.datamapper');
const specificDietDataMapper = require('../database/models/specificsDiet.datamapper');

const APIError = require('../Errors/APIError');

const mealController = {
  
    async getAllMealsByUserID(req, res) {
        const userId = req.params.userId;
        const result = await mealsDataMapper.getAllMealsByUserID(userId);
        res.status(200).json(result);
      },


      async postNewMeals(req,res){
      //  debug('appel méthode post new meals')

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


      const recipes_type_0_for_user=await recipesDataMapper.recipesBy_IntolerancesAnd_Imc(req.params.userId,0)

      debug('recipes_type_0_for_user_recipesBy_IntolerancesAnd_Imc',recipes_type_0_for_user )


      if (!recipes_type_0_for_user == 0) {

        //pour les 7 petits dèj de la semaine 

        for (let i = 0; i < 7; i++) {

           if (recipes_type_0_for_user[i] !== undefined ) {

            recipes_temp[i*3] = recipes_type_0_for_user[i].id;

          }
          
        }
      }
      
      

      //A ajouter si le user n'a pas de régime spécifique,
      // alors on peut lui proposer tous les dejeuners ou diners, qui matchent avec son imc

      debug('recipes_temp apres recherche petit dej',recipes_temp )


      const recipes_type_2_for_user = await recipesDataMapper.recipesBy_IntolerancesAnd_Imc(req.params.userId,1)

      debug('recipes_type_2_for_user',recipes_type_2_for_user )


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

      // start_date: req.body.start_date,
      // start_date: req.body.start_date,
      // start_date: '2022-05-10 06:56:30.513834+00',
      // recipes_id:[0,1,2,4,7,8,9,15,20,17,34,14,24,4,7,8,9,15,20,17,34]

      const meals ={
        start_date: '2022-05-19 06:56:30.513834+00',
        users_id: parseInt (req.params.userId,10),
        recipes_id: recipes_temp }

     // debug('start_date avant passage à la fct:',req.body.start_date )


      const result_delete_Meals = await mealsDataMapper.deleteMealsByUserID(parseInt (req.params.userId,10))

      const result = await mealsDataMapper.postNewMeals(meals);


     debug('result retour des meals',result)

    
      const tab_a_retourner = [...result];

      for (const iterator of tab_a_retourner) {

 
        for (const key in iterator) {
        
            if (key == 'recipesofuser') {

              //iterator[key] --> le tab de recettes du jour) {

              for (const recette of iterator[key]) {

                const result_SpecificDietByRecipesID= await specificDietDataMapper.getSpecificDietByRecipesID(recette.id)
               // debug('régime spe da la recette',result_SpecificDietByRecipesID)
               //recette.tag=result_SpecificDietByRecipesID
               //let titi= tab_recette_recuperees.indexOf(recette)
               //let titi= iterator[key].indexOf(recette)
               //debug('titi',titi)
               
               tab_a_retourner[tab_a_retourner.indexOf(iterator)].recipesofuser[iterator[key].indexOf(recette)].tag_specificDiet=result_SpecificDietByRecipesID
              
              }
            
            }
            
          }
          
        }
        

     debug('traitement', tab_a_retourner)
   

      res.status(201).json(tab_a_retourner);
    
      
  },


};

module.exports = mealController;


