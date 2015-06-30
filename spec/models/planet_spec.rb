require 'rails_helper'

RSpec.describe Planet, type: :model do
  it { should belong_to(:user) }

  it { should have_valid(:name).when("Earth", "Venus", "Jupiter") }
  it { should_not have_valid(:name).when(nil, "") }
end
