DROP TABLE IF EXISTS "public"."recipes";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS recipes_id_seq;

-- Table Definition
CREATE TABLE "public"."recipes" (
    id SERIAL PRIMARY KEY,
    recipe_name text,
    cooking_time interval,
    rating int
);

INSERT INTO "public"."recipes" ("id", "recipe_name", "cooking_time", "rating") VALUES
(1, 'Gobi Musallam', '2500', '6'),
(2, 'Samosa Chaat', '4000', '7'),
(3, 'Chicken Biryani', '5500', '8'),
(4, 'Matar Kachori', '4500', '8'),
(5, 'Shahi Panner', '3000', '9');
