class Attachments < ActiveRecord::Base
  belongs_to :graduate_applicant
  
  validates_presence_of :title
  
  has_attached_file :file,
                  :url  => "/assets/graduate_applicants/:id/:basename.:extension",
                  :path => ":rails_root/public/assets/graduate_applicants/:id/:basename.:extension"
end
