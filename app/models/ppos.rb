class Ppos < ActiveRecord::Base
  belongs_to :graduate_applicant
  has_many :ppos_headers
  has_many :ppos_prerequisites

  def created_date
    created_at.strftime("%m/%d/%Y")
  end

end
