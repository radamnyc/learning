class User < ActiveRecord::Base
  self.table_name = 'Users'
  self.primary_key = 'id'
        
    validates :first_name, presence: true
    validates :last_name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password_digest, presence: true, length: { minimum: 6 }
    validates :phone, presence: true, length: { minimum: 10, maximum: 10}
#    validates :password_confirmation, presence: true
      
    before_save { |user| user.email = email.downcase }
    before_save { |user| user.guid = user.guid = SecureRandom.uuid }  
    
    default_scope where(:logical_delete => "N")
    
    has_many :events
    
    has_secure_password
end
