FactoryBot.define do
  factory :review do
    total_score    { 2 }
    comment        {Faker::Lorem.sentence}
    association :user
    association :hotel

    
  end
end