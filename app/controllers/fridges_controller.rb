class FridgesController < ApplicationController

  def index
    # a terme ce sera @fridge = curent_user.fridge
    @fridge = Fridge.new
    
  end
end
