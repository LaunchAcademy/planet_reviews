require 'rails_helper'

RSpec.describe Planet, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:reviews) }

  it { should have_valid(:name).when("Earth", "Venus", "Jupiter") }
  it { should_not have_valid(:name).when(nil, "") }

  describe "uniqueness" do
    it "must have a unique name" do
      planet = FactoryGirl.create(:planet)
      same_planet = FactoryGirl.build(:planet, name: planet.name)
      expect { same_planet.save! }.to raise_error
    end
  end

  describe "searching" do
    it 'matches by name' do
      3.times { FactoryGirl.create(:planet) }

      results = Planet.search(Planet.last.name)
      expect(results).to include(Planet.last)
    end

    it 'matches by partial name' do
      3.times { FactoryGirl.create(:planet) }

      results = Planet.search(Planet.last.name[0..3])
      binding.pry
      expect(results).to include(Planet.last)
    end
  end
end
