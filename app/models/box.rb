class Box < ApplicationRecord
    has_many :box_items 
    has_many :items, through: :box_items
end
