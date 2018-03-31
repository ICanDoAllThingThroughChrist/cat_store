class SubscriberBoxesController < ApplicationController

    def index
        @subscriber_boxes = SubscriberBox.all 
    end 

    def show 
        @box = Box.find(params[:box_id])
    end 

    def new 
        @subscriber_box = SubscriberBox.create
        @box= @subscriber_box.boxes.create 
        binding.pry
        3.times do
            @box.items.build
        end
        @item = Item.all
        binding.pry
    end 

    def create 
        @box= Box.find(subscriber_box_params[:box_id])
        @box_order = SubscriberBox.create(subscriber_box_params)
        @box.subscriberboxes.push @box_order
        if @box.save
            flash[:notice]= "a new subscriber box is saved"
            render "show"
        else  
            flash[:notice]= "subscriber box is not saved"
        end 
    end 

    def edit
        @box = Box.find(params[:box_id])
    end

    def update 
        binding.pry
        @box = Box.find(params[:box_id])
        if @box.update(subscription_params)
            flash[:notice] = "subscription has been updated."
            redirect_to @box
        else
            flash.now[:alert] = "subscription has not been updated."
            render "edit"
        end

    end 
    private
    def subscriber_box_params
        params.require(:subscriber_box).permit(:id, :box_id)
    end

end
