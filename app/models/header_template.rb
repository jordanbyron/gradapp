class HeaderTemplate < ActiveRecord::Base
   belongs_to :ppos_template
   has_many :course_templates
end
