class Visitorsubscription < ApplicationRecord
    belongs_to :subscription
    def subscription_level=(level)
        self.subscription = subscription.find_by(level: level)
      end
      
    def subscription_level
         self.subscription.level
    end
end
