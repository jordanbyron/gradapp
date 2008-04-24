class GraduateApplicant < ActiveRecord::Base
  belongs_to :department
  has_many :notes
  has_many :applicant_requirements
  has_many :correspondences
end
