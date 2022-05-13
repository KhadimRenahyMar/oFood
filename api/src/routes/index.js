const debug = require('debug')('Index_Router');
const express = require("express");
const router_index = express.Router();

const userRoutes = require('./user.routes');
const recipeRoutes = require('./recipe.routes')
const specificDietRoutes= require('./specific_diet.routes')
const mealRoutes=require('./meal.routes')

//pour gestion token par cookie pour la V2 du projet 
// (ok coté back, à implémenter coté front)
// protection des routes 
const is_auth = require('../middlewares/authenticated')


//pour gestion token par header sur authorization, attention aps de refresh  token en MVP
// nécessaire pour protéger nos routes
const auth_local_storage = require('../middlewares/auth_local_storage') 



// Adding subrouters
router_index.use('/api/users',userRoutes);
router_index.use('/api/recipes',recipeRoutes);
router_index.use('/api/specific_diet',specificDietRoutes);
router_index.use('/api/meals',mealRoutes);

router_index.get('/api',auth_local_storage,  (req, res) => {
    res.status(200).json({message :'API run'});
});


// router_index.get('/api',is_auth,  (req, res) => {

//     res.status(200).json({message :'API run'});

// });


router_index.get('/api/message',  (req, res) => {

    res.status(200).json("hello depuis le back");

});





module.exports = router_index;
