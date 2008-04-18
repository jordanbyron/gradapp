module UsersHelper

  def hide_department(hide)
    if hide
      render :text => "style='display:none;'" 
    end
  end

end