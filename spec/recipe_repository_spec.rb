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

        # expect(recipes.id).to eq '1'
        # expect(recipes.recipe_name).to eq 'Chana Masala'
        # expect(recipes.cooking_time).to eq '01:00:00'
        # expect(recipes.rating).to eq '6'

        # expect(recipes.id).to eq  '2'
        # expect(recipes.recipe_name).to eq  'Rajmah'
        # expect(recipes.cooking_time).to eq '00:50:00'
        # expect(recipes.rating).to eq '9'

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