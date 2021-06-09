FactoryBot.define do
  factory :user do
    name                  {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              { 'abcd12' }
    password_confirmation { 'abcd12' }
  end
end