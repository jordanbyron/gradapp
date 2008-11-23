class SupportRequest < ActiveRecord::Base

  def created_datetime
    created_at.strftime("%m/%d/%Y %I:%M %p")
  end

end
