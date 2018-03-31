class Order < ApplicationRecord
    belongs_to :user 
    belongs_to :subscription
    has_many :ordersofboxes
    has_many :boxes, through: :ordersofboxes
end
