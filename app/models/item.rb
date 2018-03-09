class Item < ApplicationRecord
    has_many :box_items 
    has_many :boxes, through: :box_items
    mount_uploader :image, ImageUploader
    validate :image_size

    private 
    def image_size 
        if image.size > 5.megabytes 
            errors.add(:image, "should be less than 5MB")
        end 
    end
end
