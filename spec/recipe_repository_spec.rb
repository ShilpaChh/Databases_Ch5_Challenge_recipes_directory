require "recipe_repository"

RSpec.describe RecipeRepository do

    def reset_recipes_table
        seed_sql = File.read("spec/seeds_recipe.sql")
        connection = PG.connect({ host: "127.0.0.1", dbname: 'recipes_directory_test' })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_recipes_table
    end

    it "returns a list of recipes" do
        repo = RecipeRepository.new

        recipes = repo.all

        expect(recipes.length).to eq 2

        expect(recipes[0].id).to eq '1' ## index to query the first object in array
        expect(recipes[0].recipe_name).to eq 'Chana Masala'
        expect(recipes[0].cooking_time).to eq '01:00:00'
        expect(recipes[0].rating).to eq '6'

        expect(recipes[1].id).to eq  '2' ## inddex 1 to query the second oblect in array
        expect(recipes[1].recipe_name).to eq  'Rajmah'
        expect(recipes[1].cooking_time).to eq '00:50:00'
        expect(recipes[1].rating).to eq '9'

    end

    it "returns a specific recipe" do
        repo = RecipeRepository.new

        recipes = repo.find(1)

        expect(recipes.id).to eq '1'
        expect(recipes.recipe_name).to eq 'Chana Masala'
        expect(recipes.cooking_time).to eq '01:00:00'
        expect(recipes.rating).to eq '6'

        recipes = repo.find(2)

        expect(recipes.id).to eq  '2'
        expect(recipes.recipe_name).to eq  'Rajmah'
        expect(recipes.cooking_time).to eq '00:50:00'
        expect(recipes.rating).to eq '9'
    end


end



######### OUTPUT ###########
#Terminal:
# ➜  recipes_directory git:(main) psql -h 127.0.0.1 recipes_directory < recipe_seed_table.sql
# DROP TABLE
# NOTICE:  relation "recipes_id_seq" already exists, skipping
# CREATE SEQUENCE
# CREATE TABLE
# INSERT 0 5

# TablePlus -> Refresh

# VSC:
# ➜  recipes_directory git:(main) ruby app.rb
# Recipe, Gobi Musallam requires a cooking time of 00:41:40 and has a 6 rating.
# Recipe, Samosa Chaat requires a cooking time of 01:06:40 and has a 7 rating.
# Recipe, Chicken Biryani requires a cooking time of 01:31:40 and has a 8 rating.
# Recipe, Matar Kachori requires a cooking time of 01:15:00 and has a 8 rating.
# Recipe, Shahi Panner requires a cooking time of 00:50:00 and has a 9 rating.
# ➜  recipes_directory git:(main) rspec

# RecipeRepository
#   returns a list of recipes
#   returns a specific recipe

# Finished in 0.0437 seconds (files took 0.13718 seconds to load)
# 2 examples, 0 failures