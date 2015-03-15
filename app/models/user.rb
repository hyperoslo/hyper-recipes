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
      recipes = RecipesGenerator.new
      recipes.generate_for(self)
    end
  end
end
