class Order < ApplicationRecord
    attr_accessor :title, :boxes_attribute
    has_many :boxes, dependent: :destroy
    accepts_nested_attributes_for :boxes, allow_destroy:true
    belongs_to :user, touch:true 
    belongs_to :subscription, touch:true
end
