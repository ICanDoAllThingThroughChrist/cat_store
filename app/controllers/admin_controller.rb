class AdminController < ApplicationController
  before_action :logged_in?
    def index
      @total_orders = Order.count
    end
    def manual_ship
      if admin
          @subscriber_users_boxes = User.where("role_id == 8") && Order.where("cancellation = ?", cancellation = false) && Box.find_by_sql(["select * from boxes where shipped = ?",
            shipped = false])
            #it to the history for all current 
            #subscribers - 
            #but not subscribers 
            #who have cancelled)
      end
      @subscriber_users_boxes = Box.order(:id).paginate(page: params[:page], per_page: 1)
    end
    #As an administrator I want to be able to manually
    #ship a box (when I click the “ship” button on the 
    #Response:(an order belongs to a box and belongs to a user
    #Response:therefore, there is only 1 user per box)
    #box it adds it to the history("of the box") for all current 
    #subscribers - but not subscribers who have cancelled)
end
