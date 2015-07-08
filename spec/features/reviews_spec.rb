require "rails_helper"

feature "reviews" do
  let(:user) { FactoryGirl.create(:user) }
  let(:planet) { FactoryGirl.create(:planet) }

  scenario "user reviews a planet", focus: true do
    sign_in user
    visit planet_path(planet)
    select 5, from: "Rating"
    fill_in "Body", with: "I think I might visit there again, someday."
    click_button "Create Review"
    expect(page).to have_content("Thanks for your input!")
  end
end
