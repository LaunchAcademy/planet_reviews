class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.planet.user.email,
      subject: "New review posted for #{review.planet.name}"
    )
  end
end
