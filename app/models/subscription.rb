class Subscription < ApplicationRecord
    #belongs_to :user
    has_many :visitors, through: :visitor_subscriptions 
    has_many :visitor_subscriptions

    has_many :visitorsubscriptions

end
