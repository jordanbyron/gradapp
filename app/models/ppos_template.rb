class PposTemplate < ActiveRecord::Base
  belongs_to :degree_program
  has_many :prerequisite_templates, :order => "position"
  has_many :header_templates, :order => "position"
end
