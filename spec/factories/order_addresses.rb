FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    item_id { 1 }
    user_id { 1 }
    token { 'tok_xxxxxxxxxxxxxxxxx' }
  end
end
