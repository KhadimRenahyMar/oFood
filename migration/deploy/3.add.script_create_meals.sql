-- -- Deploy ofood:3.add.script_create_meals to pg

BEGIN;

ALTER TABLE IF EXISTS public.users
    ALTER COLUMN id RESTART SET START 3;


ALTER TABLE IF EXISTS public.recipes
    ALTER COLUMN id RESTART SET START 38;


ALTER TABLE IF EXISTS public.meals
    ALTER COLUMN id RESTART SET START 22;


ALTER TABLE IF EXISTS public.users_create_recipes
    ALTER COLUMN id RESTART SET START 6;


ALTER TABLE IF EXISTS public.specific_diet
    ALTER COLUMN id RESTART SET START 6;


ALTER TABLE IF EXISTS public.specific_diet_has_recipes
    ALTER COLUMN id RESTART SET START 6;


ALTER TABLE IF EXISTS public.users_choose_specific_diet
    ALTER COLUMN id RESTART SET START 2;



CREATE OR REPLACE FUNCTION populate_meals(meals json) RETURNS meals AS $$

 -- test fct version 1
INSERT INTO meals
(start_date, users_id, recipes_id)
VALUES(
(meals->>'start_date')::timestamp,
(meals->>'users_id')::int,
(meals->>'recipes_id')::int

) RETURNING *;


$$ LANGUAGE sql STRICT;



 COMMIT;


