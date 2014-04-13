class Event < ActiveRecord::Base
  
  before_save { |event| event.guid = event.guid = SecureRandom.uuid }  
      
  
  
  default_scope where(:logical_delete => "N")
  
  belongs_to :User
  has_many :Participants

end
