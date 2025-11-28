class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def create
    @ustensil = Ustensil.new
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

    if @ingredient.update(ingredient_params)
      redirect_to fridges_path(@ingredient.fridge), status: :see_other
    else
      @fridge = @ingredient.fridge
      render "fridges/show", status: :unprocessable_entity
    end
  end

  def destroy
    @fridge = Fridge.find(params[:fridge_id])
    @ingredient = @fridge.ingredients.find(params[:id])
    @ingredient.destroy
    redirect_to fridges_path(@fridge), status: :see_other
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity, :unit)
  end
end
