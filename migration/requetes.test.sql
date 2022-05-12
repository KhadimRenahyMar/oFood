--pour test 
-- SELECT * FROM populate_meals('{"start_date":"2022-05-10 06:56:30.513834+00",
-- "users_id":1, "recipes_id":1}');

-- Récup du régime spécifique d'un utilisateur.
-- Jointure ok sélection à faire
SELECT * FROM public.users
join users_choose_specific_diet on users_choose_specific_diet.users_id = users.id
join specific_diet on users_choose_specific_diet.id =specific_diet.id
where users.id = 1;

--Restriction fields
SELECT users.id, users.email, users.firstname, users.lastname,specific_diet.id, specific_diet.name FROM public.users
join users_choose_specific_diet on users_choose_specific_diet.users_id = users.id
join specific_diet on users_choose_specific_diet.id =specific_diet.id
where users.id = 1;


-- Récup des repas d'un utilisateur.
SELECT * FROM public.users
join meals on meals.users_id=users.id
join recipes on recipes.id=meals.recipes_id
where users.id = 1;
--Restriction fields
SELECT users.id,meals.start_date,recipes.id,recipes.name,recipes.photo_link,recipes.meal_time,
recipes.max_imc,recipes.type,recipes.steps_desc,recipes.ingredient_desc
FROM public.users
join meals on meals.users_id=users.id
join recipes on recipes.id=meals.recipes_id
where users.id = 1;


-- --Methode 1 Déclaration 1 ok
--  CREATE OR REPLACE FUNCTION get_fields_demo() RETURNS recipes AS
-- $$
-- SELECT * FROM recipes;
-- $$ LANGUAGE sql ;


-- --Apelle fct ok
-- SELECT * FROM get_fields_demo();


{
    "name":"Cabillaud petits pois& lard",
    "photo_link":"imgRecette_37",
    "meal_time":13,
    "max_imc":35,
    "type":2,
    "steps_desc":"<ol><li>Etape 1 : Dans une casserole d''eau bouillante salée, faites cuire les petits pois pendant 8 minutes.Etape 2 : Pendant ce temps, dans une poêle, ajoutez les tranches de lard et le cabillaud.Etape 3 :Retirez le lard de la poêle une fois qu''il est bien doré.Etape 4 : Faites cuire le cabillaud 4 minutes de chaque côté. Ajoutez un filet d''huile d''olive si besoin.Etape 5 : Une fois la cuisson des petits pois terminée égouttez-les puis assaisonnez-les: sel, poivre, jus de citron, fin filet d''huile d''olive,mélangez. Etape 6 : Servez-les avec le poisson et le lard une fois leur cuisson terminée.Etape 7 : Râpez le zeste du citron sur le dessus, salez, poivrez, ajoutez un fin filet d''huile d''olive, c''est prêt !  </li></ol>'",
    "ingredient_desc":"<ul><li>1 cabillaud (frais), 200 g Petits pois (frais), 1 tran. Lard ,1/4 citron jaune.</li></ul>"
    
}