class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    # Permit the `name` parameter for sign up forms.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
