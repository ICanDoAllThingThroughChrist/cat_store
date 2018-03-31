class Box < ApplicationRecord
    resourcify
    has_many :box_items, dependent: :destroy
    has_many :items, through: :box_items
    accepts_nested_attributes_for :items
    #belongs_to :user 
    has_many :ordersofboxes
    has_many :orders, through: :ordersofboxes
    scope :boxes_received, -> {where(received: true)}
 
    def add_item(item_id)
        box_item = self.box_items.find_by(item_id: item_id)
        if box_item 
            box_item.quantity += 1
        else 
            box_item= self.box_items.build(item_ids: item_id)
        end 
        box_item 
    end

    def self.boxes_received
        where(received: true)
    end

    def items_attributes=(item_attributes)#a method provided by accepts_nested_attributes_for :item
        #@box = set_box
        boxes= []
        boxes2= []
        boxes3= []
        item_attributes.each do |key, value|
            if key == "0"#binding.pry
                if !value[:title].empty?
                    #binding.pry#self?
                    new_item = Item.find_by(title: value[:title])
                    self.box_items                
                    # binding.pry
                    if new_item
                        if !self.box_items.empty?
                            self.box_items.each {|i| if i.item_id == new_item.id
                                binding.pry
                                i.quantity += 1
                                                    end
                                                }
                            binding.pry
                        end
                    elsif 
                            new_item = Item.create(title: value[:title])
                            self.box_items.build(item_id: new_item.id)
                            binding.pry
                            self.box_items.each {|i| boxes << i.item_id }
                            # created box1
                    end
                binding.pry
                end
            elsif key == "1"
                if !value[:title].empty?
                    new_item = Item.find_by(title: value[:title])
                    self.box_items
                    if new_item.present?
                        binding.pry
                        if !self.box_items.empty?
                            self.box_items.each {|i| if i.item_id == new_item.id
                            i.quantity += 1 
                            binding.pry 
                                                    end
                                                }
                            binding.pry
                        end
                    elsif
                            new_item = Item.create(title: value[:title])
                            self.box_items.build(item_id: new_item.id)
                            self.box_items.each {|i| boxes2 << i.item_id }
                            binding.pry 
                    end
                end
            elsif key == "2"
                if !value[:title].empty?
                    new_item = Item.find_by(title: value[:title])
                    self.box_items
                    if new_item.present?
                        if !self.box_items.empty?
                            self.box_items.each {|i| if i.item_id == new_item.id
                            i.quantity += 1  
                                                    end
                                                }
                            binding.pry
                        end
                    elsif
                        new_item = Item.create(title: value[:title])
                        self.box_items.build(item_id: new_item.id)
                        self.box_items.each {|i| boxes3 << i.item_id }
                        binding.pry 
                    end 
                end
            end 
            binding.pry
        end
        binding.pry
    end 
end