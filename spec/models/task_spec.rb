require 'spec_helper'

describe Task do
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start) }
end
