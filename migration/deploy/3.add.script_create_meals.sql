-- -- Deploy ofood:3.add.script_create_meals to pg

BEGIN;

-- CREATE FUNCTION populate_meals(meals json) RETURNS void AS $$

-- INSERT INTO bio.species
-- (scientific_name, common_name, family_id)
-- VALUES(
-- (meals->>'start_date')::text,
-- (meals->>'users_id')::int,
-- (meals->>'recipes_id')::int,

-- ) RETURNING *;

-- --dans le returning on doit retourner toutes les repas affectés à un utilisateur 


-- $$ LANGUAGE sql STRICT;






-- --Etape 1
-- -- On récupère toutes les recettes en bdd (getAllRecipes)
--     SELECT * FROM recipes;


-- --on filtre toutes celles qui ne font pas parties du régime spécifique du user
-- --(joindre la table user à la table specific_diet )



-- --on filtre sur les résultat précédents les recettes qui ont un max_imc <=  à son imc


-- --Etape 2 (limit avec random)
-- --Soit on sélectionne les 21 ere recettes (return sous tableau), soit on fait un random de 21


-- --Etape 3
-- --on boucle sur 7jours 

-- --on boucle sur 3 menus 
--  --On lance insert correspondants aux 3 repas du jour avec la startdate, 



-- --(attention boucle si ) 



 --COMMIT;

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