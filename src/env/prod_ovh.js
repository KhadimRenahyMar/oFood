module.exports ={

    DB_USER:`${process.env.POSTGRES_USER}`,
    DB_PASS:`${process.env.POSTGRES_PASSWORD}`,
    DB_HOST:'localhost',
    DB_PORT:'5432',
    DB_NAME:`${process.env.POSTGRES_DB}`

    MONGO_URL:`mongodb://${ process.env.MONGO_USERNAME }:${ process.env.MONGO_PWD }@db`,
    
    SESSION_SECRET:`1234`
}


