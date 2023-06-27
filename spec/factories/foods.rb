FactoryBot.define do
  factory :food do
    name { 'MyString' }
    measurement_unit { 'MyString' }
    price { 1 }
    quantity { 1 }
    user_id { 1 }
  end
end
