FactoryBot.define do
  factory :recipe_comment do
    comment { "MyString" }
    user { nil }
    recipe { nil }
  end
end
