require "rails_helper"

describe ReviewMailer do
  let(:review) { FactoryGirl.create(:review) }
  let!(:email) { ReviewMailer.new_review(review.planet) }

  it "should send the email to the planet creator" do
    expect(email).to deliver_to(review.planet.user)
  end

  it "should have a the name of the planet" do
    expect(email).to have_body_text(review.planet.name)
  end

  it "should have a subject" do
    subject = "There is a new review for #{review.planet.name}"
    expect(email).to have_subject(subject)
  end
end
