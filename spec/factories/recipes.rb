FactoryBot.define do
  factory :recipe do
    user_id { 1 }
    name { "MyString" }
    description { "MyText" }
    procedure { "MyText" }
    ingredients { "MyText" }
    calories { 1 }
    cost { 1 }
    image_id { "MyString" }
  end
end
