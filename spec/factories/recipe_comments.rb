FactoryBot.define do
  factory :recipe_comment do
    association :user
    association :recipe
    comment { "MyString" }
  end
end
