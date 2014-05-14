FactoryGirl.define do
  factory :user do
    first_name "Bob"
    last_name "Dole"
    sequence(:email) {|n| "user_email_#{n}@example.com"}
    year_of_birth 1988
    zip_code '02141'
    password "my_password"

    factory :registered_user do
      accepted_pledge_at { Time.zone.now }
      accepted_consent_at { Time.zone.now }
    end

    factory :confirmed_user do
      after(:create) do |user|
#        user.confirm!
      end
    end
  end
end