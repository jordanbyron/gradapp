class PrerequisiteTemplate < ActiveRecord::Base
  belongs_to :ppos_template
  acts_as_list :scope => :ppos_template
  validates_presence_of :prerequisite

end
