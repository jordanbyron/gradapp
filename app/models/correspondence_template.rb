class CorrespondenceTemplate < ActiveRecord::Base
  belongs_to :department
  
  def created_date
    created_at.strftime("%m/%d/%Y")
  end
end
