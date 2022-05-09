

SELECT users.id, users.email,
array_agg(DISTINCT specific_diet.id) AS specific_diet_id  
FROM public.users
join users_choose_specific_diet on users_choose_specific_diet.users_id = users.id
join specific_diet on users_choose_specific_diet.id =specific_diet.id
GROUP BY users.id;