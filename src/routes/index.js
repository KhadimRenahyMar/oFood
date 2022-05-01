const express = require ('express')
const router_api_index = express.Router();



router_api_index.get('/api', (req, res) => {
    
    res.status(200).json( {data:'Bienvenue sur O_Food_API'} );
})


module.exports = router_api_index;