class RecipesController < ApplicationController
  before_action :authenticate

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = @current_user.recipes.load
    render json: @recipes
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = @current_user.recipes.find(params[:id])

    render json: @recipe
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = @current_user.recipes.new(params[:recipe])

    if @recipe.save
      render json: @recipe, status: :created, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    @recipe = @current_user.recipes.find(params[:id])

    if @recipe.update(params[:recipe])
      head :no_content
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = @current_user.recipes.find(params[:id])
    @recipe.destroy

    head :no_content
  end
end
