FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { '太ろウ' }
    last_name { 'やマ田' }
    first_name_reading { 'タロウ' }
    last_name_reading { 'ヤマダ' }
    birth_date { Faker::Date.birthday }
  end
end
