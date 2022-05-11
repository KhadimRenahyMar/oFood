-- -- Deploy ofood:3.add.script_create_meals to pg

BEGIN;

-- CREATE FUNCTION populate_meals(meals json) RETURNS void AS $$

-- INSERT INTO meals
-- (start_date, users_id, recipes_id)
-- VALUES(
-- (meals->>'start_date')::text,
-- (meals->>'users_id')::int,
-- (meals->>'recipes_id')::int

-- ) RETURNING *;

-- --dans le returning on doit retourner toutes les repas affectés à un utilisateur 


-- $$ LANGUAGE sql STRICT;



 COMMIT;

-- --jointure ok sélection à faire
-- SELECT *
-- FROM public.users
-- join users_choose_specific_diet on users_choose_specific_diet.users_id = users.id
-- join specific_diet on users_choose_specific_diet.id =specific_diet.id



-- SELECT users.id, users.email,users.firstname
-- FROM public.users
-- join users_choose_specific_diet on users_choose_specific_diet.users_id = users.id
-- join specific_diet on users_choose_specific_diet.id =specific_diet.id
-- GROUP BY users.id;


-- --Methode 1 Déclaration 1 ok
--  CREATE OR REPLACE FUNCTION get_fields_demo() RETURNS recipes AS
-- $$
-- SELECT * FROM recipes;
-- $$ LANGUAGE sql ;


-- --Apelle fct ok
-- SELECT * FROM get_fields_demo();