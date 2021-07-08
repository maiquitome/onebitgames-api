FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price(range: 100.0..400.0) }

    after :build do |product|
      # o create salva no banco de dados, ao contrário do build(:something)
      product.productable = create(:game)
    end
  end
end
