# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
before_action :configure_sign_up_params, only: [:create]
  # GET /resource/sign_up
  def new
    super
  end
  #then the method called in the before action where you permit the parameters
  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone, :location, :pincode])
  end
end
