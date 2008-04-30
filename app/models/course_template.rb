class CourseTemplate < ActiveRecord::Base
  belongs_to :header_template
  acts_as_list :scope => :header_template
end
