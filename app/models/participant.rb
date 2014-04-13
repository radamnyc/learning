class Event < ActiveRecord::Base
  # attr_accessible :title, :body
  
  default_scope where(:logical_delete => "N")
  
  belongs_to :event
  
end
