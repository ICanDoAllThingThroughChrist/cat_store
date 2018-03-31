class BoxesController < ApplicationController
    #include CurrentBox
    include SessionsHelper
    #before_action :set_box, only: [:show, :edit, :update, :destroy]
    # before_action :load_boxes, only: :index
    # load_and_authorize_resource
    # skip_authorization_check
    #rescue_from ActiveRecord::RecordNotFound, with: :invalid_box
    #skip_before_filter :authorize, :only => [:index, :show]
    def index
        @boxes = Box.all
        # authorize! :index, @box
    end
    def new 
            @user = current_user
            binding.pry
            #@box = @user.boxes.build
            #@box = set_box
            @box = Box.new
            #authorize! :new, @box
             3.times do
                @box.items.build
            end
            @item = Item.all
    end
    def create 
        binding.pry
        @item = Item.all
        #binding.pry
        #because once again load_resource takes care of this for us.
        @box = Box.new(box_params)  
        binding.pry
        if current_user#e.g. subscriber
            if @box.save 
                #binding.pry
                @user = current_user
                #binding.pry
                @user.subscriber= true #after_action assigns user to be a subscriber
                #binding.pry
                flash[:notice] = "Box has been created."
                redirect_to @box 
            else
                flash[:alert] = "Box has not been created."
                render "new"
            end
        else 
            flash[:alert] = "please sign up for subscription And log in as subscriber to create a box"
            redirect_to login_url
        end
    end
    def show
        @box = Box.find(params[:id])
        #binding.pry
    end
    def edit
       @box = Box.find(params[:id])
        # authorize! :edit, @box
    end
    def update 
        @box = Box.find(params[:id])
        if @box.update(box_params)
            flash[:notice] = "box has been updated."
            redirect_to @box
        else
            flash.now[:alert] = "box has not been updated."
            render "edit"
        end
    end 
    def destroy
        @box = Box.find(params[:id])
        @box.destroy
        flash[:notice] = "box has been deleted."
        redirect_to boxes_path
    end
    #As a subscriber I want to see what boxes i received
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
    def manual_ship
        if current_user.admin?
            @users = User.find_by_sql(select: User, where: subscriber == true)
            @boxes = Box.find_by_sql(select: Box, where: shipped == true)
    end
    #As an administrator I want to be able to manually
    # ship a box (when I click the “ship” button on the
    # box it adds it to the history for all current 
    #subscribers - but not subscribers who have cancelled)

end

private
    def invalid_box
    logger.error "Attempt to access invalid box #{params[:id]}"
    redirect_to boxes_ptah, flash[:notice]='invalid box'
    end
    def load_boxes
        @boxes = Box.accessible_by(current_ability).order('created_at DESC')
      end
    def box_params
        params.require(:box).permit(:user_id, :subscription_level,:month,:year,:title, item_ids:[], items_attributes: [:title])
    end
end
