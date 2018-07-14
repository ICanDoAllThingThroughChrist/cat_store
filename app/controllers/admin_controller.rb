class AdminController < ApplicationController
  before_action :logged_in?
    def index
      @total_orders = Order.count
    end
    def manual_ship
      if admin
          @subscriber_users_boxes = User.where("role_id == 8") && Order.where("cancellation = ?", cancellation = false) && Box.find_by_sql(["select * from boxes where shipped = ?",
            shipped = false])
      end
      @subscriber_users_boxes = Box.order(:id).paginate(page: params[:page], per_page: 1)
    end
    private 
    def current_user
      @current_user= User.find_by_id(session[:user_id])
    end

end
