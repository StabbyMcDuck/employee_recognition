FactoryGirl.define do
  factory :award do
    award_type { generate :award_type }
    association :granter, factory: :user

    factory :user_award do
      association :employee, factory: :user
    end

    factory :non_user_award do
      employee_email{ generate :user_email }
      employee_name{ Faker::GameOfThrones.character }
    end
  end

  sequence :award_type do |n|
    "Award type: #{n}"
  end
end
