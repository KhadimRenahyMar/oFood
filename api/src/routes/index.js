const debug = require('debug')('Index_Router');
const express = require("express");
const router_index = express.Router();

const userRoutes = require('./user.routes');
const recipeRoutes = require('./recipe.routes')
const specificDietRoutes= require('./specific_diet.routes')
const mealRoutes=require('./meal.routes')

const is_auth = require('../middlewares/authenticated')

// Adding subrouters
router_index.use('/api/users',userRoutes);
router_index.use('/api/recipes',recipeRoutes);
router_index.use('/specific_diet',specificDietRoutes);
router_index.use('/api/meals',mealRoutes);

router_index.get('/api',is_auth,  (req, res) => {

    res.status(200).json({message :'API run'});

});




router_index.get('/api/message',  (req, res) => {

   
    res.status(200).json("hello depuis le back");

});


// router_index.get('/api',  (req, res) => {

//     res.status(200).json({message :'API run'});

// });


module.exports = router_index;
