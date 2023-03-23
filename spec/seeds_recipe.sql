TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name

-- BELOW this line there should only be 'INSERT' statements
-- Replace these statements with your own seed data

INSERT INTO "public"."recipes" (recipe_name, cooking_time, rating) VALUES ('Chana Masala', '3600', '6');
INSERT INTO "public"."recipes" (recipe_name, cooking_time, rating) VALUES ('Rajmah', '3000', '9');
