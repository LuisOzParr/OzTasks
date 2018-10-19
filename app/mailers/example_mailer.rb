class ExampleMailer < ActionMailer::Base
  default from: "lgozuna@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'TODO LIST')
  end
end