Challenge
To work on this challenge, first:

1. Setup a new project directory recipes_directory. => Terminal -> created
2. Create a new database recipes_directory. => TablePlus -> created
3. Create a new test database recipes_directory_test for your tests. => TablePlus -> created
Then:

4. Design and create the table for the following user stories.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep a list of all my recipes with their names.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep the average cooking time (in minutes) for each recipe.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to give a rating to each of the recipes (from 1 to 5).


Nouns:
recipes, recipe_name, cooking_time, rating

2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

Record	    Properties
recipes  	recipe_name, cooking_time, rating
Name of the table (always plural): recipes

Column names: 'recipe_name', 'cooking_time', 'rating'

3. Decide the column types.
Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

id: SERIAL
recipe_name: text
cooking_time: interval
rating: int

4. Write the SQL.
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

CREATE TABLE recipes (
    id SERIAL PRIMARY KEY,
    recipe_name text,
    cooking_time interval,
    rating int
);

5. Test-drive the Repository class for this new table. You should design, test-drive and implement two methods all and find.

6. Write code in the main file app.rb so it prints out the list of recipes.

=========

# MODEL AND REPOSITORY CLASSES DESIGN RECIPE

# 1 Design and Create the Table

CREATE TABLE recipes (
    id SERIAL PRIMARY KEY,
    recipe_name text,
    cooking_time interval,
    rating int
);


# 2. Create Test SQL seeds

INSERT INTO "public"."recipes" (recipe_name, cooking_time, rating) VALUES ('Chickpeas', '3600', '5');
INSERT INTO "public"."recipes" (recipe_name, cooking_time, rating) VALUES ('Rajmah', '3000', '5');


# 3. 


--- ruby

class Recipe
    attr_accessor :id, :recipe_name, :cooking_time, :rating
end

class RecipeRepository
    def all
        # Executes the SQL query:
        # SELECT id, recipe_name, cooking_time, rating FROM recipes;

        # Returns an array of recipe objects
    end

    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
        # Executes the SQL query:
        # SELECT id, recipe_name, cooking_time, rating FROM rating WHERE id = $1;

        # Returns a single Recipe object
    end
end

----

<!-- 
➜  music_library git:(main) ✗ psql -h 127.0.0.1 music_library_test < spec/seeds_artists.sql
TRUNCATE TABLE
INSERT 0 1
INSERT 0 1 
-->


# 4 . Implement the Model Class

class Recipe
    attr_accessor : id, :name, :genre
end

# 5. Define the Repository Class Interface

# => Table Name: recipes

# => Repository class
# (in lib/recipe_repository.rb)

class RecipeRepository
    def all
        # Executes the SQL query:
        # SELECT id, recipe_name, cooking_time, rating FROM recipes;

        # Returns an array of recipe objects
    end

    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
        # Executes the SQL query:
        # SELECT id, recipe_name, cooking_time, rating FROM rating WHERE id = $1;

        # Returns a single Recipe object
    end
end

# 6. Write Test Examples

# EXAMPLES

# 1
# Get all recipes

repo = RecipeRepository.new

recipes = repo.all

recipes.length # =>  5

recipes[0].id # =>  1
recipes[0].recipe_name # =>  'Gobi Musallam'
recipes[0].cooking_time # =>  '50:00'
recipes[0].rating # => 6

recipes[1].id # =>  4
recipes[1].recipe_name # =>  'Matar Kachori'
recipes[1].cooking_time # => '75:00'
recipes[1].rating # => 8

# 2
# Get a single recipe

(a)
repo = RecipeRepository.new
recipe = repo.find(1)

recipe.id # =>  2
recipe.recipe_name # =>  'Samosa Chaat'
recipe.cooking_time # =>  '66.667'
recipe.rating # => 7

(b)
repo = RecipeRepository.new
recipe = repo.find(2)

recipe.id # =>  3
recipe.recipe_name # =>  'Fennel Pasta'
recipe.cooking_time # => '91:667'
recipe.rating # => 8

# 7. Reload the SQL seeds before each test run

============
➜  Projects ls -ltr
total 0
drwxr-xr-x   4 shilpachhabra  staff  128 21 Feb 15:45 code-practice
drwxr-xr-x@ 15 shilpachhabra  staff  480 21 Feb 15:54 ruby-kickstart
drwxr-xr-x@ 10 shilpachhabra  staff  320  5 Mar 14:10 ruby_challenges
drwxr-xr-x   9 shilpachhabra  staff  288 20 Mar 15:07 music_library
drwxr-xr-x   8 shilpachhabra  staff  256 20 Mar 18:23 student_directory
drwxr-xr-x   9 shilpachhabra  staff  288 21 Mar 14:29 book_store
drwxr-xr-x   8 shilpachhabra  staff  256 22 Mar 12:11 music_directory
drwxr-xr-x  11 shilpachhabra  staff  352 22 Mar 15:24 Cloned_Makers_Databases
drwxr-xr-x  10 shilpachhabra  staff  320 22 Mar 16:27 recipes_directory
➜  Projects cd recipes_directory 
➜  recipes_directory git:(main) ✗ cd
➜  ~ cd databases/resources/seeds     
➜  seeds git:(main) psql -h 127.0.0.1 recipes_directory_test
psql (15.2 (Homebrew))
Type "help" for help.

recipes_directory_test=# select * from recipes;
 id | recipe_name  | cooking_time | rating 
----+--------------+--------------+--------
  1 | Chana Masala | 01:00:00     |      6
  2 | Rajmah       | 00:50:00     |      9
(2 rows)

recipes_directory_test=# 
\q
➜  seeds git:(main) psql -h 127.0.0.1 recipes_directory 
psql (15.2 (Homebrew))
Type "help" for help.

recipes_directory=# select * from recipes;
 id |   recipe_name   | cooking_time | rating 
----+-----------------+--------------+--------
  1 | Gobi Musallam   | 00:41:40     |      6
  2 | Samosa Chaat    | 01:06:40     |      7
  3 | Chicken Biryani | 01:31:40     |      8
  4 | Matar Kachori   | 01:15:00     |      8
  5 | Shahi Panner    | 00:50:00     |      9
(5 rows)

*******************
➜  seeds git:(main) cd
➜  ~ cd Projects/recipes_directory 
➜  recipes_directory git:(main) ✗ ls -ltr
total 32
-rw-r--r--  1 shilpachhabra  staff  120 22 Mar 14:52 Gemfile
-rw-r--r--  1 shilpachhabra  staff  564 22 Mar 14:52 Gemfile.lock
drwxr-xr-x  5 shilpachhabra  staff  160 22 Mar 16:45 lib
-rw-r--r--  1 shilpachhabra  staff  709 22 Mar 17:15 recipe_seed_table.sql
drwxr-xr-x  6 shilpachhabra  staff  192 22 Mar 17:16 spec
-rw-r--r--  1 shilpachhabra  staff  429 22 Mar 17:37 app.rb
➜  recipes_directory git:(main) ✗ psql -h 127.0.0.1 recipes_directory     
psql (15.2 (Homebrew))
Type "help" for help.

recipes_directory=# SELECT * FROM recipes;
 id |   recipe_name   | cooking_time | rating 
----+-----------------+--------------+--------
  1 | Gobi Musallam   | 00:41:40     |      6
  2 | Samosa Chaat    | 01:06:40     |      7
  3 | Chicken Biryani | 01:31:40     |      8
  4 | Matar Kachori   | 01:15:00     |      8
  5 | Shahi Panner    | 00:50:00     |      9
(5 rows)

recipes_directory=# 
\q
➜  recipes_directory git:(main) ✗ psql -h 127.0.0.1 recipes_directory_test
psql (15.2 (Homebrew))
Type "help" for help.

recipes_directory_test=# SELECT * FROM recipes;
 id | recipe_name  | cooking_time | rating 
----+--------------+--------------+--------
  1 | Chana Masala | 01:00:00     |      6
  2 | Rajmah       | 00:50:00     |      9
(2 rows)