class ApplicantStatus < ActiveRecord::Base
  has_many :graduate_applicants
end
