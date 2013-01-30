# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Fulcrum::Application.initialize!

Fulcrum::Application.configure do
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.perform_deliveries = true
  # ActionMailer::Base.default_charset = 'utf-8'
  ActionMailer::Base.default_url_options = { :host => FULCRUM_MAILER_HOST }
  
  ActionMailer::Base.smtp_settings = {
    :address   => FULCRUM_SMTP_SERVER,
    :domain    => FULCRUM_MAILER_DOMAIN_NAME,
    :user_name => FULCRUM_MAILER_USER_NAME,
    :password  => FULCRUM_MAILER_PWD,
    :enable_starttls_auto => true,
    :port => FULCRUM_MAILER_PORT, 
    :authentication => FULCRUM_MAILER_AUTHENTICATION_METHOD
  }
end