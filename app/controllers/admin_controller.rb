class AdminController < ApplicationController
  before_action :logged_in?
    def index
      @total_orders = Order.count
    end
    def manual_ship
      if current_user.admin?
          @subscriber_users = User.where("role_id == 8")
            #it to the history for all current 
            # subscribers - but not subscribers who have cancelled)
          @boxes = Box.find_by_sql(["select * from boxes where shipped = ?",
                                    shipped = false])
      end
    end
     #As an administrator I want to be able to manually
    # ship a box (when I click the “ship” button on the
    # box it adds it to the history for all current 
    # subscribers - but not subscribers who have cancelled)
end
