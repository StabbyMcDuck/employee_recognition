# frozen_string_literal: true

# Send emails to people
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
