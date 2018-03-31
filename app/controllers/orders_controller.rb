class OrdersController < ApplicationController
        
        def index
            binding.pry
            @subscriptions = Subscription.all 
            binding.pry
        end

        def new
            @user = current_user
            @order = Order.new
            binding.pry
        end

        def create
            binding.pry
            if current_user 
                binding.pry
                @user = current_user
                @subscription= Subscription.find(params[:order][:subscription_id])
                @user.subscriptions.push @subscription
                binding.pry
                @order = Order.new(order_params)
                binding.pry
                @order.user_id= current_user.id        
                #@user.subscriptions.orders.push @order
                binding.pry
                if @order.save
                    binding.pry
                    flash[:notice]= "new order saved"
                else  
                    flash[:notice]= "order not saved"
                end 
                binding.pry
                render "show"
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
        end 

        def delete
            @order = Order.find(params[:id])
            @order.destroy 
            flash[:notice] = "order has been deleted"
            redirect_to orders_path
        end

        private
        def order_params
            params.require(:order).permit(:first_name, :last_name, :email, :id, :subscription_id, :subscription, :user_id)
        end
end
