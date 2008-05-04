class Note < ActiveRecord::Base
  belongs_to :graduate_applicant
  validates_presence_of :text

  def created_date
    created_at.strftime("%m/%d/%Y")
  end

  def updated_date
    updated_at.strftime("%m/%d/%Y")
  end

	def self.search(search,page,graduate_applicant_id)
		paginate  :per_page => 5, :page => page,
              :conditions => ['text like ? and graduate_applicant_id = ?', "%#{search}%", graduate_applicant_id],
              :order => 'id'
	end

	def note_html
		r = RedCloth.new text
		r.to_html
	end
end
