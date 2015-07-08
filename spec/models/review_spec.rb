require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to(:planet) }

  it { should have_valid(:rating).when(1, 2, 3, 4, 5) }
end
