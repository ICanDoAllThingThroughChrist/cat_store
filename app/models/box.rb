class Box < ApplicationRecord
    has_many :box_items, dependent: :destroy
    has_many :items, through: :box_items
    accepts_nested_attributes_for :items

    def items_attributes=(item_attributes)#a method provided by accepts_nested_attributes_for :item
        #@box = set_box
        item_attributes.each do |key, value|
            #binding.pry
            if !value[:title].empty?
                    binding.pry
                    c = 1
                    while c < 3
                    new_item = Item.find_by(title: value[:title])
                    if !new_item.nil?
                        #how to create a box to join to an existing item
                    else
                        @boxes = [] 
                        @box.box_items.each do |box_item| 
                            if box_item.item_id == new_item.id
                                        box_item.quantity += 1
                            elsif box_item.item_id != new_item.id
                                        @boxes << Box.create(:item_ids => new_item.id)
                            end
                        end
                    c += 1
                    end  
                    @boxes 
            end
        end
    end 

    # To meet the nested form 
    # and custom attribute writer you should be 
    # able to add up to three items to the box 
    # as part of creating the box, 
    # and if their (3 item's attributes' titles ) 
    # title matches exactly an existing item, 
    # the box creation should not create a new item, 
    # the box creation should just 
    # join an existing item. 
    # The quantity of the item should 
    # be stored in a join table,  
    # (thus joining the boxes and the items) 
    # so one box may have the 3 oz kitty bright hair gel and 
    # another "box" might have the 6oz.

    def box_item_title_value_comparison
        binding.pry
        @box = Box.create
        new_item = Item.find_by(title: value[:title])
        if @box.items == [] && new_item.present?
            binding.pry
            @box.items.push new_item
        else
            c = 1
            while c < 3
            @boxes = [] 
                @box.box_items.each do |box_item| 
                    if box_item.item_id == new_item.id
                        box_item.quantity += 1
                    elsif box_item.item_id != new_item.id
                        @boxes << Box.create(:item_ids => new_item.id)
                    end
                    c += 1
                end
            end 
            @boxes
        end 
    end
        

end
