class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    # if @recipe.save
    #   redirect_to fridge_path(@recipe)
    # else
    #   render: "fridges/show", status: :unprocessable_entity
    # end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, status: :see_other
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :quantity)
  end
end
