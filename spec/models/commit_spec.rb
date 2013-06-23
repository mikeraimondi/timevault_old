require 'spec_helper'

describe Commit do
  it { should belong_to(:repository) }
  it { should validate_presence_of(:repository) }

  it { should have_many(:tasks) }
  it { should have_many(:task_commits) }

  it { should have_one(:user) }

  it { should validate_presence_of (:sha1) }
  it { should allow_value('739871ba4152b74012b6508dafb35737495ab334').for(:sha1) }
  it { should_not allow_value('739871ba4152b74012b6508dafb35737495ab3341').for(:sha1) }
  it { should_not allow_value('739871ba4152b74012b6508dafb35737495ab33').for(:sha1) }
end
