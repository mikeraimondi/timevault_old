FactoryGirl.define do 
  factory :user do
    sequence(:email)      {|n| "email#{n}@gotimevault.com" }
    password              "foobar123"
    password_confirmation "foobar123"
  end

  factory :short_pwd_user do
    email                 "foo@bar.com"
    password              "foobar"
    password_confirmation "foobar"
  end

  factory :task do
    user
    name                  "test task"
    start                 DateTime.now 
  end

  factory :repository do
    name                  "test repo"
    url                   "http://github.com/foo/test_repo"
  end
end
