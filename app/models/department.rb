class Department < ActiveRecord::Base
  has_many :users
  has_many :graduate_applicants
  
  validates_presence_of :name
  validates_presence_of :short_name 
  validates_length_of   :short_name,    :within => 3..3
end
