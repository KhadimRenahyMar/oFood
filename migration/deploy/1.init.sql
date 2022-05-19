
-- Deploy ofood:1.init to pg

--HEROKU --> OWNER TO "yzeirdcsvyjxtt"

BEGIN;

ALTER SCHEMA "public" OWNER TO "ofood";

CREATE TABLE "users" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "email" TEXT NOT NULL UNIQUE,
  "password" TEXT NOT NULL UNIQUE,
  "firstname" TEXT DEFAULT NULL,
  "lastname" TEXT DEFAULT NULL,
  "is_admin_role" BOOLEAN DEFAULT false,
  "profil_is_completed" BOOLEAN DEFAULT false,
  "sex" TEXT DEFAULT NULL,
  "height" INTEGER DEFAULT NULL,
  "weight" INTEGER DEFAULT NULL,
  "imc" INTEGER DEFAULT NULL,

  "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMPTZ
);


CREATE TABLE "recipes" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" TEXT DEFAULT NULL,
  "photo_link" TEXT DEFAULT NULL,
  "meal_time" INTEGER NOT NULL,
  "max_imc" INTEGER NOT NULL,
  "type" INTEGER NOT NULL,
  "steps_desc"TEXT DEFAULT NULL,
  "ingredient_desc" TEXT DEFAULT NULL,

  "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMPTZ
);


CREATE TABLE "meals" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "start_date" TIMESTAMPTZ NOT NULL,
  "users_id"   INTEGER NOT NULL REFERENCES "users"("id") ON DELETE CASCADE,
  "recipes_id"   INTEGER NOT NULL REFERENCES "recipes"("id") ON DELETE CASCADE,

  "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMPTZ
);



CREATE TABLE "users_create_recipes" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY,
  "users_id"   INTEGER NOT NULL REFERENCES "users"("id") ON DELETE CASCADE,
  "recipes_id" INTEGER NOT NULL REFERENCES "recipes"("id") ON DELETE CASCADE,
  PRIMARY KEY ("users_id","recipes_id"),

  "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMPTZ
);


CREATE TABLE "specific_diet" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" TEXT DEFAULT NULL,

  "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMPTZ
);


CREATE TABLE "specific_diet_has_recipes" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY,
  "specific_diet_id"   INTEGER NOT NULL REFERENCES "specific_diet"("id") ON DELETE CASCADE,
  "recipes_id" INTEGER NOT NULL REFERENCES "recipes"("id") ON DELETE CASCADE,
  PRIMARY KEY ("specific_diet_id","recipes_id"),

  "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMPTZ
);

CREATE TABLE "users_choose_specific_diet" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY,
  "users_id"   INTEGER NOT NULL REFERENCES "users"("id") ON DELETE CASCADE,
  "specific_diet_id"   INTEGER NOT NULL REFERENCES "specific_diet"("id") ON DELETE CASCADE,
  PRIMARY KEY ("users_id","specific_diet_id"),

  "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMPTZ
);




COMMIT;
