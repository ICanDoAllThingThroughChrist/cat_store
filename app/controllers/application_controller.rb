class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout "application"
  #include Pundit
  protect_from_forgery
  helper_method :current_user
  include SessionsHelper
  def current_user  
        @current_user= User.find_by_id(session[:user_id])
        @current_user= @user
    # elsif (user_id = cookies.signed[:user_id]) 
    #     user = User.find_by(id: user_id)
    #     if user && user.authenticated?(:remember, cookies[:remember_token])
    #         log_in user 
    #         @current_user = user 
    #     end 
  end 
end
