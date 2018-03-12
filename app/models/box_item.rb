class BoxItem < ApplicationRecord
    belongs_to :box 
    belongs_to :item
    def create
        current_user.create_current_box unless current_user.current_box
        box_item = current_user.current_box.add_item(params[:item_id])
        if box_item.save
          redirect_to box_path(current_user.current_box), {notice: 'Item added to box!'}
        else
          redirect_to box_path, {notice: 'Unable to add item'}
        end
    end
end
