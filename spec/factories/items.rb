FactoryBot.define do
  factory :item do
    name                  { 'テレビ' }
    profile               { '32型です' }
    category_id           { 1 }
    status_id             { 1 }
    shippingarea_id       { 1 }
    shippingcharge_id     { 1 }
    daystoship_id         { 1 }
    price                 { '20000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
