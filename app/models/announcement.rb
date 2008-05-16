class Announcement < ActiveRecord::Base

  def self.current_announcements(hide_time)
    with_scope :find => { :conditions => ["starts_at <= ? AND ends_at >= ?", Time.now, Time.now] } do
      if hide_time.nil?
        find(:all)
      else
        find(:all, :conditions => ["updated_at > ? OR starts_at > ?", hide_time, hide_time])
      end
    end
  end

  def message_html
    r = RedCloth.new message
		r.to_html
  end

end
