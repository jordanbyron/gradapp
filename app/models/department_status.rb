class DepartmentStatus < ActiveRecord::Base
  belongs_to :department
  belongs_to :applicant_status

  has_many :graduate_applicants
end
