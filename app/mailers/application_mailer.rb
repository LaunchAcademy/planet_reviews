class ApplicationMailer < ActionMailer::Base
  default from: "\"PlanetReviews\" <#{User.admin.email}>"
end
