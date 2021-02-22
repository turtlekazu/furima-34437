FactoryBot.define do
  factory :item do
    name                   {Faker::Device.model_name}
    info                   {Faker::Device.manufacturer}
    category_id            {rand(2..11)}
    sales_status_id        {rand(2..7)}
    shipping_fee_id        {rand(2..3)}
    prefecture_id          {rand(2..48)}
    scheduled_delivery_id  {rand(2..4)}
    price                  {rand(300..9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'img')
    end
  end
end
