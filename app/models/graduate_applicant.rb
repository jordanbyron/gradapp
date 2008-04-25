class GraduateApplicant < ActiveRecord::Base
  belongs_to :department
  belongs_to :applicant_status
  has_many :notes
  has_many :applicant_requirements
  has_many :correspondences

	def self.search(search,page)
		paginate :per_page => 4, :page => page,
				 :conditions => ['first_name like ?', "%#{search}%"],
				 :order => 'first_name'
	end
end
