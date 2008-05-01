class Correspondence < ActiveRecord::Base
  belongs_to :graduate_applicant
  validates_presence_of :text, :type
end
