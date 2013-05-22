require 'spec_helper'

describe User do

  it { should allow_value("strongpassword").for(:password) }
  it { should_not allow_value("foo").for(:password) }
  it { should have_many(:tasks) }

  it { should have_many(:intervals) }

  it { should have_many( :repositories ) }

  it { should have_many( :commits ) }

  let(:user) { FactoryGirl.create(:user) }
  it "has email foo@bar.com" do
    user.email.should == 'foo@bar.com'
  end

end
