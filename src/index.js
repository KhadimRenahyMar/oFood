require('dotenv').config()
const express = require('express');
const cookieParser = require('cookie-parser');
const app = express();

exports.app = app;
require('./database/client_pg')


app.use(cookieParser());

//a placer absolument après cookieParser
require('./config/jwt.config');


app.use(express.json())


const router = require('./routes');
app.use(router)




if (process.env.DOCKER_ENV === 'true'){

const server = app.listen(80);

}else{

  
  const PORT = process.env.PORT || 3001;

  app.listen(PORT,()=>{
      console.log(`listening on http://localhost:${PORT}`)
  })

}

