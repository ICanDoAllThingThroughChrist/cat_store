class BoxesController < ApplicationController
    def index
        @boxes = Box.all
    end
    def new
        @box = Box.new
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

private
    def box_params
        params.require(:box).permit(:subscription_level,:month,:year,:title)
    end
end
