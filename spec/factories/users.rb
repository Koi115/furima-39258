FactoryBot.define do
  factory :user do
    nickname              { 'test1' }
    email                 {Faker::Internet.free_email}
    password              { '111111a' }
    password_confirmation { password }
    name_last             { '山田' }
    name_first            { '太郎' }
    name_last_kana        { 'ヤマダ' }
    name_first_kana       { 'タロウ' }
    birth_date            { '2000-01-01' }
  end
end
