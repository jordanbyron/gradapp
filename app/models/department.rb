class Department < ActiveRecord::Base
  has_many :users
  
  validates_presence_of :name
  validates_presence_of :short_name 
  validates_length_of   :short_name,    :within => 3..3
end
