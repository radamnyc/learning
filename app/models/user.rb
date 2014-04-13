class User < ActiveRecord::Base
  self.table_name = 'Users'
  self.primary_key = 'id'
        
    #attr_accessible :first_name, :last_name, :email, :phone, :user_address1, :user_address2, :user_state, :user_zip, :password#, :password_confirmation
    validates :first_name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 6 }
#    validates :password_confirmation, presence: true
      
    before_save { |user| user.email = email.downcase }
    before_save { |user| user.guid = user.guid = SecureRandom.uuid }  
    
    default_scope where(:logical_delete => "N")
    
    has_many :events
end
