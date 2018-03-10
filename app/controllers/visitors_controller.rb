class VisitorsController < ApplicationController
    before_action :set_subscription
    before_action :set_visitor, only:[:show, :edit, :update, :destroy]
    def new 
        @visitor = @subscription.users.build
    end
    def create 
        @visitor = @subscription.visitors.build(visitor_params)
        @visitor.subscriber = current_user
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
    def edit 
    end
    def update 
        if @visitor.update(ticket_params)
            flash[:notice] = "Visitor has been updated"
            redirect_to [@subscription, @visitor]
        else 
            flash.now[:alert] = "Visitor has not been updated"
            render "edit"
        end
    end
    def destroy 
        @visitor.destroy
        flash[:notice] = "goodbye" 

        redirect_to @subscription 
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
