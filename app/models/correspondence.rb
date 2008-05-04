class Correspondence < ActiveRecord::Base
  belongs_to :graduate_applicant
  validates_presence_of :text, :type
  
  def sent_on
    created_at.strftime("%m/%d/%Y")
  end
  
  def body_html
		r = RedCloth.new text
		r.to_html
	end
  
  def body_short
    [text.slice!(0..50),'...'].join()
  end
end
