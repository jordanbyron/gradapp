class DegreeRequirement < ActiveRecord::Base
  belongs_to :degree_program
  has_many :departments, :through => :degree_programs
  validates_presence_of :description
  #validates_format_of :description, :with=>/^...[^0-9]$/, :message => "cannot contain numbers"

  def self.search(search,page,degree_program_id)
		paginate  :per_page => 10, :page => page,
              :conditions => ['description like ? and degree_program_id = ?', "%#{search}%", degree_program_id],
              :order => 'description'
	end
end
