# Load the Rails application.
require_relative 'application'

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['MAILJET_LOGIN'],
  :password => ENV['MAILJET_PWD'],
  :domain => 'monsite.fr',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

ActionMailer::Base.smtp_settings =   {
  :address            => 'smtp.gmail.com',
  :port               => 587,
  :domain             => 'gmail.com', #you can also use google.com
  :authentication     => :plain,
  :user_name          => ENV['GMAIL_LOGIN'],
  :password           => ENV['GMAIL_PWD']
}
# Initialize the Rails application.
Rails.application.initialize!
