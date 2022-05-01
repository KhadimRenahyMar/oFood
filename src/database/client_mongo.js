const MongoClient = require('mongoose');
const env = require(`../env/${process.env.NODE_ENV}`)
const MongUrl = env.MONGO_URL


if (process.env.NODE_ENV === 'dev'){

  MongoClient.connect(MongUrl,{ 
      useNewUrlParser : true,
      useUnifiedTopology: true })
      .then(()=>{

        console.log('Connexion Mongo DB dev OK !');


      })
      .catch((err)=>{

        console.log(err);
      });

  }

  
  if (process.env.NODE_ENV === 'prod_ovh'){


  MongoClient.connect(MongUrl,{ 
    useNewUrlParser : true,
    useUnifiedTopology: true })
    .then(()=>{

      console.log('Connexion Mongo DB prod_ovh OK !');


    })
    .catch((err)=>{

      console.log(err);
    });


  }
    

if (process.env.NODE_ENV === 'atlas'){

  MongoClient.connect(MongUrl,{ 
    useNewUrlParser : true,
    useUnifiedTopology: true })
    .then(()=>{

      console.log('Connexion Mongo DB atlas OK !');


    })
    .catch((err)=>{

      console.log(err);
    });
  

  }