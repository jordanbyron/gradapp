class SupportRequest < ActiveRecord::Base
  validates_presence_of :summary
  validates_presence_of :explination


  def validate
    errors.add :support_request_type, "must be selected" if self.support_request_type == "Please select one ..."
  end


  def created_datetime
    created_at.strftime("%m/%d/%Y %I:%M %p")
  end

end
