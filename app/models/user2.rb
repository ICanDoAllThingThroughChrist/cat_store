class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  has_many :boxes 
  has_secure_password
  #belongs_to :current_box, :class_name => "Box" #this line prevents user sign up
  belongs_to :current_box, :class_name => "Box"
  def create_current_box 
    new_box = boxes.create 
    self.current_box_id = new_box.id 
  end 

  def remove_box 
    self.current_box_id = nil 
    save
  end 

end
