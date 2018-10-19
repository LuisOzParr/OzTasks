class WeeklyEmail
  include Sidekiq::Worker

  def perform(*args)
    User.all.each do |user|
      ExampleMailer.sample_email(user).deliver_now
    end
  end
end
