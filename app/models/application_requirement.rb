class ApplicationRequirement < ActiveRecord::Base
  belongs_to :department
  validates_presence_of :description

	def self.search(search,page,department_id)
		paginate  :per_page => 10, :page => page,
              :conditions => ['description like ? and department_id = ?', "%#{search}%", department_id],
              :order => 'description'
	end
end
