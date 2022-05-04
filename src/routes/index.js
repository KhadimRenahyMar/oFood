const userRoutes = require('./user.routes');
const router = require('express').Router();




// Adding subrouters
router
.use('/api/users', userRoutes);



module.exports = router;
