const debug = require('debug')('Index_Router');
const userRoutes = require('./user.routes');
const is_auth = require('../middlewares/authenticated')

// Adding subrouters
userRoutes
.use('/api/users', userRoutes);

userRoutes.get('/api',is_auth,  (req, res) => {

    res.status(200).json({message :'API run'});

});


module.exports = userRoutes;
