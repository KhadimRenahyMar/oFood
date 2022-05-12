-- Deploy ofood:4.add.script_view_meals_by_userID to pg

BEGIN;


-- --CREATE TYPE meals_by_user AS (meals_by_user );
--  CREATE OR REPLACE FUNCTION meals_by_user_id (int) RETURNS * AS $$

-- SELECT users.id,meals.start_date,recipes.id,recipes.name,recipes.photo_link,recipes.meal_time,
-- recipes.max_imc,recipes.type,recipes.steps_desc,recipes.ingredient_desc
-- FROM public.users
-- join meals on meals.users_id=users.id
-- join recipes on recipes.id = meals.recipes_id
-- where users.id = $1;

-- --dans le returning on doit retourner toutes les repas affectés à un utilisateur 

--  $$ LANGUAGE sql STRICT;


-- SELECT users.id,meals.start_date,recipes.id,recipes.name,recipes.photo_link,recipes.meal_time,
-- recipes.max_imc,recipes.type,recipes.steps_desc,recipes.ingredient_desc
-- FROM public.users
-- join meals on meals.users_id=users.id
-- join recipes on recipes.id = meals.recipes_id
-- where users.id =1;


-- SELECT users.id,meals.start_date, json_agg(recipes.*) AS user_recipes
-- FROM "users"
-- join meals on meals.users_id=users.id
-- join recipes on recipes.id = meals.recipes_id
-- where users.id = 1
-- GROUP BY users.id,meals.start_date ;

COMMIT;
