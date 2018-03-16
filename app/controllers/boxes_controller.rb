class BoxesController < ApplicationController
    include CurrentBox
    include SessionsHelper
    before_action :set_box, only: [:show, :edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_box
    skip_before_filter :authorize, :only => [:index, :show]
    def index
    end
    def new
    end
    def create 
    end
    def show
    end
    def edit
        @box = Box.find(params[:id])
    end
    def update 
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
        params.require(:box).permit(:user_id, :subscription_level,:month,:year,:title, item_ids:[], items_attributes: [:title])
    end
end
