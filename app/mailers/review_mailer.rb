class ReviewMailer < ActionMailer::Base
  default from: "\"Planet Reviews\" <user@example.com>"

  def new_review(planet)
    @planet = planet
    subject = "There is a new review for #{planet.name}"
    mail(to: planet.user.email, subject: subject)
  end
end
