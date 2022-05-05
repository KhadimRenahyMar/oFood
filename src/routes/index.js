const userRoutes = require('./user.routes');
const { ensureAuthenticated } = require('../config/security.config');



// Adding subrouters
userRoutes
.use('/api/users', userRoutes);


userRoutes.get('api/protected', ensureAuthenticated, (req, res) => {
    res.status(200).json({user, route :'protected' });
  })
  

userRoutes.get('/api',  (req, res) => {

    res.status(200).json('API OK');
    //res.status(200).json({ user: req.user });
});



module.exports = userRoutes;
