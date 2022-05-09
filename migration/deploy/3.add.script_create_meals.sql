-- Deploy ofood:3.add.script_create_meals to pg

BEGIN;

--CREATE FUNCTION New_create_meals()

 --   user_id NUMBER,
 --   meals_startDate DATE,
 --   nbrRepas NUMBER)
 --   RETURNS void AS $$

--DECLARE

   -- BEGIN

--Etape 1
-- On récupère toutes les recettes en bdd (getAllRecipes)
--    SELECT * FROM recipes;


--on filtre toutes celles qui ne font pas parties du régime spécifique du user
--(joindre la table user à la table specific_diet )


SELECT *
FROM users
INNER JOIN users_choose_specific_diet on users_choose_specific_diet.users_id = users.id
WHERE users.id =1;





--on filtre sur les résultat précédents les recettes qui ont un max_imc <=  à son imc


--Etape 2
--Soit on sélectionne les 21 ere recettes (return sous tableau), soit on fait un random de 21


--Etape 3
--on boucle sur 7jours 

--on boucle sur 3 menus 
 --On lance insert correspondants aux 3 repas du jour avec la startdate, 



--(attention boucle si ) 






   --     LOOP




  --      END LOOP;

  --  END

--$$ LANGUAGE plpgsql;


COMMIT;
