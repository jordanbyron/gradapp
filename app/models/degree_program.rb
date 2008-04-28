class DegreeProgram < ActiveRecord::Base
  belongs_to :department
  has_many :degree_requirements
  
  def self.search(search,page,department_id)
		paginate  :per_page => 10, :page => page,
              :conditions => ['name like ? and department_id = ?', "%#{search}%", department_id],
              :order => 'name'
	end
end
