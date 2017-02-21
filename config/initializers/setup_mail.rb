ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "asciicasts.com",
  :user_name            => "employeerecognitioncenter",
  :password             => "asdf12345",
  :authentication       => "plain",
  :enable_starttls_auto => true
}