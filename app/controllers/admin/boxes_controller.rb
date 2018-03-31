class Admin::BoxesController < Admin::ApplicationController
  #- As an administrator I want
  # to be able to create a new 
  #box (subscription level, 
  #month and year to uniquely#
  # identify it and a title 
  #for the theme e.g. “cat coolers for summer”)
  def new 
           #@user = current_user
           binding.pry
           #@box = @user.boxes.build
           #@box = set_box
           @box = Box.new
           @box.items.build
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
