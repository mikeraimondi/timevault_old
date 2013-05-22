require 'spec_helper'

describe Task do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:start) }

  it { should_not allow_value(DateTime.now - 50.years).for(:start) }
  it { should_not allow_value(DateTime.now + 50.years).for(:start) }

  it { should_not allow_value(DateTime.now - 50.years).for(:end) }
  it { should_not allow_value(DateTime.now + 50.years).for(:end) }

  it { should allow_value(DateTime.now).for(:start) }
  it { should allow_value(DateTime.now).for(:end) }

  it { should have_many(:commits) }

  it "saves a new commit" do
    user = FactoryGirl.create(:user)
    task = FactoryGirl.build(:task)
    task.user = user
    task.save
    repository = FactoryGirl.create(:repository)
    commit = task.commits.new 
    commit.sha1 = '99176f8869f182b1e183792c9e445d34f4dfb7b3'
    commit.repository = repository
    expect(commit.save).to eq(true)
  end

  it { should accept_nested_attributes_for(:commits)}
end
