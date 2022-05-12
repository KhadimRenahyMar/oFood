-- Deploy ofood:4.add.script_create_meals_version_2 to pg

BEGIN;


CREATE OR REPLACE FUNCTION populate_meals_v2(meals_v2 json) RETURNS void AS $$


 -- test fct version 2


    --on recoit l'objet suivant:

            -- const meals_v2 ={
            -- start_date:'2022-05-10 06:56:30.513834+00',
            -- users_id: req.params.userId,
            -- recipes_id:[1,2,4,7,8,9,15,20,17,34,14,24,4,7,8,9,15,20,17,34,27]}
                            

    --boucle de 7 jours 
        --a la première itération on prend la start date

        --boucle de 3 menus 
        --on joue 3 inserts avec la date_des 3 menus, le user_id 
                            --et la val1 du tableau de recipes_id 
                            --et la val2 du tableau de recipes_id 
                            --et la val3 du tableau de recipes_id 
        -- avt de sortir on ajoute 1 à la date du jour



    -- on appelle la rq ci-dessous et on retourne le résultat avec la fonction populate_meals.

    -- SELECT users.id,meals.start_date, json_agg(recipes.*) AS user_recipes
    --  FROM "users"
    --  join meals on meals.users_id=users.id
    --  join recipes on recipes.id = meals.recipes_id
    --  where users.id = $1
    --  GROUP BY users.id,meals.start_date ;



$$ LANGUAGE sql STRICT;



 COMMIT;



