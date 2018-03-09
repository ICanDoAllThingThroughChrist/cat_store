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
            #nothing, het
        end 
    end
    def show
        @box = Box.find(params[:id])
    end

private
    def box_params
        params.require(:box).permit(:subscription_level,:month,:year,:title)
    end
end
