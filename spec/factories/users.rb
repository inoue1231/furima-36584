FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example.com'}
    password              {'a123456'}
    password_confirmation {password}
    myouji                {'山田'}
    name                  {'太郎'}
    myouji_kana           {'ヤマダ'}
    name_kana             {'タロウ'}
    birth_date            {'1931-01-01'}

    
  end
end