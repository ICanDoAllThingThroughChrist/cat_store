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
            #binding.pry
            if !value[:title].empty?
                new_item = Item.find_or_create_by(title: value[:title])
                box_item = self.box_items.find_by(item_id: new_item.id)
                #binding.pry 
                    if box_item
                        box_item.quantity += 1
                        #binding.pry
                    else
                        box_item = self.box_items.build(item_id: new_item.id)
                        #binding.pry
                    end
                    box_item
                    #binding.pry   
            end 
        end
    end 
end
