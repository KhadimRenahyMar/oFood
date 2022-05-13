-- Deploy ofood:4.add.script_create_meals_version_2 to pg

BEGIN;

CREATE OR REPLACE FUNCTION populate_meals_v2(meals_v2 json) RETURNS TABLE( id INT,start_date_meals timestamptz, recipesOfUser json) AS $$
    -- test fct version 2
    --on recoit l'objet suivant:

            -- const meals_v2 ={
            -- start_date:'2022-05-10 06:56:30.513834+00',
            -- users_id: req.params.userId,
            -- recipes_id:[1,2,4,7,8,9,15,20,17,34,14,24,4,7,8,9,15,20,17,34,27]}

   DECLARE   
   --Déclaration des variables internes à la fonction.  
    userId INT;
    recipesId INT [];

    i INT;
    j INT;
    TEMP timestamptz;

    BEGIN

    TEMP:= meals_v2->>'start_date'::timestamptz;
    userId    := meals_v2->>'users_id'::int;
    recipesId := meals_v2->>'recipes_id'::int[];


    --boucle de 7 jours 
    FOR i IN 1..7 LOOP
        --a la première itération on prend la start date

        --boucle de 3 menus 
        FOR j IN 1..3 LOOP
        --on joue 3 inserts avec la date_des 3 menus, le user_id 
                            --et la val1 du tableau de recipes_id 
                            --et la val2 du tableau de recipes_id 
                            --et la val3 du tableau de recipes_id 

        INSERT INTO meals ( users_id, recipes_id) 
                    VALUES( meals_users_id ,meals_recipesId[(i*j)] );

         END LOOP;

        -- avt de sortir on ajoute 1 à la date du jour
         TEMP := TEMP + INTERVAL '1 DAYS';

    END LOOP;


	RETURN QUERY
    SELECT users.id,meals.start_date, json_agg(recipes.*) AS user_recipes
     FROM "users"
     join meals on meals.users_id=users.id
     join recipes on recipes.id = meals.recipes_id
     where users.id = meals_users_id
     GROUP BY users.id,meals.start_date ;


	END;
$$ LANGUAGE plpgsql;



 COMMIT;



