class Note < ActiveRecord::Base
  belongs_to :graduate_applicant
  
  def created_date
    created_at.strftime("%m/%d/%Y")
  end

  def updated_date
    updated_at.strftime("%m/%d/%Y")
  end
end
