require 'spec_helper'

describe TaskCommit do
  it { should belong_to( :task ) }
  it { should validate_presence_of( :task ) }

  it { should belong_to( :commit ) }
  it { should validate_presence_of( :commit ) }
end
