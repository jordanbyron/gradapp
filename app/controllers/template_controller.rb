class TemplateController < ApplicationController
  before_filter :gc_required

  def index
    @correspondence_templates = CorrespondenceTemplate.find(:all, :conditions => { :department_id => current_user.department_id })
  end
end
