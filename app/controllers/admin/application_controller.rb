class Admin::ApplicationController < ApplicationController
  befoore_action :authorize_admin!
  def index
  end
private 
  def authorized_admin!
   authenticate_user! 
    unless current_user.admin? 
    redirect_to root_path, alert: "You must be an admin to do that"
    end 
  end 
end
