class Notifier < ActionMailer::Base

def support_request_submitted( support_request, user )
  # Email header info MUST be added here
  recipients 'jordan@ducksoupsoftware.com'
  from  "support@ducksoupsoftware.com"
  subject "Support Request " + support_request.id.to_s() + " - " + support_request.support_request_type

  # Email body substitutions go here
  body :support_request=> support_request, :user => user
end

end
