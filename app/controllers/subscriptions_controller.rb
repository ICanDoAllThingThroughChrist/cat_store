class SubscriptionsController < ApplicationController 
    
        def index
            @subscriptions = Subscription.all
            #binding.pry
        end
        def show 
            @subscription = Subscription.find(params[:id])
        end
        def new
            @subscription = Subscription.new 
        end
        def create
            #binding.pry
            @subscription = Subscription.new(subscription_params)#use new instead of create to prevent data persistence
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
            #binding.pry
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
        def current_user
            @current_user= User.find_by_id(session[:user_id])
        end

end

