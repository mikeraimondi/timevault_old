FactoryGirl.define do 
  factory :repository do
    name                  "test repo"
    url                   "http://github.com/foo/test_repo"
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

  factory :user do
    sequence(:email)      {|n| "email#{n}@gotimevault.com" }
    password              "foobar123"
    password_confirmation "foobar123"
    confirmed_at          DateTime.now
  end
end
