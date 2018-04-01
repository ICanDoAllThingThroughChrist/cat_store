class BoxItemsController < ApplicationController
    before_action :set_box, only: [:create]
    before_action :set_box_item, only: [:show, :edit, :update, :destroy]
      # GET /line_items/new
  def new
    @line_item = LineItem.new
  end
    
  def create
        @box = set_box
        @order = set_order#i think
        @box.build_order(@order)#i think
        item = Item.find(params[:item_id])
        @box_item = @box.add_item(item)
        if @box_item.save
          redirect_to @box_item.box, {notice: 'Item added to box!'}
        else
          redirect_to items_path, {notice: 'Unable to add item'}
        end
  end

    # GET /line_items/1/edit
  def edit
  end

  def box_items_params 
      params.require(:box_item).permit(:item_id)
  end
end
