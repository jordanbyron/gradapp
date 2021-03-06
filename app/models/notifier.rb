class Notifier < ActionMailer::Base

  def support_request_submitted( support_request, user )
    # Email header info MUST be added here
    recipients 'jordan@ducksoupsoftware.com'
    from  "support@ducksoupsoftware.com"
    subject "Support Request " + support_request.id.to_s() + " - " + support_request.support_request_type

    # Email body substitutions go here
    body :support_request=> support_request, :user => user
  end

  def user_added( user, password )
    recipients user.email
    from  "donotreply@ducksoupsoftware.com"
    content_type "text/html"
    subject user.first_name + ", Welcome to GradApp!"
    # Email body substitutions go here
    body :user => user, :password => password
  end
  
  def user_logged_in( user )
    recipients "2035062957@txt.att.net"
    from "donotreply@ducksoupsoftware.com"
    content_type "text/html"
    subject user.first_name + " logged in from #{user.last_ip}"
    # Email body substitutions go here
    body :user => user
  end

end
