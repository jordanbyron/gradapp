class Ppos < ActiveRecord::Base
  belongs_to :graduate_applicant
  has_many :ppos_headers
  has_many :ppos_prerequisites

  def created_date
    created_at.strftime("%m/%d/%Y")
  end

  def expires_date
    expires_on.strftime("%m/%Y")
  end

  def prerequisite_attributes=(prerequisite_attributes)
    prerequisite_attributes.each do |attributes|
      if attributes[:met] == nil
        attributes[:met] = 0
      end
      ppos_prerequisites.build(attributes)
    end
  end

  def header_attributes=(header_attributes)
    header_attributes.each do |attributes|
      ppos_headers.build(attributes)
    end
  end

  def course_attributes=(course_attributes)
    #course_attributes.each do |attributes|
    #  header = ppos_headers.find(:first, :conditions => {:position => attributes[:header_position]})
    #    header.build(attributes)
    #end
  end

end
