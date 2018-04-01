class Subscription < ApplicationRecord
    has_many :orders 
    has_many :user, through: :orders
end
