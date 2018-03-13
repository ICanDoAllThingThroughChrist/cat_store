class SubscriptionsController < ApplicationController
    def index
    end
    def new
    end
    def create
    end
    def show
    end
    def edit
        @subscription = Subscription.find(params[:id])
    end
    def update 
        binding.pry
        @subscription = Subscription.find(params[:id])
        if @subscription.update(subscription_params)
            flash[:notice] = "subscription has been updated."
            redirect_to @subscription
          else
            flash.now[:alert] = "subscription has not been updated."
            render "edit"
        end

    end 
    def delete
    end

private
    def subscription_params
        params.require(:subscription).permit(:level,:description, :rate)
    end

end
