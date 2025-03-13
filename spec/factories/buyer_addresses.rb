FactoryBot.define do
  factory :buyer_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_name { '青山ビル' }
    telephone_number { '09012345678' }
  end
end
