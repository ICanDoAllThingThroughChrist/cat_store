class Ordersofbox < ApplicationRecord
    belongs_to :order
    belongs_to :box
end