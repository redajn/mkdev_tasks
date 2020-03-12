class ApplicationMailer < ActionMailer::Base
  default from: Settings.mailer.email
  layout Setting.mailer.layout
end
