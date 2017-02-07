require "rails_helper"

feature "user creates a planet", %q(

  As an authenticated user
  I want to add a planet
  So that I can review it

  Acceptance Criteria:
    [x] I must be signed in
    [x] I must specify a planet name
    [ ] Planet name must be unique
    [ ] Planet mass is an optional field
    [ ] Description is an optional field
    [ ] We can trace this entry back to a user
) do

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in(user) }

  scenario "user fills in form correctly" do
    visit new_planet_path

    fill_in "Name", with: "Mercury"
    fill_in "Mass in kg", with: "3.285E23"
    fill_in "Description", with: "Quite a hot place"
    click_on "Create Planet"

    expect(page).to have_content("New planet, Mercury, created")
  end

  scenario "user forgets to fill out fields" do
    visit new_planet_path
    click_on "Create Planet"
    expect(page).to have_content("can't be blank")
  end

  scenario "user adds a photo" do
    visit root_path
    click_link "Add a Planet"

    fill_in "Name", with: "HD131399Ab"
    attach_file :planet_photo, "#{Rails.root}/spec/support/images/HD131399Ab.jpg"
    click_button "Create Planet"

    expect(page).to have_content("New planet, HD131399Ab, created")

    visit planets_path
    expect(page).to have_css("img[src*='HD131399Ab.jpg']")
  end

end
