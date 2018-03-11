class CombineItemsInBox < ActiveRecord::Migration[5.1]
  #replace multiple items for a single item in a cart with a 
  #single item
  def up 
    Box.all.each do |box|
      #count the number of each item in the Box 
      sums = box.box_items.group(:item_id).sum(:quantity)

      sums.each do |item_id, quantity|
        if quantity > 1
          #remove indiv. items 
          box.box_items.where(item_id: item_id).delete_all 
          #replace with a single item 
          item = box.box_items.build(item_id: item_id)
          item.quantity = quantity 
          item.save! 
        end
      end 
    end
  end

  def down 
    #split items with qty > 1 into multiple items 
    BoxItem.where("quantity>1").each do |box_item|
      #add indiv items into the join table box_item
      box_item.quantity.times do
        # create individual box_item join table row instance 
        BoxItem.create(
          box_id: box_item.box_id, 
          item_id: box_item.item_id, 
          quantity: 1
        )
        end
      #remove original box_item row instance
      box_item.destroy 
    end 
  end
end
