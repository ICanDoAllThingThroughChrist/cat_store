class VisitorsController < ApplicationController
    before_action :set_subscription
    before_action :set_visitor, only:[:show, :edit, :update, :destroy]
    def new 
        @visitor = @subscription.users.build
    end
    def create 
        @visitor = @subscription.visitors.build(visitor_params)
        if @visitor.save 
            flash[:notice] = "Visitor has been created"
            redirect_to [@subscription, @ticket]
        else 
            flash.now[:alert] = "Visitor has not been created"
            render "new"
        end 
    end
    def show 
    end

    private 
    def visitor_params
        params.require.(:visitor).permit(:first_name, :last_name, :email )
    end
    def set_subscription 
        @subscription = Subscription.find(params[:subscription_id])
    end
    def set_visitor 
        @visitor = @subscription.tickets.find(params[:id])
    end 
end
