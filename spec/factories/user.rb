FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "123456" }
    password_confirmation { "123456" }
    # profile { [:admin, :client].sample }
    profile { %i(admin client).sample }
  end
end