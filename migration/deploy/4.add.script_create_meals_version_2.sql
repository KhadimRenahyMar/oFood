-- Deploy ofood:4.add.script_create_meals_version_2 to pg

BEGIN;

CREATE OR REPLACE FUNCTION populate_meals_v2(meals_v2 json) RETURNS TABLE( id INT,start_date_meals timestamptz, recipesOfUser json) AS $$

   DECLARE   
   --Déclaration des variables internes à la fonction.  
    userId INT;
    recipesId INT [];

    i INT;
    j INT;
    TEMP timestamptz;

    BEGIN

    TEMP      := meals_v2->>'start_date'::timestamptz;
    userId    := meals_v2->>'users_id'::int;
    recipesId := ARRAY(select regexp_split_to_table(replace(replace(meals_v2->>'recipes_id','[',''),']',''),','))::INT[];


    --boucle de 7 jours 
    FOR i IN 1..7 LOOP
        --a la première itération on prend la start date

        --boucle de 3 menus 
        FOR j IN 1..3 LOOP

        INSERT INTO meals ( TEMP,users_id, recipes_id) 
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



