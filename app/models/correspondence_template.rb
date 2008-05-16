class CorrespondenceTemplate < ActiveRecord::Base
  belongs_to :department

      validates_presence_of :title
      validates_presence_of :body
      validates_length_of   :title, :maximum=>255

  def created_date
    created_at.strftime("%m/%d/%Y")
  end
  
  def body_html
		r = RedCloth.new(body, [:hard_breaks])
		r.to_html
	end

  def generate(graduate_applicant)
    newBody = body.gsub("^ApplicantFullName^", graduate_applicant.full_name)
        
    if body.include? "^Requirements^"
      requirements = ""
      graduate_applicant.applicant_requirements.each do |r|
        requirements = [requirements, r.requirement,"\r\n"].join()
      end
      newBody = newBody.gsub("^Requirements^",requirements)
    end
    
    if body.include? "^RequirementsMet^"
      requirements = ""
      graduate_applicant.applicant_requirements.each do |r|
        if r.met?
          requirements = [requirements, r.requirement,"\r\n"].join()
        end
      end
      newBody = newBody.gsub("^RequirementsMet^",requirements)
    end
    
    if body.include? "^RequirementsNotMet^"
      requirements = ""
      graduate_applicant.applicant_requirements.each do |r|
        if !r.met?
          requirements = [requirements, r.requirement,"\r\n"].join()
        end
      end
      newBody = newBody.gsub("^RequirementsNotMet^",requirements)
    end

    if body.include? "^MailingAddress^"
      address = graduate_applicant.address1
      if graduate_applicant.address2.length > 0
        address = [address,"\r\n",graduate_applicant.address2].join()
      end
      
      address = [address,"\r\n",graduate_applicant.city,", ",graduate_applicant.state," ",graduate_applicant.zip].join()
      
      newBody = newBody.gsub("^MailingAddress^",address)
    end

    newBody = newBody.gsub("^DegreeProgram^", graduate_applicant.degree_program.name)
    newBody = newBody.gsub("^ApplicantStatus^",graduate_applicant.applicant_status.status)
    newBody = newBody.gsub("^StudentID^",graduate_applicant.studentID)
    newBody = newBody.gsub("^GPA^",graduate_applicant.gpa.to_s)
  end
end
