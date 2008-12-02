# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def current_announcements
    @current_announcements ||= Announcement.current_announcements(session[:announcement_hide_time])
  end

  def production?
    @is_production ||=(ENV['RAILS_ENV']=='production')
  end

  def version
    '1.0 RC1'
  end
end
