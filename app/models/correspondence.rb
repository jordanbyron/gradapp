class Correspondence < ActiveRecord::Base
  belongs_to :graduate_applicant
  validates_presence_of :text, :type
  
	def self.search(search,page,graduate_applicant_id)
		paginate  :per_page => 5, :page => page,
              :conditions => ['text like ? and graduate_applicant_id = ?', "%#{search}%", graduate_applicant_id],
              :order => 'id'
	end
  
  def sent_on
    created_at.strftime("%m/%d/%Y")
  end

  def sent_datetime
    created_at.strftime("%m/%d/%Y %I:%M %p")
  end
  
  def body_html
		r = RedCloth.new(text)
		r.to_html
	end
  
  def body_short
    [text.slice!(0..50),'...'].join()
  end
end
