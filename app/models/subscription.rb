class Subscription < ApplicationRecord
    has_many :user_subscriptions 
    has_many :users, through: :user_subscriptions
    has_many :visitors, through: :visitor_subscriptions 
    has_many :visitor_subscriptions
end
