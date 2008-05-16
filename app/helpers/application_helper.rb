# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def current_announcements
    @current_announcements ||= Announcement.current_announcements(session[:announcement_hide_time])
  end

end
