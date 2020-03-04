FactoryBot.define do

  factory :user do
    nickname              {"test"}
    sequence(:email)      { Faker::Internet.email }
    password              {"123456"}
    password_confirmation {"123456"}
  end

end