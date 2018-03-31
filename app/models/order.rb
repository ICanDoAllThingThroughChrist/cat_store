class Order < ApplicationRecord
    attr_accessor :title, :boxes_attribute
    has_many :boxes
    accepts_nested_attributes_for :boxes, allow_destroy:true
    belongs_to :user 
    belongs_to :subscription
end
