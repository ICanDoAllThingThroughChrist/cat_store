class OrdersController < ApplicationController
        
        def index
            binding.pry
            @subscriptions = Subscription.all 
            binding.pry
        end

        def new
            @subscription = Subscription.find(params[:subscription_id])
            @order = Order.new(subscription_id: params[:subscription_id])
            binding.pry
        end

        def create
            if current_user 
                @user = current_user
                @subscription= Subscription.find(subscription_params[:subscription_id])
                @order = Order.create(order_params)
                @subscription.orders.push @order
                if @subscription.save
                    flash[:notice]= "new order saved"
                    render "show"
                else  
                    flash[:notice]= "order not saved"
                end 
            else 
                flash[:alert] = "please sign up and log in to purchase subscription order and to add boxes"
                redirect_to login_url
            end 
        end

    
        def show
            @order = Order.find(params[:id])
        end

        def edit
            @order = Order.find(params[:id])
        end

        def update 
            binding.pry
            if current_user 
            @order = Order.find(params[:id])
            if @order.update(order_params)
                flash[:notice] = "subscription has been updated."
                redirect_to @subscription
            else
                flash.now[:alert] = "subscription has not been updated."
                render "edit"
            end

        end 

        def delete
            @order = Order.find(params[:id])
            @order.destroy 
            flash[:notice] = "order has been deleted"
            redirect_to orders_path
        end

        private
        def order_params
            params.require(:Order).permit(:first_name, :last_name, :email, :id, :subscription_id)
        end
end
