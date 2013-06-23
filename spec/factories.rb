FactoryGirl.define do 
  factory :pomodoro do
    user
    duration              30
    period                "productive"

    before (:create) do |pomodoro|
      pomodoro.intervals << FactoryGirl.create(:interval, pomodoro: pomodoro)
    end
  end

  factory :interval do
    pomodoro
    start                 DateTime.now
  end

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
