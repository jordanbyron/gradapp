class Department < ActiveRecord::Base
  has_many :users
  
  has_many :degree_programs
  has_many :degree_requirements, :through => :degree_programs
  has_many :graduate_applicants, :through => :degree_programs
  has_many :application_requirements
  
  has_many :correspondence_templates
  
  validates_presence_of :name
  validates_presence_of :short_name 
  validates_length_of   :name,        :maximum => 50
  validates_length_of   :short_name,  :is => 3
  
  validates_uniqueness_of :short_name

	def self.search(search,page)
		paginate  :per_page => 10, :page => page,
              :conditions => ['name like ? or short_name like ?', "%#{search}%", "%#{search}%"],
              :order => 'name'
	end
  
  def license_expires_on
    license_decrypt_expiration_date.strftime("%m/%Y")
  end
  
  def license_expired
    days = license_decrypt_expiration_date - Date.today
    days < 0
  end
  
  protected
  def license_decrypt_expiration_date
    if license_valid
      license_split = license.split('-')
      r = license_split[4].to_i
      y = license_split[2].to_i * 2
      y = y + 100
      y = y - r
      y = y / 3
      m = license_split[3].to_i - 45
      m = m + r
      m = m / 999
      #[m,'/',y].join()
      exp = Date.parse([y,'/',m,'/1'].join())
    else
      Date.parse('1900/1/1')
    end
  end
  
  
  protected
  def license_valid
    license_split = license.split('-')
    if license_split.length != 6
      false
    else
      short_check = [license_split[0].to_i.chr,license_split[1].to_i.chr, license_split[5].to_i.chr].join()
      short_check == short_name
    end
  end
end