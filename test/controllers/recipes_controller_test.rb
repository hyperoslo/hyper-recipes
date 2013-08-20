require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipes)
  end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      post :create, recipe: { description: @recipe.description, difficulty: @recipe.difficulty, favorite: @recipe.favorite, instructions: @recipe.instructions, name: @recipe.name }
    end

    assert_response 201
  end

  test "should show recipe" do
    get :show, id: @recipe
    assert_response :success
  end

  test "should update recipe" do
    put :update, id: @recipe, recipe: { description: @recipe.description, difficulty: @recipe.difficulty, favorite: @recipe.favorite, instructions: @recipe.instructions, name: @recipe.name }
    assert_response 204
  end

  test "should destroy recipe" do
    assert_difference('Recipe.count', -1) do
      delete :destroy, id: @recipe
    end

    assert_response 204
  end
end
