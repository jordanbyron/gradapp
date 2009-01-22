class GraduateApplicant < ActiveRecord::Base
  belongs_to :degree_program
  belongs_to :department_status
  has_many :notes
  has_many :applicant_requirements, :order => "requirement"
  has_many :correspondences
  has_many :ppos
  has_many :attachments

  validates_presence_of       :email, :first_name, :last_name, :address1, :city, :state, :zip
  validates_email_veracity_of :email
  validates_numericality_of   :zip
  validates_length_of         :middle_name,  :within => 0..1

  def full_name
    [first_name, last_name].join(' ')
  end
  
  def last_name_first
    [last_name, first_name].join(', ')
  end
  
  def received_by_graduate_office_on
    if date_application_received_by_graduate_office == nil
      "Never"
    else
      date_application_received_by_graduate_office.strftime("%m/%d/%Y")
    end
  end
  
  def received_by_department_on
    if date_application_received_by_department == nil
      "Never"
    else
      date_application_received_by_department.strftime("%m/%d/%Y")
    end
  end

	def self.search(search,status,degree_program,page,pagination_pref,department_id)
		paginate  :per_page => pagination_pref, :page => page,
              :conditions => ['(first_name like ? or last_name like ? or studentID like ?) and department_id= ? and department_status_id like ? and degree_program_id like ?', "%#{search}%","%#{search}%","%#{search}%", department_id,"%#{status}%","%#{degree_program}%"],
              :order => 'last_name'
	end
end
