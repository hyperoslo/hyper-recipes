require 'rails_helper'

describe RecipesController do
  describe "index" do
    context "with correct user's token auth" do
      before do
        @user = User.create!(user_attributes)
        auth(@user)
      end
      it "returns all user's recipes" do
        Recipe.create!(recipe_attributes)
        recipes = @user.recipes.load

        get :index, format: :json

        expect(response.status).to eq 200
        expect(response.body).to have_content(recipes.to_json)
      end

    end

    context "without correct user's token auth" do
      it "returns unauthorized error" do
        get :index

        expect(response.status).to eq 401
      end
    end

  end

  describe "show" do
    context "with correct user's token auth" do
      before do
        @user = User.create!(user_attributes)
        auth(@user)
      end

      it "can show any recipe belongs to user" do
        recipe = Recipe.create!(recipe_attributes)
        get :show, format: :json, :id => 1

        expect(response.status).to eq 200
        expect(response.body).to have_content(recipe.name)
      end
    end
  end

  describe "create" do

    context "with correct user's token auth" do
      before do
        @user = User.create!(user_attributes)
        auth(@user)
      end

      it "creates a recipe" do

        recipe_params = {recipe: {name: 'Fresh Peach Cobbler I',     difficulty: 1, user_id: 1}}

        post :create, recipe_params

        expect(response.status).to eq 201
        expect(response.body).to have_content("Fresh Peach Cobbler I")

      end
    end

    context "without correct user's token auth" do
      it "it returnes :unprocessable_entity" do
        recipe_params = {recipe: {name: 'Fresh Peach Cobbler I',     difficulty: 1, user_id: 1}}

        post :create, recipe_params

        expect(response.status).to eq 401
        expect(response.body).to have_content('HTTP Token: Access denied')
      end
    end
  end

  describe "update" do
    context "with correct user's token auth" do
      before do
        @user = User.create!(user_attributes)
        auth(@user)
      end
      it "recipe attributes" do
        Recipe.create!(recipe_attributes)
        update_params = {id: 1, recipe: { name: 'Meatballzzz', difficulty: 3}}
        put :update, update_params

        expect(response.status).to eq 204
      end

      it "can't change difficulty out of 1..3" do
        Recipe.create!(recipe_attributes)
        update_params = {id: 1, recipe: {difficulty: 4}}

        put :update, update_params

        expect(response.status).to eq 422
        expect(response.body).to include("is not included in the list")
      end

    end

  end

  describe "destroy" do
    context "with correct user's token auth" do
      before do
        @user = User.create!(user_attributes)
        auth(@user)
      end
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