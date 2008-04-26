class ApplicantStatus < ActiveRecord::Base
  has_many :graduate_applicants

  validates_presence_of   :status
  validates_presence_of   :short_status 
  validates_length_of     :status,          :maximum => 30
  validates_length_of     :short_status,    :is => 1
  validates_uniqueness_of :short_status

	def self.search(search,page)
		paginate  :per_page => 10, :page => page,
              :conditions => ['status like ? or short_status like ?', "%#{search}%", "%#{search}%"],
              :order => 'status'
	end
end
