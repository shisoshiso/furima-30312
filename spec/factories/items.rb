FactoryBot.define do
  factory :item do
    title                 { 'test-title' }
    description           { 'test-description' }
    category_id           { '2' }
    item_status_id        { '2' }
    delivery_fee_id       { '2' }
    ship_from_area_id     { '2' }
    days_to_delivery_id   { '2' }
    price                 { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
