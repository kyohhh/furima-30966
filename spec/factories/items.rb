FactoryBot.define do
  factory :item do
    item_name           { Faker::Name.name }
    description         { 'あいうえお' }
    category_id         { 2 }
    state_id            { 2 }
    shipping_charges_id { 2 }
    prefecture_id       { 2 }
    days_to_ship_id     { 2 }
    price               { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
