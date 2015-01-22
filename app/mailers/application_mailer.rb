class ApplicationMailer < ActionMailer::Base
  default from: "notifications@getnapp-stage.herokuapp.com"
  layout 'mailer'
end
