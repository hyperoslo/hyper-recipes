require 'rails_helper'

describe 'user' do

  context 'without seed recipes' do
    let(:user) { User.create!(user_attributes) }

    it "generates auth token when created" do
      expect(user.auth_token.class).to eq(SecureRandom.hex.class)
    end
  end

  context 'with seed recipes' do
    let(:user) { User.create!(user_attributes(seed_recipes: true)) }

    it "generates dummy recipes when created with seed_recipes = true" do
      expect(user.recipes.size).to eq(15)
    end
  end
end
