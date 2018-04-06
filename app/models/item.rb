class Item < ApplicationRecord
    attr_accessor :image_cache, :image
    #belongs_to :box_item
    has_many :box_items 
    has_many :boxes, through: :box_items
    mount_uploader :image, ImageUploader
    validate :image_size

    before_destroy :ensure_not_referenced_by_any_box_item
    def box_name=(name)
        self.box = Box.find_or_create_by(title: title)
      end
    
      def box_name
         self.box.name
      end
    
    private 
    # def ensure_not_referenced_by_any_box_item
    #     unless :box_items.empty? 
    #         errors.add(:base, 'Box Items present') 
    #         throw :abort 
    #     end 
    # end 

    def image_size 
        if image.size > 5.megabytes 
            errors.add(:image, "should be less than 5MB")
        end 
    end
end
