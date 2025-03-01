FactoryBot.define do
  factory :item do
    name {Faker::Commerce.product_name}
    category_id { 2 }
    description {Faker::Lorem.sentence}
    status_id { 2 }
    postage_id { 2 }
    prefecture_id { 2 }
    shopping_date_id { 2 }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/123.jpg'), 'image/jpg') }

    association :user 
  end
end