class DegreeProgram < ActiveRecord::Base
  belongs_to :department
  has_many :graduate_applicants
  has_many :degree_requirements
  has_one :ppos_template
  validates_presence_of :name
  validates_format_of :name, :with=>/^...[^0-9]$/, :message => "cannot contain numbers"

  def self.search(search,page,department_id)
		paginate  :per_page => 10, :page => page,
              :conditions => ['name like ? and department_id = ?', "%#{search}%", department_id],
              :order => 'name'
	end
end
