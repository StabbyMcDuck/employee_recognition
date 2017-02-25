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

    role_type do
      generate :user_role_type
    end

    signature "the_signature"

  end

  sequence(:user_email) do |n|
    "email#{n}@example.com"
  end

  sequence(:user_role_type, User.role_types.keys.cycle)
end
