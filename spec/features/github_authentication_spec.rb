require "rails_helper"

feature "github authentication", focus: true do
  scenario "user signs in with github" do
    user = FactoryGirl.build(:user)
    mock_omniauth(user, :github)

    visit root_path
    click_link "GitHub"
    expect(page).to have_content("Successfully authenticated from GitHub account.")
    expect(page).to have_link("Sign Out")
  end
end

def mock_omniauth(user, provider)
  OmniAuth.config.test_mode = true

  mock_user_attributes = {
    uid: user.uid,
    provider: provider,
    info: {
      email: user.email
    }
  }

  OmniAuth.config.add_mock(:github, mock_user_attributes)
end
