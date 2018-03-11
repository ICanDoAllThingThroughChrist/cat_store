class Box < ApplicationRecord
    has_many :box_items, dependent: :destroy
    has_many :items, through: :box_items
    # validates :title, presence: true
    # validates :month, presence: true 
    # validates :year, presence: true
    # validates :subscription_level, presence: true
    accepts_nested_attributes_for :items 

    def add_item(item)
        box_item = self.box_items.find_by(item_id: item.id)
        if box_item
          box_item.quantity += 1
        else
          box_item = self.box_items.build(item_id: item.id)
        end
        box_item
      end
    def items_attributes=(item_attributes)#a method provided by accepts_nested_attributes_for :item
        item_attributes.each do |key, value|
            binding.pry
            if !value[:title].empty?
                binding.pry
                if new_item = Item.find_by(title: value[:title])
                    binding.pry
                    self.box_items.each do |box_item|
                        if new_item.title == box_item.item.title
                            box_item.quantity += 1 #The quantity of the item should be stored in a join table joining the boxes and the items
                        else 
                            self.box_items 
                        end               
                    end
                    binding.pry
                else 
                    self.items.build(title: value[:title])
                end 
            end 
        end
    end 
end
