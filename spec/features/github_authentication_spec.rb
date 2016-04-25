require "rails_helper"

feature "github authentication", focus: true do
  scenario "user signs in with github" do
    user = FactoryGirl.build(:user)
    mock_user_attributes = {
      uid: user.uid,
      provider: :github,
      info: {
        email: user.email
      }
    }

    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:github, mock_user_attributes)

    visit root_path
    click_link "GitHub"
    expect(page).to have_content("Successfully authenticated from GitHub account.")
    expect(page).to have_link("Sign Out")
  end
end
