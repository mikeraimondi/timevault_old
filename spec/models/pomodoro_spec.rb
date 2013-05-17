require 'spec_helper'

describe Pomodoro do
  it { should belong_to( :user ) }
  it { should have_many ( :intervals ) }
end
