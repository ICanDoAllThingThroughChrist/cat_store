class Admin::BoxesController < Admin::ApplicationController
  def new 
           #@user = current_user
           binding.pry
           #@box = @user.boxes.build
           #@box = set_box
           @box = Box.new
            3.times do
               @box.items.build
           end
           @item = Item.all 
  end
  def create
    # binding.pry
    @item = Item.all
    # binding.pry
    @box = Box.new(box_params)
    # binding.pry
    if @box.save 
      flash[:notice] = "Box has been created."
      redirect_to @box 
    else
      flash[:alert] = "Box has not been created."
      render "new"
    end
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

  def manual_ship
  end
end
