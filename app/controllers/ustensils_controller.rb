class UstensilsController < ApplicationController
  def index
    @ustensils = Ustensil.all
  end

  def create
    @fridge = Fridge.find(params[:fridge_id])
    @ustensil = Ustensil.new(ustensil_params)
    @ustensil.fridge_id = @fridge.id
    @ingredient = Ingredient.new
    @ustensil.save
    if @ustensil.save
      redirect_to fridges_path
    else
      render "fridges/index", status: :unprocessable_entity
    end
  end

  def edit
    @ustensil = Ustensil.find(params[:id])
  end

  def update
    @ustensil = Ustensil.find(params[:id])
    @ustensil.update(ustensil_params)
    redirect_to fridge_path(@ustensil)
  end

  def destroy
    @fridge = Fridge.find(params[:fridge_id])
    @ustensil = @fridge.ustensils.find(params[:id])
    @ustensil.destroy
    redirect_to fridges_path(@fridge), status: :see_other
  end

  private

  def ustensil_params
    params.require(:ustensil).permit(:name)
  end
end
