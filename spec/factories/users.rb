FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { 'a123456' }
    password_confirmation { password }
    myouji                { '山田' }
    name                  { '太郎' }
    myouji_kana           { 'ヤマダ' }
    name_kana             { 'タロウ' }
    birth_date            { '1931-01-01' }
  end
end
