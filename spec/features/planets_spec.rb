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

  scenario "user fills in form correctly" do
    sign_in user

    visit new_planet_path

    fill_in "Name", with: "Mercury"
    fill_in "Mass", with: "328.5E21 kg"
    fill_in "Description", with: "Quite a hot place"
    click_on "Create Planet"

    expect(page).to have_content("New planet, Mercury, created")
  end

  scenario "user forgets to fill out fields" do
    sign_in user

    visit new_planet_path
    click_on "Create Planet"
    expect(page).to have_content("can't be blank")
  end

end
