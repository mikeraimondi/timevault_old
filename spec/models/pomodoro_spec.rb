require 'spec_helper'

describe Pomodoro do
  it { should belong_to( :user ) }
  it { should validate_presence_of( :user ) }

  it { should validate_presence_of( :duration ) }

  it { should have_many( :intervals ) }
end
