class Box < ApplicationRecord
    has_many :box_items, dependent: :destroy
    has_many :items, through: :box_items
    accepts_nested_attributes_for :items

    def items_attributes=(item_attributes)#a method provided by accepts_nested_attributes_for :item
        #@box = set_box
        item_attributes.each do |key, value|
            if key == "0"#binding.pry
                if !value[:title].empty?
                       if new_item = Item.find_by(title: value[:title])
                                    #the box creation should not create a new item, 
                                    #how to create a box to join to an existing item
                                    @box1 = Box.create
                                    #binding.pry
                                    @box1.items.build
                                    #binding.pry
                                    @box1.items.create("title" => "#{new_item.title}")
                                    # quantity of the item should be stored in a join table, 
                                    binding.pry
                                    puts "#{@box1.box_items.count}" 
                                    #@box1.box_items.quantity += 0
                        elsif new_item = Item.create(title: value[:title])
                                    # a new item is created, for there were none in Items
                                    # create a new box with new item
                                    @box1= Box.create 
                                    #@box1.items.build
                                    @box1.items.create("title" => "#{new_item.title}")
                                    puts "#{@box1.box_items.count}" 
                        end
                        # created box1
                            @box1
                end
            elsif key == "1"
                if !value[:title].empty?
                    if new_item = Item.find_by(title: value[:title])
                                #item exists, 
                                #+ to a random box
                                    @box1.items << new_item
                                    puts "#{@box1.box_items.count}" 
                    elsif new_item = Item.create("title" => "new_item.title")
                                #no items = create box2 and build a new assoc item
                                    #@box2= Box.create 
                                    #@box2.items.build
                                    @box2.items.create("title" => "#{new_item.title}")
                                    puts "#{@box2.box_items.count}" 
                    end
                        @box1 
                        @box2
                end
            elsif key == "2"
                if !value[:title].empty?
                    if new_item = Item.find_by(title: value[:title])
                                #item exists, 
                                #+ to a random box(could be box1 or box2) which has the item
                                #+ box_item quantity by 1 
                                @box1.items.each do |item|
                                    #binding.pry
                                    if item.title == new_item.title
                                        puts "#{@box1.box_items.count}" 
                                    elsif item.title != new_item.title 
                                        @box1.items.create("title" => "#{new_item.title}")
                                    end 
                                end 
                                puts "#{@box1.box_items.count}"
                                box1_items_count = "#{@box1.box_items.count}"
                                if !@box2.nil?
                                    @box2.items.each do |item|
                                        if item.title == new_item.title
                                            puts "#{@box2.box_items.count}" 
                                        elsif item.title != new_item.title 
                                            @box2.items.create("title" => "#{new_item.title}")
                                        end 
                                    end
                                    puts "#{@box2.box_items.count}"
                                    box2_items_count = "#{@box2.box_items.count}"

                                    if box1_items_count == "3" || box2_items_count == "1"
                                        puts "2 items added(box1 and box2), so delete 1 from 1 of 2 boxes"
                                    elsif  box1_items_count == "2" || box2_items_count == "0"
                                        puts "no existing item is found in either box, need to create a 3rd box" 
                                    end 
                                end
                    elsif new_item = Item.create(title: value[:title]) 
                                #no items = create box3 and build a new assoc item
                                #@box3= Box.create 
                                #@box3.items.build
                                @box3.items.create("title" => "#{new_item.title}")
                                puts "#{@box3.box_items.count}" 
                    end 
                    @box1 
                    @box2 
                    @box3
                end
            end
            @box1 
            @box2 
            @box3
            binding.pry
        end
    end 
   
end
