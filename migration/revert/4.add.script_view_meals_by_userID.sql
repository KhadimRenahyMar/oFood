-- Revert ofood:4.add.script_view_meals_by_userID from pg

BEGIN;

--DROP FUNCTION meals_by_user_id;

COMMIT;
