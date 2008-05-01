class CorrespondenceTemplate < ActiveRecord::Base
  belongs_to :department

      validates_presence_of :title
      validates_presence_of :body
      validates_length_of   :title, :maximum=>255

  def created_date
    created_at.strftime("%m/%d/%Y")
  end
end
