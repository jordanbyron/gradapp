class CourseTemplate < ActiveRecord::Base
  belongs_to :header_template
  validates_presence_of :short_dept_name, :course_number, :course_name, :credits
  validates_length_of :short_dept_name, :is=>3
  #validates_format_of :short_dept_name, :with=>/^...[^0-9]$/, :message => "cannot contain numbers"
  validates_numericality_of :course_number, :credits
  acts_as_list :scope => :header_template
end
