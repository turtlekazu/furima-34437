FactoryBot.define do
  factory :order_shipping do
    postal_code { '123-4567' }
    prefecture_id { rand(2..48) }
    city { Faker::Address.city }
    address_line1 { Faker::Address.secondary_address }
    address_line2 { Faker::Address.building_number }
    phone_number { '01234567890' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
