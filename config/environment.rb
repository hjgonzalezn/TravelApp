# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
TravelApp::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'naisatours.com',
  :user_name            => 'hj.gonzalezn',
  :password             => 'gnhj1320gml',
  :authentication       => 'plain',
  :enable_starttls_auto => true  }