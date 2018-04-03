class User < ApplicationRecord
# you can also explicitly define enum as:  enum access_level: [:employee => 0, :company_admin => 1, :super_admin => 2}
    enum access_level: [:visitor, :subscriber, :admin]
    attr_accessor :remember_token, :activation_token, :reset_token
    before_create :create_activation_digest
    before_save { self.email = email.downcase }
    #validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    has_many :orders
    has_many :subscriptions, through: :orders
    has_many :boxes 
    has_many :orders_of_boxes, :through => :boxes, :source => :subscriber_boxes
    belongs_to :role
    #  def role_name=(name)
    #      self.role= Role.find_by(name: name)
    #      binding.pry
    #  end 

    #  def self.role_name 
    #      self.role.name
    #      binding.pry  
    #  end 
    def create_current_box 
        new_box = boxes.create 
        self.current_cart_id = new_cart.id 
        save 
    end
    def remove_cart 
        self.current_cart_id = nil 
    end
    # returns random token
    def pasword_reset_expired?
        reset_sent_at < 2.hours.ago 
    end 
     
    def self.new_token 
        SecureRandom.urlsafe_base64 
    end

    def remember 
        self.remember_token = User.new_token 
        update_attribute(:remember_digest, User.digest(:remember_token))
    end 

    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end

    def forget 
        update_attribute(:remember_digest, nil)
    end
    #sets password reset attributes
    def create_reset_digest
        self.reset_token = User.new_token
        update_attribute(:reset_digest,  User.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end
    # sends password reset email
    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end

    def activate 
        update_attribute(:activated, true)
        update_attribute(:activated_at, Time.zone.now)
    end

    def send_activation_email 
        UserMailer.account_activation(self).deliver_now 
    end 
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    private
    def create_activation_digest
        self.activation_token = User.new_token
        self.activation_digest = User.digest(activation_token)
    end 

    
end
