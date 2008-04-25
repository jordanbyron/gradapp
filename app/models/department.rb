class Department < ActiveRecord::Base
  has_many :users
  
  has_many :graduate_applicants
  has_many :notes, :through => :graduate_applicants
  has_many :applicant_requirements, :through => :graduate_applicants
  has_many :correspondences, :through => :graduate_applicants
  
  has_many :degree_programs
  has_many :application_requirements, :through => :degree_programs
  
  has_many :correspondence_templates
  
  validates_presence_of :name
  validates_presence_of :short_name 
  validates_length_of   :name,        :maximum => 50
  validates_length_of   :short_name,  :is => 3
end