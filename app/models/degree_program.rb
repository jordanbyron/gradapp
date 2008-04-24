class DegreeProgram < ActiveRecord::Base
  belongs_to :department
  has_many :application_requirements
end
