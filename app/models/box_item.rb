class BoxItem < ApplicationRecord
    belongs_to :box, touch:true  
    belongs_to :item, touch:true 
    # belongs_to :item
    # attr_accessor :quantity
    # attr_writer :quantity 
    # attr_reader :quantity
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
