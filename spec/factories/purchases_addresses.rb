FactoryBot.define do
  factory :purchases_address do
    municipalities    { '横浜市緑区' }
    address           { '青山1-1' }
    postal_code       { '123-4567' }
    building_name     { '青山ビル103号室' }
    telephone_number  { '09011112222' }
    shippingarea_id   { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
