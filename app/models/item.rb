class Item < ApplicationRecord
    has_many :box_items 
    has_many :boxes, through: :box_items
end
