class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :initialize_fridge

  private

  def initialize_fridge
    unless current_user.nil?
      if current_user.fridge.nil?
        current_user.fridge = Fridge.create(user: current_user)
      end
    end
  end
end
