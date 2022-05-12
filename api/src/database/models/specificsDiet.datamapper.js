const client = require('../client_pg');
const debug = require('debug')("SpecificDiet_DataMapper");
const APIError = require('../../Errors/APIError');


const specificDietDataMapper = {

    async getAllSpecificDiet() {
        const query = 'SELECT * FROM specific_diet;';
        const results = await client.query(query);
        if(!results.rowCount){
          throw new APIError ("No specific diet saved yet", 404);
        };
        return results.rows;
      },

      async getSpecificDietInfosByID(specific_dietId){
        const query = { 
          text: `SELECT * FROM "specific_diet"
                  WHERE "id" = $1;`,
          values: [specific_dietId],
        };
        const results = await client.query(query);
        if(!results.rowCount){
          throw new APIError ("This specific diet is still not saved in base.", 404);
        };
        return results.rows[0];
      },

      async postNewSpecificDiet(specific_diet){

        const query = {
          text: `INSERT INTO "specific_diet"(name) VALUES ($1)`,
          values: [specific_diet.name],
        };
        await client.query(query);
        return 'The specific diet has been saved into database';
      },
  

}

module.exports = specificDietDataMapper;