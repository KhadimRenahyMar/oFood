const Joi = require('joi');

const recipeSchema = Joi.object({
  name: Joi.string(),
  photo_link: Joi.string().required(),
  meal_time:  Joi.number().integer().required(),
  max_imc:    Joi.number().integer().required(),
  steps_desc: Joi.number().integer().required(),
  ingredient_desc: Joi.number().integer().required(),
}).required();

module.exports = recipeSchema;