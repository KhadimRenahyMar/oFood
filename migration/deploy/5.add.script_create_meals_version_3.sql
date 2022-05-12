-- Deploy ofood:5.add.script_create_meals_version_3 to pg

BEGIN;

CREATE OR REPLACE FUNCTION populate_meals_v3(
    meals_start_date timestamp,
    meals_users_id INT,
    meals_recipesId INT [] ) RETURNS void AS $$

    -- test fct version 3
    --on recoit les variables suivantes:
    
    -- start_date:'2022-05-10 06:56:30.513834+00',
    -- users_id: req.params.userId,
    -- recipes_id:[1,2,4,7,8,9,15,20,17,34,14,24,4,7,8,9,15,20,17,34,27]


   DECLARE   
   --Déclaration des variables internes à la fonction.  

    i INT;
    j INT;

    BEGIN


    --boucle de 7 jours 
    FOR i IN 1..7 LOOP
        --a la première itération on prend la start date

        --boucle de 3 menus 
        FOR j IN 1..3 LOOP
        --on joue 3 inserts avec la date_des 3 menus, le user_id 
                            --et la val1 du tableau de recipes_id 
                            --et la val2 du tableau de recipes_id 
                            --et la val3 du tableau de recipes_id 

        INSERT INTO meals (start_date, users_id, recipes_id) 
                    VALUES( meals_start_date,meals_users_id ,meals_recipesId[(i*j)] );

	  
        -- avt de sortir on ajoute 1 à la date du jour

         END LOOP;


    END LOOP;


    -- on appelle la rq ci-dessous et on retourne le résultat avec la fonction populate_meals.

    -- SELECT users.id,meals.start_date, json_agg(recipes.*) AS user_recipes
    --  FROM "users"
    --  join meals on meals.users_id=users.id
    --  join recipes on recipes.id = meals.recipes_id
    --  where users.id = $1
    --  GROUP BY users.id,meals.start_date ;


	END;
$$ LANGUAGE plpgsql;



 COMMIT;