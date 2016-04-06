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
      expect { same_planet.save! }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
