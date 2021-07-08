FactoryBot.define do
  factory :game do
    # mode { [:pvp, :pve, :both].sample }
    mode { %i(pvp pve both).sample }
    release_date { "2021-07-08 10:51:26" }
    developer { Faker::Company.name }
    system_requirement
  end
end
