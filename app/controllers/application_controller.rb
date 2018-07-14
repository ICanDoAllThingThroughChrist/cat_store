class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout "application"
  #include Pundit
  protect_from_forgery
  helper_method :current_user
  include SessionsHelper
  def current_user  
    binding.pry
        @current_user= User.find_by_id(session[:user_id])
        @current_user= @user
  end 
end
