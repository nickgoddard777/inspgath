# config/initializers/mailer.rb
ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
:enable_starttls_auto => true,
:address => 'smtp.gmail.com',
:port => 587,
:domain => "inspirationalgatherings.com",
:user_name => 'nicko777@gmail.com',
:password => 'NG1973goog',
:authentication => 'plain',
}

