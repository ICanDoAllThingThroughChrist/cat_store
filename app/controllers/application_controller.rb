class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  protect_from_forgery
  include SessionsHelper
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

  
  #check_authorization  if: :admin_subdomain?

  # private

  # def admin_subdomain?
  #   request.subdomain == "admin"
  # end
end
