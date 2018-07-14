class BoxesController < ApplicationController
  
    include SessionsHelper
    before_action :admin, :only => [:create, :update]
   
    def index
        @user= current_user 
        # #binding.pry
        @user_boxes= []
        @user.orders.each do |order|
          order.boxes.each do |box|
            #binding.pry
            @user_boxes << box
          end 
        end
        @user_boxes
        @user_orders = Box.order(:id).paginate(page: params[:page], per_page: 1)
    end

    def show
        @box = Box.find(params[:id])
        ##binding.pry
    end

    def new 
            @user = current_user
            @box = @user.boxes.build
         
             3.times do
                @box.items.build
            end
         
            @item = Item.group(:title)
    end
    def create 
        @item = Item.all
        @box = Box.new(box_params) 
        @user = current_user
        @box.user_id= params[:box][:user_id]
            if current_user.orders.last == nil
                flash[:notice] = "please purchase an order to buy a box"
            else
                @order = current_user.orders.last
                @user.orders.push @order 
                @order2= @user.orders.last 
                @order2.boxes.push @box
            end

        if admin
            if @box.save 
                @user.subscriber= true 
                flash[:notice] = "Box has been created."
                redirect_to @box 
            else
                flash[:alert] = "Box has not been created."
                render "new"
            end
        else 
            flash[:alert] = "please sign up for subscription And log in as admin to create a box"
            redirect_to login_url
        end
    end
    def edit
       @box = Box.find(params[:id])

    end
    def update 
        if admin
            @box = Box.find(params[:id])
            if @box.update(box_params)
                flash[:notice] = "box has been updated."
                redirect_to @box
            else
                flash.now[:alert] = "box has not been updated."
                render "edit"
            end
        else #e.g. is a visitor only!
            flash[:alert] = "please sign up for subscription And log in as admin to create a box"
            redirect_to login_url
        end

    end 
    def destroy
        @box = Box.find(params[:id])
        @box.destroy
        flash[:notice] = "box has been deleted."
        redirect_to root# to be determined
    end
 
    def boxes_received
        if current_user
            @user= current_user 
            @user.boxes.each do |box|
                if box.received
                    "#{box.title}"
                end 
            end 
        end 
    end 

private
    def invalid_box
    logger.error "Attempt to access invalid box #{params[:id]}"
    redirect_to boxes_path, flash[:notice]='invalid box'
    end
    def load_boxes
        @boxes = Box.accessible_by(current_ability).order('created_at DESC')
      end
    def box_params
        params.require(:box).permit(
        :shipped, :order_id,
        :user_id, :subscription_level,:month,
        :year,:title, item_ids:[],
        items_attributes: [:title])
    end
    def current_user
        @current_user= User.find_by_id(session[:user_id])
    end
end
