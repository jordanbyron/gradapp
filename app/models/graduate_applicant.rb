class GraduateApplicant < ActiveRecord::Base
  belongs_to :degree_program
  belongs_to :applicant_status
  has_many :notes
  has_many :applicant_requirements, :order => "requirement"
  has_many :correspondences
  has_many :ppos

  validates_presence_of       :email, :first_name, :last_name, :address1, :city, :state, :zip, :phone_day
  validates_email_veracity_of :email
  validates_numericality_of   :zip
  validates_length_of         :middle_name,  :within => 0..1

  def full_name
    [first_name, last_name].join(' ')
  end

	def self.search(search,page,department_id)
		paginate  :per_page => 10, :page => page,
              :conditions => ['(first_name like ? or last_name like ?) and department_id= ?', "%#{search}%","%#{search}%", department_id],
              :order => 'first_name'
	end
end
