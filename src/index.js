require('dotenv').config()
const express = require('express');
const app = express();

//on utilise plus mongo, je le laisse comme exemple
//require('./database/client_mongo')

require('./database/client_pg')
const router = require('./routes');

// const cookieParser = require('cookie-parser');
// app.use(cookieParser());
//require('./config/jwt.config');


app.use(express.json())


app.use(router)





if (process.env.DOCKER_ENV === 'true'){

const server = app.listen(80);

}else{

  
  const PORT = process.env.PORT || 3001;

  app.listen(PORT,()=>{
      console.log(`listening on http://localhost:${PORT}`)
  })

}

