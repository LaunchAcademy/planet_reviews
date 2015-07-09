require 'rails_helper'

feature 'search planets', %Q{
  As a space nerd
  I want to search my list of planets
  So that I can find my favorite
} do

  before(:each) do
    FactoryGirl.create(:planet, name: 'Earth')
    FactoryGirl.create(:planet, name: 'Venus')
  end

  scenario 'valid search' do
    visit planets_path
    fill_in 'Search', with: 'Ven'
    click_button 'Submit'

    expect(page).to have_content('Venus')
    expect(page).to_not have_content('Earth')
  end

  scenario 'no valid search parameter specified' do
    visit planets_path
    click_button 'Submit'

    expect(page).to have_content('Please specify a search phrase')
  end
end

