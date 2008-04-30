class PposTemplate < ActiveRecord::Base
  belongs_to :degree_program
  has_one :consentrations_template
  has_many :prequisite_templates
  has_many :header_templates, :order => "position"
end
