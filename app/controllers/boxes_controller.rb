class BoxesController < ApplicationController
    include CurrentBox
    before_action :set_box, only: [:show, :edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_box
    def index
        @boxes = Box.all
    end
    def new
        @box = Box.new
         3.times do
            @box.items.build
        end
        @item = Item.all
    end
    def create
        binding.pry
        @box = Box.new(box_params)
        if @box.save 
          flash[:notice] = "Box has been created."
          redirect_to @box 
        else
          flash[:alert] = "Box has not been created."
          render "new"
        end 
    end
    def show
        @box = Box.find(params[:id])
    end
    def edit
        @box = Box.find(params[:id])
    end
    def update 
        binding.pry
        @box = Box.find(params[:id])
        if @box.update(box_params)
            flash[:notice] = "Box has been updated."
            redirect_to @box
          else
            flash.now[:alert] = "Box has not been updated."
            render "edit"
        end

    end 
    def destroy
        @box = Box.find(params[:id])
        @box.destroy
        flash[:notice] = "box has been deleted."
        redirect_to boxes_path
    end

private
    def invalid_box
    logger.error "Attempt to access invalid box #{params[:id]}"
    redirect_to boxes_ptah, flash[:notice]='invalid box'
    end
    def box_params
        params.require(:box).permit(:subscription_level,:month,:year,:title, item_ids: [], items_attributes: [:title])
    end
end
