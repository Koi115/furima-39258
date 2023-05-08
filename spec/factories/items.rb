FactoryBot.define do
  factory :item do
    name                  { Faker::Name.name }
    description           { Faker::Lorem.sentence }
    category_id           { Faker::Number.between(from: 2, to: 11) }
    status_id             { Faker::Number.between(from: 2, to: 7) }
    fee_id                { Faker::Number.between(from: 2, to: 3) }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    period_id             { Faker::Number.between(from: 2, to: 4) }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
