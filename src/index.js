require('dotenv').config()
const express = require('express');
const app = express();
require('./database/client_mongo')

const routing = require('./routes')

app.use(express.json())
app.use(express.urlencoded({extended:true}))
app.use(routing)


app.all('*', (req, res) => {
  res.status(404).end();
})


if (process.env.DOCKER_ENV === 'true'){

const server = app.listen(80);

}else{

  
  const PORT = process.env.PORT || 3001;

  app.listen(PORT,()=>{
      console.log(`listening on http://localhost:${PORT}`)
  })

}

