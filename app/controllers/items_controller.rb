class ItemsController < ApplicationController
    load_and_authorize_resource :nested => :box
    def index
        @items = Item.all
    end
    def new
        @item = Item.new
    end
    def create
        binding.pry
        @item = Item.new(item_params)
        if @item.save 
          flash[:notice] = "item has been created."
          redirect_to @item 
        else
          flash[:alert] = "item has not been created."
          render "new"
        end 
    end
    def show
        @item = Item.find(params[:id])
    end
    def edit
        @item = Item.find(params[:id])
    end
    def update 
        binding.pry
        @item = Item.find(params[:id])
        if @item.update(item_params)
            flash[:notice] = "item has been updated."
            redirect_to @item
          else
            flash.now[:alert] = "item has not been updated."
            render "edit"
        end

    end 
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        flash[:notice] = "item has been deleted."
        redirect_to items_path
    end

private
    def item_params
        params.require(:item).permit(:title,:description,:image,:size,:URL,:image_cache, :remove_image)
    end

end
