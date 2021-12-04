FactoryBot.define do
  factory :user do
    first_name { 'hoge' }
    last_name { 'fuga' }
    nickname { 'hogefuga' }
    email { Faker::Internet.email }
    password { 'password' }
   end
end
