class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :initialize_fridge
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :diet, :allergies])
  end
end
