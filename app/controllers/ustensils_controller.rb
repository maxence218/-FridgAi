class UstensilsController < ApplicationController
  def index
    @ustensils = Ustensil.all
  end

  def create
    @ustensil = Ustensil.new(ustensil_params)
    @ustensil.save
    # if @ustensil.save
    #   redirect_to fridge_path(@ustensil)
    # else
    #   render: "fridges/show", status: :unprocessable_entity
    # end
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
    @ustensil = Ustensil.find(params[:id])
    @ustensil.destroy
    redirect_to fridge_path(@ustensil)
  end

  private

  def ustensil_params
    params.require(:ustensil).permit(:name)
  end
end
