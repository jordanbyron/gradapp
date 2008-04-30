class PposTemplate < ActiveRecord::Base
  belongs_to :degree_program
  has_many :prerequisite_templates
  has_many :header_templates, :order => "position"
end
