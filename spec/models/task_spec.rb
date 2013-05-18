require 'spec_helper'

describe Task do
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:start) }

  it { should_not allow_value(DateTime.now - 50.years).for(:start) }
  it { should_not allow_value(DateTime.now + 50.years).for(:start) }

  it { should_not allow_value(DateTime.now - 50.years).for(:end) }
  it { should_not allow_value(DateTime.now + 50.years).for(:end) }

  it { should allow_value(DateTime.now).for(:start) }
  it { should allow_value(DateTime.now).for(:end) }
end
