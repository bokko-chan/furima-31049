FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    explain {Faker::Lorem.sentence}
    category_id {2}
    status_id {2}
    carriage_id {2}
    area_id {2}
    send_id {2}
    price {Faker::Number.within(range:300..9999999)}
    association :user

    after(:build) do |img|
      img.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image_jpg')
    end
  end
end
