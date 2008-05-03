class CorrespondenceTemplate < ActiveRecord::Base
  belongs_to :department

      validates_presence_of :title
      validates_presence_of :body
      validates_length_of   :title, :maximum=>255

  def created_date
    created_at.strftime("%m/%d/%Y")
  end

  def generate(graduate_applicant)
    body.gsub("^ApplicantFullName^", graduate_applicant.full_name)
  end
end
