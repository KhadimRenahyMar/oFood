
--jointure ok sélection à faire
SELECT *
FROM public.users
join users_choose_specific_diet on users_choose_specific_diet.users_id = users.id
join specific_diet on users_choose_specific_diet.id =specific_diet.id



SELECT users.id, users.email,users.firstname
FROM public.users
join users_choose_specific_diet on users_choose_specific_diet.users_id = users.id
join specific_diet on users_choose_specific_diet.id =specific_diet.id
GROUP BY users.id;


--Methode 1 Déclaration 1 ok
 CREATE OR REPLACE FUNCTION get_fields_demo() RETURNS recipes AS
$$
SELECT * FROM recipes;
$$ LANGUAGE sql ;


--Apelle fct ok
SELECT * FROM get_fields_demo();




--Methode 2 Déclaration 1 ok
 CREATE OR REPLACE FUNCTION get_fields_demo1() RETURNS recipes AS
$$

BEGIN

SELECT * FROM recipes;

END;
$$ LANGUAGE plpgsql ;



-- Table visiteur exemple avec manip date
CREATE TABLE IF NOT EXISTS public.visiteur
(
    id integer NOT NULL,
    num_billet integer NOT NULL UNIQUE,
    date_deb timestamp without time zone NOT NULL DEFAULT now(),
    date_fin timestamp without time zone NOT NULL DEFAULT (((now())::date + 3))::timestamp without time zone,
    CONSTRAINT visiteur_pkey PRIMARY KEY (id)
);


--AUTRE EXEMPLE


CREATE OR REPLACE FUNCTION fun()
  RETURNS text AS
$$
begin
select dblink_connect(
      'port=5432 dbname=test user=postgres password=****');

WITH a AS (
SELECT *
FROM dblink(
    'SELECT slno,fname,mname,lname
    FROM    remote_tbl'
     ) AS t (slno int, fname text, mname text, lname text)
)
, b AS (
INSERT INTO temptab1
SELECT slno, name
FROM   a
)
, c AS (
INSERT INTO temptab2
SELECT slno, name
FROM   a
)
INSERT INTO temptab3
SELECT slno, name
FROM   a;


select dblink_disconnect();
end;
$$ 
LANGUAGE plpgsql;



Calling Function:

select fun();


CORRECTION 

stackoverflow


CREATE OR REPLACE FUNCTION fun() RETURNS text AS $$
BEGIN
    --- ....
    RETURN(SELECT dblink_disconnect());
END
$$ LANGUAGE plpgsql;



ALTER TABLE package ADD COLUMN request_time TIMESTAMPTZ NOT NULL DEFAULT now();