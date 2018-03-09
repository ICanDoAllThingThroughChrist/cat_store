class Box < ApplicationRecord
    has_many :box_items 
    has_many :items, through: :box_items
    validates :title, presence: true
    validates :month, presence: true 
    validates :year, presence: true
    validates :subscription_level, presence: true
end
