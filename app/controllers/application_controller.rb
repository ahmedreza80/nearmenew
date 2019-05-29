class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  before_action :current_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :full_name, :mobile_number, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :full_name, :mobile_number, :password, :password_confirmation])
    end

    def current_user?(user)
      current_user.id == user.id
    end

    helper_method :current_user?

  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end
  helper_method :current_cart




  private

  def cart_token
    return @cart_token unless @cart_token.nil?

    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end


end
