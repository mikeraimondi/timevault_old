require 'spec_helper'

describe Seeders::Users do

  let(:seeder) { Seeders::Users }

  it 'seeds users' do
    user_count = User.count
    seeder.seed
    expect(User.count).to be >(user_count)
  end

  it 'can be run multiple times without duplication' do
    seeder.seed
    user_count = User.count
    seeder.seed
    expect(User.count).to eql(user_count)
  end
end
