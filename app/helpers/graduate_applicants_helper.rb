module GraduateApplicantsHelper  

  def status_selection(status)
    options = "<option value=''>All</option>"
    ApplicantStatus.find(:all).each do |s|
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
    DegreeProgram.find(:all, :conditions => { :department_id => current_user.department_id }).each do |d|
      if d.id == degree_program.to_i
        options += "<option value=#{d.id} selected='selected'>#{d.name}</option>"
      else
        options += "<option value=#{d.id}>#{d.name}</option>"
      end
    end
     options
  end

end
