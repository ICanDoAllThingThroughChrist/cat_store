class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  protect_from_forgery
  before_filter :authorize
  include SessionsHelper
  private 
    def set_box 
        @box = Box.find(session[:box_id])
    rescue ActiveRecord::RecordNotFound 
        @box = Box.create 
        session[:box_id] = @box.id 
    end
  protected 
    def authorize
        unless User.find_by_id(session[:user_id]) 
            redirect_to login_url, :notice => "Please log in"
        end 
    end 
end
