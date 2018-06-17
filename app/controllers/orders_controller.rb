class OrdersController < ApplicationController
        
        def index
            binding.pry
            if current_user
            #binding.pry
            @orders = Order.find_by_sql ["SELECT id FROM Orders WHERE user_id = ?", current_user]
            end
            @orders_ordered = Order.order(:id).paginate(page: params[:page], per_page: 5)
            #binding.pry
            #@subscriber_users_boxes = Box.order(:id).paginate(page: params[:page], per_page: 1)
        end

        def new
            binding.pry
            #@current_user = User.find_by_id(session[:user_id])
            @user = current_user
            @order = Order.new
            #binding.pry
        end

        def create
            binding.pry
            if current_user 
                ##binding.pry
                # @user = current_user
                # @subscription= Subscription.find(params[:order][:subscription_id])
                # @user.subscriptions.push @subscription
                #binding.pry
                @order = Order.new(order_params)
                #binding.pry
                @order.user_id= @current_user.id        
                #@user.subscriptions.orders.push @order
                ##binding.pry
                if @order.save
                    #binding.pry
                    flash[:notice]= "new subscription order saved"
                else  
                    flash[:notice]= "subscription order not saved"
                end 
                #binding.pry
                render "show"
            else
                binding.pry 
                flash[:alert] = "please sign up and log in to purchase subscription order and to add boxes"
                redirect_to login_url
            end 
        end

    
        def show
            #binding.pry
            @order = Order.find(params[:id])
        end

        def edit
            @order = Order.find(params[:id])
        end

        def update 
            #binding.pry
            #@current_user= User.find_by_id(session[:user_id])
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

        def toggle_cancellation
            @order = Order.find(params[:id])
            if @order.cancellation == nil 
                #binding.pry
              @order.cancellation= true
              @order.save
              flash[:notice] = "Your subscription order has been marked cancelled"
              redirect_to boxes_path
            else
              @order.cancellation= false
              @order.save
              redirect_to boxes_path
            end
        end

        private
        def order_params
            params.require(:order).permit(:first_name,
            :last_name, :email, :id,
            :subscription_id, :subscription,
            :user_id, :item_ids, :name)
        end
        def current_user
            @current_user= User.find_by_id(session[:user_id])
        end
end
