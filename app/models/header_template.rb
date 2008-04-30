class HeaderTemplate < ActiveRecord::Base
  belongs_to :ppos_template
  acts_as_list :scope => :ppos_template
  has_many :course_templates, :order => "position"
end
