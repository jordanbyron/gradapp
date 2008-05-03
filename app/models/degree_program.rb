class DegreeProgram < ActiveRecord::Base
  belongs_to :department
  has_many :graduate_applicants
  has_many :degree_requirements
  has_one :ppos_template

  def self.search(search,page,department_id)
		paginate  :per_page => 10, :page => page,
              :conditions => ['name like ? and department_id = ?', "%#{search}%", department_id],
              :order => 'name'
	end
end
