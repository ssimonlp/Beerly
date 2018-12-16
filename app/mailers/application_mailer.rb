# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'thpstudent@gmail.com'
  layout 'mailer'
end
