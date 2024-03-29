require 'spec_helper'

describe Repository do
  it { should have_many(:commits) }

  it { should validate_presence_of(:name) }

  it { should belong_to(:user) }
end
