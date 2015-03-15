class RecipesGenerator
  attr_reader :name

  def initialize(recipes_file='recipes')
    @recipes = YAML::load(File.open("#{Rails.root}/config/#{recipes_file}.yml"))
  end

  def generate_for(obj)
    @recipes.each do |recipe|
      obj.recipes.create(
        name: recipe["recipe"]["name"],
        difficulty: recipe["recipe"]["difficulty"],
        instructions: recipe["recipe"]["instructions"],
        favorite: recipe["recipe"]["favorite"],
        remote_photo_url: recipe["recipe"]["remote_photo_url"],
        description: recipe["recipe"]["description"]
      )
    end
  end
end
