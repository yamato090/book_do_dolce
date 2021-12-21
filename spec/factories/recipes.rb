FactoryBot.define do
  factory :recipe do
    association :user
    name { "MyString" }
    description { "MyText" }
    procedure { "MyText" }
    ingredients { "MyText" }
    calories { 1 }
    cost { 1 }
    image_id { "MyString" }
  end
end
