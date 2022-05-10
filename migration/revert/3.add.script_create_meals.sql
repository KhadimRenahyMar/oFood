-- Revert ofood:3.add.script_create_meals from pg

BEGIN;
--DROP FUNCTION new_create_meals;
COMMIT;
