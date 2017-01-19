FactoryGirl.define do
  factory :user do
    name do
      Faker::GameOfThrones.character
    end

    email do
      generate :user_email
    end

    password 'password'

    password_confirmation do
      password
    end
  end

  sequence(:user_email) do |n|
    "email#{n}@example.com"
  end
end
