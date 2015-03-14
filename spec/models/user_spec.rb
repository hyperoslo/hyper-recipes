require 'rails_helper'

describe 'user' do

  context 'without seed recipes' do
    before do
      @user = User.create!(user_attributes)
    end
    it "generates auth token when created" do
      expect(@user.auth_token.class).to eq(SecureRandom.hex.class)
    end
  end

  context 'with seed recipes' do
    before do
      @user = User.create!(user_attributes(seed_recipes: true))
    end
    it "generates dummy recipes when created with seed_recipes = true" do
      expect(@user.recipes.size).to eq(15)
    end
  end
end
