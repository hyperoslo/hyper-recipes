require 'rails_helper'

describe RecipesController do

  describe "index" do
    context "with correct user's token auth" do
      let(:user) { User.create!(user_attributes) }
      before do
        auth(user)
        Recipe.create!(recipe_attributes)
        @recipes = user.recipes.load
        get :index, format: :json
      end

      it 'is expected to respond with 200' do
        expect(response.status).to eq 200
      end

      it "returns all user's recipes" do
        expect(response.body).to have_content(@recipes.to_json)
      end
    end

    context "without correct user's token auth" do
      it "is expected to respond with 401" do
        get :index
        expect(response.status).to eq 401
      end
    end
  end

  describe "show" do
    context "with correct user's token auth" do
      let(:user) { User.create!(user_attributes) }
      before do
        auth(user)
        @recipe = Recipe.create!(recipe_attributes)
        get :show, format: :json, :id => 1
      end

      it 'is expected to respond with 200' do
        expect(response.status).to eq 200
      end

      it "can show a recipe that belongs to user" do
        expect(response.body).to have_content(@recipe.name)
      end
    end

    context "without correct user's token auth" do
      it "is expected to respond with 401" do
        get :show, format: :json, :id => 1
        expect(response.status).to eq 401
      end
    end
  end

  describe "create" do
    context "with correct user's token auth" do
      let(:user) { User.create!(user_attributes) }

      before do
        auth(user)
        post :create, recipe_params
      end

      it 'is expected to respond with 201' do
        expect(response.status).to eq 201
      end

      it "creates a recipe" do
        expect(response.body).to have_content("Fresh Peach Cobbler I")
      end
    end

    context "without correct user's token auth" do
      before { post :create, recipe_params }
      it "is expected to respond with 401" do
        expect(response.status).to eq 401
      end
    end
  end

  describe "update" do
    context "with correct user's token auth" do
      let(:user) { User.create!(user_attributes) }
      before do
        auth(user)
        Recipe.create!(recipe_attributes)
      end

      it "is expected to respond with 204" do
        update_params = {id: 1, recipe: { name: 'Meatballzzz', difficulty: 3}}
        put :update, update_params
        expect(response.status).to eq 204
      end

      it "can't change difficulty out of 1..3" do
        update_params = {id: 1, recipe: {difficulty: 4}}
        put :update, update_params
        expect(response.status).to eq 422
      end
    end
  end

  describe "destroy" do
    context "with correct user's token auth" do
      let(:user) { User.create!(user_attributes) }
      before { auth(user) }

      it "can be deleted" do
        Recipe.create!(recipe_attributes)
        delete :destroy, id: 1
        expect(response.status).to eq 204
      end
    end

    context "without correct user's token auth" do
      it "can't be deleted" do
        Recipe.create!(recipe_attributes)
        delete :destroy, id: 1
        expect(response.status).to eq 401
      end
    end
  end
end
