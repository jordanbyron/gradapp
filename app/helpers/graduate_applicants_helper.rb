module GraduateApplicantsHelper  

  def status_selection(status)
    options = "<option value=''>All</option>"
    DepartmentStatus.find(:all, :conditions => { :department_id => current_user.department_id }, :order => :status).each do |s|
      if s.id == status.to_i
        options += "<option value=#{s.id} selected='selected'>#{s.status}</option>"
      else
        options += "<option value=#{s.id}>#{s.status}</option>"
      end
    end
     options
  end

  def degree_program_selection(degree_program)
    options = "<option value=''>All</option>"
    DegreeProgram.find(:all, :conditions => { :department_id => current_user.department_id }, :order => :name).each do |d|
      if d.id == degree_program.to_i
        options += "<option value=#{d.id} selected='selected'>#{d.name}</option>"
      else
        options += "<option value=#{d.id}>#{d.name}</option>"
      end
    end
     options
  end

  def application_received_by_graduate_office_visibility(graduate_applicant)
    if graduate_applicant.date_application_received_by_graduate_office == nil
      "style='display:none;'"
    end
  end
  
  def application_received_by_graduate_office_checked(graduate_applicant)
    if graduate_applicant.date_application_received_by_graduate_office != nil
      "checked"
    end
  end
  
  def application_received_by_department_visibility(graduate_applicant)
    if graduate_applicant.date_application_received_by_department == nil
      "style='display:none;'"
    end
  end
  
  def application_received_by_department_checked(graduate_applicant)
    if graduate_applicant.date_application_received_by_department != nil
      "checked"
    end
  end

end
