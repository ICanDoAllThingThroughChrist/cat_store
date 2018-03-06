class BoxItem < ApplicationRecord
    belongs_to :box 
    belongs_to :item
end
