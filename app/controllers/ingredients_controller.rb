class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.fridge = Fridge.find(params[:fridge_id])
    @fridge = Fridge.find(params[:fridge_id])
    if @ingredient.save
      redirect_to fridges_path
    else
      render "fridges/index", status: :unprocessable_entity
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    redirect_to fridge_path(@ingredient)
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to fridge_path(@ingredient)
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity)
  end
end
