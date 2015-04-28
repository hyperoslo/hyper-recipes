class RecipesGenerator
  include ActionView::Helpers::AssetUrlHelper
  attr_reader :name

  def initialize(recipes_file='recipes')
    @recipes = YAML::load(File.open("#{Rails.root}/config/#{recipes_file}.yml"))
  end

  def generate_for(obj)
    @recipes.each do |recipe|
      new_recipe = obj.recipes.build(
        name: recipe["recipe"]["name"],
        difficulty: recipe["recipe"]["difficulty"],
        instructions: recipe["recipe"]["instructions"],
        favorite: recipe["recipe"]["favorite"],
        description: recipe["recipe"]["description"]
      )
      photo_path = "#{Rails.root}/public/seed_images/#{recipe['recipe']['photo']}"
      File.open photo_path do |f|
        new_recipe.photo = f
      end
      new_recipe.save!
    end
  end
end
