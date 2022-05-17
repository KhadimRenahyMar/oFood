-- Deploy ofood:5.add.script_create_meals_version_3 to pg

BEGIN;

CREATE OR REPLACE FUNCTION populate_meals_v3(
    meals_start_date timestamptz,
    meals_users_id INT,
    meals_recipesId INT[]) RETURNS TABLE( id INT,start_date timestamptz, recipesOfUser json) AS $$

    -- start_date:'2022-05-10 06:56:30.513834+00',

   DECLARE   
   
    i INT;
    j INT:=0;
    
    TEMP timestamptz := meals_start_date;

    BEGIN


    FOR i IN 0..20 LOOP

        INSERT INTO meals (start_date, users_id, recipes_id) 
                    VALUES( TEMP,meals_users_id ,meals_recipesId[i] );

        j := j +1;

        IF (j==3) THEN 
        -- avt de sortir on ajoute 1 à la date du jour
         TEMP := TEMP + INTERVAL '1 DAYS';
         j := 0;

		END IF;

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