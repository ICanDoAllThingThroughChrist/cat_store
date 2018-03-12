class BoxItemsController < ApplicationController
    include CurrentBox
    before_action :set_box, only: [:create]
    before_action :set_box_item, only: [:show, :edit, :update, :destroy]
    def create
        @box = set_box
        item = Item.find(params[:item_id])
        @box_item = @box.add_item(item)
        if @box_item.save
          redirect_to @box_item.box, {notice: 'Item added to box!'}
        else
          redirect_to items_path, {notice: 'Unable to add item'}
        end
    end

    def box_items_params 
      params.require(:box_item).permit(:item_id)
    end
end
