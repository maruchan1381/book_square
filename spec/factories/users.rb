FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.unique.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end