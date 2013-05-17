require 'spec_helper'

describe Interval do
  it { should belong_to( :pomodoro ) }
  it { should validate_presence_of( :start ) }
end
