class SubscriptionsController < ApplicationController 
        def index
            @subscriptions = Subscription.all
        end
        def show 
            @subscription = Subscription.find(params[:id])
        end
        def new
            #As a visitor I want to be able to 
            #purchase a subscription
            #just ask for first name, last name and email 
            @subscription = Subscription.new 
        end
        def create
            binding.pry
            if @subscription.save 
              flash[:notice] = "subscription has been created."
              redirect_to @subscription 
            else
              flash[:alert] = "subscription has not been created."
              render "new"
            end 
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
            params.require(:subscription).permit(:level,:description, :rate, :id)
        end

end

