class FridgesController < ApplicationController

  def index
  @fridge = current_user.fridge
  @ingredient = Ingredient.new
  end
end
