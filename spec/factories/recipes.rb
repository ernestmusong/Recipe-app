FactoryBot.define do
  factory :recipe do
    name { 'MyString' }
    preparation_time { '2023-06-27 04:46:41' }
    cooking_time { '2023-06-27 04:46:41' }
    description { 'MyString' }
    public { false }
    user_id { 1 }
  end
end
