class User < ActiveRecord::Base
  has_many :recipes, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password

  before_create :generate_auth_token
  after_create :generate_recipes

private
  def generate_auth_token
    begin
      generated_token = SecureRandom.hex(10)
    end while User.where(auth_token: generated_token).exists?

    self.auth_token = generated_token
  end

  def generate_recipes
    if self.seed_recipes == true
      recipes = YAML::load(File.open("#{Rails.root}/config/recipies.yml"))
      recipes.each do |recipe|
        self.recipes.create(
          name: recipe["recipe"]["name"],
          difficulty: recipe["recipe"]["difficulty"],
          instructions: recipe["recipe"]["instructions"],
          favorite: recipe["recipe"]["favorite"],
          remote_photo_url: recipe["recipe"]["remote_photo_url"],
          description: recipe["recipe"]["description"])
      end
    end
  end
end
