-- Deploy ofood:5.add.script_create_meals_version_3 to pg

BEGIN;

CREATE OR REPLACE FUNCTION populate_meals_v3(
    meals_start_date timestamptz,
    meals_users_id INT,
    meals_recipesId INT[]) RETURNS void AS $$


   DECLARE   
   
    i INT;
    j INT:=0;

    TEMP timestamptz := meals_start_date;

    BEGIN


    FOR i IN 1..21 LOOP

        raise notice 'Value de i: %', i;
		raise notice 'meals_recipesId: %', meals_recipesId;
		raise notice 'meals_recipesId[1]: %', meals_recipesId[1];

         INSERT INTO meals (start_date, users_id, recipes_id) 
                     VALUES( TEMP,meals_users_id ,meals_recipesId[i]);

 
        j := j +1;

        IF (j=3) THEN 

         TEMP := TEMP + INTERVAL '1 DAYS';
         j := 0;

		END IF;

    END LOOP;


	

	END
$$ LANGUAGE plpgsql;

 COMMIT;

--  SELECT populate_meals_v3('2022-05-10 06:56:30.513834+00',1, ARRAY[65,277,23,74,373,117,71,257,75,0,85,18,0,91,66,0,10,104,0,291,0]);