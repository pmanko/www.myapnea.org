FactoryGirl.define do
  factory :user do
    first_name "Bob"
    last_name "Dole"
    sequence(:email) {|n| "user_email_#{n}@example.com"}
    password "my_password"

    factory :registered_user do

    end

    factory :confirmed_user do
      after(:create) do |user|
        user.confirm!
      end
    end
  end


end
