FactoryBot.define do
  factory :hotel do
    name        { 'Aの宿' }
    category_id { 6 }
    after(:build) do |hotel|
      hotel.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end

    
  end
end
