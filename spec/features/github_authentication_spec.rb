require "rails_helper"

feature "github authentication", focus: true do
  scenario "user signs in with github" do
    visit root_path
    click_link "GitHub"
    expect(page).to have_link("Sign Out")
  end
end
